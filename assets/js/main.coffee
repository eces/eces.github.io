# extends String endsWith, startsWith
if String.prototype.format is undefined
  String.prototype.format = () ->
    _arguments = arguments
    this.replace /{(\d+)}/g, (match, number) ->
      if typeof _arguments[number] isnt 'undefined' then _arguments[number] else match

String.prototype.endsWith = (suffix) ->
  return (this.substr(this.length - suffix.length) is suffix)

String.prototype.startsWith = (prefix) ->
  return (this.substr(0, prefix.length) is prefix)

String.prototype.capitalize = (lower) ->
  if lower
    this.toLowerCase()
  else
    this.replace /(?:^|\s)\S/g, (a) ->
      return a.toUpperCase()

jQuery ->
  `
  jQuery.fn.autolink = function (target) {
      if (target == null) target = '_parent';
    return this.each( function(){
      var re = /((http|https|ftp):\/\/[\w?=&.\/-;#~%-]+(?![\w\s?&.\/;#~%"=-]*>))/g;
      $(this).html( $(this).html().replace(re, '<a href="$1" target="'+ target +'">$1</a> ') );
    });
  }
  `

  $('[data-toggle~=tooltip]').each (k, v) ->
    $(v).tooltip {
      html: true
    }

  $('[data-toggle~=map]').each (k, v) ->
    $(v).click () ->
      alert '지도보기 준비중입니다.'

  imgs = $('div.profile img')
  i = 0
  setInterval (e) ->
    if imgs.length
      imgs.trigger 'mouseout'
      $(imgs[i++%7]).trigger 'mouseover'
  , 2000

  $('.spec-toggler').click ->
    $this = $ this
    $this.next().slideToggle()
  true
