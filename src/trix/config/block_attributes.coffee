Trix.config.blockAttributes = attributes =
  default:
    tagName: "gf-p"
    parse: false
  quote:
    tagName: "blockquote"
    nestable: true
  code:
    tagName: "pre"
    text:
      plaintext: true
  bulletList:
    tagName: "ul"
    parse: false
  bullet:
    tagName: "li"
    listAttribute: "bulletList"
    test: (element) ->
      Trix.tagName(element.parentNode) is attributes[@listAttribute].tagName
  numberList:
    tagName: "ol"
    parse: false
  number:
    tagName: "li"
    listAttribute: "numberList"
    test: (element) ->
      Trix.tagName(element.parentNode) is attributes[@listAttribute].tagName
  big:
    tagName: "h1"
    singleLine: true
  small:
    tagName: "h5"
  leftAligned:
    composed: true
    test: (element) ->
      style = window.getComputedStyle(element)
      style["textAlign"] is "left"
  centerAligned:
    composed: true
    test: (element) ->
      style = window.getComputedStyle(element)
      style["textAlign"] is "center"
  rightAligned:
    composed: true
    test: (element) ->
      style = window.getComputedStyle(element)
      style["textAlign"] is "right"
