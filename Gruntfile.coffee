module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          'dist/js/hero-slider.js': 'coffee/hero-slider.coffee', 

    sass:
      dist:
        options:
          sourcemap: 'none'
        files:
          'dist/css/hero-slider.css' : 'sass/hero-slider.scss'

    postcss:
      options:
        processors:
          require('autoprefixer')({browsers: 'last 2 versions'})
      dist: 
        src: 'dist/css/*.css'
             
    watch:
      coffee:
        files: [ 'coffee/*.coffee' ]
        tasks: [ 'coffee' ]
      sass:
        files: [ 'sass/*.scss' ]
        tasks: [ 'sass' ]        
      # postcss:
      #   files: [ 'dist/css/*.css' ]
      #   tasks: [ 'postcss' ]        

  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-postcss')
  grunt.loadNpmTasks('grunt-contrib-sass')

  grunt.registerTask('default', ['coffee', 'sass', 'postcss']);  
