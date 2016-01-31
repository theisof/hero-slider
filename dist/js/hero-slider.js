(function() {
  var HeroSlider, HeroSliderHeight, target;

  target = '.js-hero-slider';

  HeroSlider = (function() {
    function HeroSlider() {
      this.$slider = $(target);
      this.$slides = this.$slider.children();
      this.speed = this.$slider.data('slide-speed');
      this.count = this.$slides.length;
      this.zIndex = this.count;
      this.index = 0;
      this.scaleIndex = this.index;
      this.$slides.each(function(index) {
        $(this).attr('id', index);
        return $(this).css('z-index', '-' + (index + 1));
      });
      this.startSlider();
    }

    HeroSlider.prototype.startSlider = function() {
      setTimeout((function(_this) {
        return function() {
          _this.applyPanning();
          return _this.scaleIndex++;
        };
      })(this), 10);
      return setInterval((function(_this) {
        return function() {
          _this.shiftLayers();
          _this.applyPanning();
          if (_this.index === _this.count - 1) {
            _this.index = 0;
          } else {
            _this.index++;
          }
          if (_this.scaleIndex === _this.count - 1) {
            return _this.scaleIndex = 0;
          } else {
            return _this.scaleIndex++;
          }
        };
      })(this), this.speed);
    };

    HeroSlider.prototype.shiftLayers = function() {
      var $current;
      $current = this.$slides.closest("#" + this.index);
      $current.addClass('hero-slider-hide');
      setTimeout((function(_this) {
        return function() {
          return $current.css('z-index', '-' + _this.zIndex).removeClass('hero-slider-hide');
        };
      })(this), this.speed - 100);
      return this.zIndex++;
    };

    HeroSlider.prototype.applyPanning = function() {
      var $current;
      $current = this.$slides.closest("#" + this.scaleIndex);
      $current.addClass('hero-slider-scale');
      return setTimeout((function(_this) {
        return function() {
          return $current.removeClass('hero-slider-scale');
        };
      })(this), this.speed + 1000);
    };

    return HeroSlider;

  })();

  $(document).on('ready', function() {
    return new HeroSlider();
  });

  HeroSliderHeight = (function() {
    function HeroSliderHeight() {
      this.$target = $(target);
      this.height = $(window).height();
      this.width = $(window).width();
      this.setHeight();
    }

    HeroSliderHeight.prototype.setHeight = function() {
      var minHeight;
      minHeight = this.width > 768 ? this.height : 0;
      return this.$target.css('height', minHeight + 'px');
    };

    return HeroSliderHeight;

  })();

  $(document).on('ready', function() {
    return new HeroSliderHeight();
  });

  $(window).on('resize', function() {
    return new HeroSliderHeight();
  });

}).call(this);
