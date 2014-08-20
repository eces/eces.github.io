(function() {
  if (String.prototype.format === void 0) {
    String.prototype.format = function() {
      var _arguments;
      _arguments = arguments;
      return this.replace(/{(\d+)}/g, function(match, number) {
        if (typeof _arguments[number] !== 'undefined') {
          return _arguments[number];
        } else {
          return match;
        }
      });
    };
  }

  String.prototype.endsWith = function(suffix) {
    return this.substr(this.length - suffix.length) === suffix;
  };

  String.prototype.startsWith = function(prefix) {
    return this.substr(0, prefix.length) === prefix;
  };

  String.prototype.capitalize = function(lower) {
    if (lower) {
      return this.toLowerCase();
    } else {
      return this.replace(/(?:^|\s)\S/g, function(a) {
        return a.toUpperCase();
      });
    }
  };

  jQuery(function() {
    
  jQuery.fn.autolink = function (target) {
      if (target == null) target = '_parent';
    return this.each( function(){
      var re = /((http|https|ftp):\/\/[\w?=&.\/-;#~%-]+(?![\w\s?&.\/;#~%"=-]*>))/g;
      $(this).html( $(this).html().replace(re, '<a href="$1" target="'+ target +'">$1</a> ') );
    });
  }
  ;
    var i, imgs;
    $('[data-toggle~=tooltip]').each(function(k, v) {
      return $(v).tooltip({
        html: true
      });
    });
    $('[data-toggle~=map]').each(function(k, v) {
      return $(v).click(function() {
        return alert('지도보기 준비중입니다.');
      });
    });
    imgs = $('div.profile img');
    i = 0;
    setInterval(function(e) {
      if (imgs.length) {
        imgs.trigger('mouseout');
        return $(imgs[i++ % 7]).trigger('mouseover');
      }
    }, 2000);
    $('.spec-toggler').click(function() {
      var $this;
      $this = $(this);
      return $this.next().slideToggle();
    });
    return true;
  });

}).call(this);
