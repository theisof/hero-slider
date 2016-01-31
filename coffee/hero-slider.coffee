target = '.js-hero-slider'

class HeroSlider
  constructor: ->
    @$slider     = $(target)
    @$slides     = @$slider.children()
    @speed       = @$slider.data('slide-speed')
    @count       = @$slides.length
    @zIndex      = @count
    @index       = 0
    @scaleIndex  = @index

    @$slides.each (index) -> 
      $(@).attr 'id', index    
      $(@).css 'z-index', '-' + (index + 1)

    @startSlider()

  startSlider: ->
    setTimeout =>    
      @applyPanning()    
      @scaleIndex++
    , 10

    setInterval =>
      @shiftLayers()
      @applyPanning()

      if @index is @count - 1 then @index = 0 else @index++          
      if @scaleIndex is @count - 1 then @scaleIndex = 0 else @scaleIndex++              
    , @speed     

  shiftLayers: -> 
    $current = @$slides.closest("#" + @index)
    $current.addClass('hero-slider-hide')
    setTimeout =>
      $current
        .css('z-index', '-' + @zIndex)
        .removeClass 'hero-slider-hide'
    , (@speed - 100)

    @zIndex++

  applyPanning: ->
    $current = @$slides.closest("#" + (@scaleIndex))    
    $current.addClass 'hero-slider-scale'

    setTimeout =>
      $current.removeClass 'hero-slider-scale'
    , (@speed + 1000)    

$(document).on 'ready', -> new HeroSlider()

class HeroSliderHeight
  constructor: ->
    @$target  = $(target)
    @height   = $(window).height()
    @width    = $(window).width()

    @setHeight()

  setHeight: ->  
    minHeight = if @width > 768 then @height else 0

    @$target.css 'height', minHeight + 'px'

$(document).on 'ready', -> new HeroSliderHeight()
$(window).on 'resize', -> new HeroSliderHeight()       