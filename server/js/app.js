var FinFun;

FinFun = (function() {
  function FinFun() {
    this.mermaid = new Mermaid();
    this.colorPicker = new ColorPicker();
    this.bgPicker = new BackgroundPicker();
    this.fxPicker = new EffectsPicker();
    this.fxPicker = new MermaidPicker();
  }

  return FinFun;

})();

FinFun = FinFun;

var Picker,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

Picker = (function() {
  function Picker(className, options) {
    this.onClickOutsideElement = __bind(this.onClickOutsideElement, this);
    this.onOpenClick = __bind(this.onOpenClick, this);
    var node;
    node = finfun['box-picker']({
      className: className,
      options: options
    });
    this.$node = $(node);
    $('body').prepend(this.$node);
    this.initEvents();
  }

  Picker.prototype.initEvents = function() {
    $('html').on("click", this.onClickOutsideElement);
    $(".active-box", this.$node).on('click', this.onOpenClick);
    return $(".option[default='true']", this.$node).trigger('click');
  };

  Picker.prototype.onOpenClick = function(e) {
    e.stopPropagation();
    return this.$node.addClass('open');
  };

  Picker.prototype.onClickOutsideElement = function(e) {
    return this.$node.removeClass('open');
  };

  return Picker;

})();

var BackgroundPicker,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

BackgroundPicker = (function(_super) {
  __extends(BackgroundPicker, _super);

  function BackgroundPicker() {
    this.onOptionClick = __bind(this.onOptionClick, this);
    var options;
    options = [
      {
        thmb: "bg-ocean1-thmb.jpg",
        full: "bg-ocean1.jpg",
        "default": true
      }, {
        thmb: "bg-ocean2-thmb.jpg",
        full: "bg-ocean2.jpg"
      }
    ];
    BackgroundPicker.__super__.constructor.call(this, "backgroundPicker", options);
  }

  BackgroundPicker.prototype.initEvents = function() {
    $(".option", this.$node).on('click', this.onOptionClick);
    return BackgroundPicker.__super__.initEvents.call(this);
  };

  BackgroundPicker.prototype.onOptionClick = function(e) {
    var bgImage, thmb;
    bgImage = $(e.currentTarget).attr('data_full');
    thmb = $(e.currentTarget).attr('data_thmb');
    $('html').css({
      "background-image": "url(/images/" + bgImage + ")"
    });
    return $('.active-box .image', this.$node).css({
      "background-image": "url(/images/" + thmb + ")"
    });
  };

  return BackgroundPicker;

})(Picker);

var ColorPicker,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

ColorPicker = (function() {
  function ColorPicker() {
    this.onSwatchClick = __bind(this.onSwatchClick, this);
    var left, mid, node, right;
    left = ['#FFFFFF', '#FFA28C', '#FFC38D', '#CDFD9A', '#ADEFFF', '#98CCB6', '#81C6CA', '#6DC2DB', '#58BBED', '#67B2E1', '#7AA8D1', '#919BBE', '#9E93B3', '#F0ACFF', '#FF8DE7', '#FE8CBD', '#EA6874', '#FF575B'];
    mid = ['#ACB3AF', '#FF8800', '#FFB100', '#FFD400', '#FFE800', '#60AD8A', '#35A2B0', '#1E9CC4', '#0492DA', '#1B83C6', '#3C6FA9', '#516296', '#6F507C', '#854268', '#9E3352', '#B32640', '#D41223', '#E90510'];
    right = ['#402520', '#5D362F', '#865149', '#C99387', '#D2B2B3', '#5C8D5F', '#3A7D73', '#1D7084', '#075F8F', '#19547F', '#284B73', '#3B4062', '#4D3553', '#582E49', '#702034', '#7D1829', '#8D0E1B', '#A0030B'];
    node = finfun['color-picker']({
      left: left,
      mid: mid,
      right: right
    });
    this.$node = $(node);
    $('body').prepend(this.$node);
    $('.swatch', this.$node).on('click', this.onSwatchClick);
    $('.swatch', this.$node).trigger('click');
  }

  ColorPicker.prototype.onSwatchClick = function(e) {
    return this.setColor($(e.currentTarget).attr('style').split(':')[1]);
  };

  ColorPicker.prototype.setColor = function(color) {
    ColorPicker.currentColor = color;
    return $(".picked-color").css({
      background: color
    });
  };

  return ColorPicker;

})();

ColorPicker = ColorPicker;

var EffectsPicker,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

EffectsPicker = (function(_super) {
  __extends(EffectsPicker, _super);

  function EffectsPicker() {
    this.onOptionClick = __bind(this.onOptionClick, this);
    var options;
    options = [
      {
        thmb: "fx-normal.gif",
        full: '',
        "default": true
      }, {
        thmb: "fx-blur.gif",
        full: 'blur'
      }
    ];
    EffectsPicker.__super__.constructor.call(this, "effectsPicker", options);
  }

  EffectsPicker.prototype.initEvents = function() {
    $(".option", this.$node).on('click', this.onOptionClick);
    return EffectsPicker.__super__.initEvents.call(this);
  };

  EffectsPicker.prototype.onOptionClick = function(e) {
    var fxClass, thmb;
    EffectsPicker.currentFilter = fxClass = $(e.currentTarget).attr('data_full');
    thmb = $(e.currentTarget).attr('data_thmb');
    return $('.active-box .image', this.$node).css({
      "background-image": "url(/images/" + thmb + ")"
    });
  };

  return EffectsPicker;

})(Picker);

var Mermaid,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

Mermaid = (function() {
  function Mermaid() {
    this.changeMermaid = __bind(this.changeMermaid, this);
    PubSub.subscribe('CHANGE_MERMAID', this.changeMermaid);
  }

  Mermaid.prototype.changeMermaid = function(msg, data) {
    return this.loadMermaid(data);
  };

  Mermaid.prototype.loadMermaid = function(url) {
    if (url == null) {
      url = "images/ColoringCrystal.svg";
    }
    return $.get(url, null, (function(_this) {
      return function(data) {
        var $svgNode, node;
        $svgNode = $("svg", data);
        node = finfun['svg-filters']();
        $svgNode.append($(node));
        $svgNode = $(new XMLSerializer().serializeToString($svgNode[0]));
        $(".svg-holder").empty();
        $(".svg-holder").append($svgNode);
        $(".svg-holder").css({
          opacity: 0
        });
        $(".svg-holder").animate({
          opacity: 1
        }, {
          duration: 500
        });
        return _this.activateMermaid();
      };
    })(this), 'xml');
  };

  Mermaid.prototype.activateMermaid = function() {
    return $("[id^='C_x3E_']").on('click', this.onShapeClick);
  };

  Mermaid.prototype.onShapeClick = function(e) {
    var obj;
    obj = {};
    obj.fill = ColorPicker.currentColor;
    if (EffectsPicker.currentFilter !== "") {
      obj.filter = "url(#" + EffectsPicker.currentFilter + ")";
    } else {
      obj.filter = "";
    }
    return $("path", $(e.currentTarget)).css(obj);
  };

  return Mermaid;

})();

Mermaid = Mermaid;

var MermaidPicker,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

MermaidPicker = (function(_super) {
  __extends(MermaidPicker, _super);

  function MermaidPicker() {
    this.onOptionClick = __bind(this.onOptionClick, this);
    var options;
    options = [
      {
        full: "ColoringDestiny.svg",
        thmb: "destiny-thmb.png",
        "default": true
      }, {
        full: "ColoringAustralia.svg",
        thmb: "australia-thmb.png"
      }, {
        full: "ColoringBrynne.svg",
        thmb: "brynne-thmb.png"
      }, {
        full: "ColoringCrystal.svg",
        thmb: "crystal-thmb.png"
      }, {
        full: "ColoringJia.svg",
        thmb: "jia-thmb.png"
      }, {
        full: "ColoringSelena.svg",
        thmb: "selena-thmb.png"
      }, {
        full: "ColoringWaverlee.svg",
        thmb: "waverlee-thmb.png"
      }
    ];
    MermaidPicker.__super__.constructor.call(this, "mermaidPicker", options);
  }

  MermaidPicker.prototype.initEvents = function() {
    $(".option", this.$node).on('click', this.onOptionClick);
    return MermaidPicker.__super__.initEvents.call(this);
  };

  MermaidPicker.prototype.onOptionClick = function(e) {
    var thmb;
    thmb = $(e.currentTarget).attr('data_thmb');
    $('.active-box .image', this.$node).css({
      "background-image": "url(/images/" + thmb + ")"
    });
    return PubSub.publish('CHANGE_MERMAID', "/images/" + ($(e.currentTarget).attr('data_full')));
  };

  return MermaidPicker;

})(Picker);
