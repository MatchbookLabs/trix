Trix.config.blockAttributes = attributes =
  default:
    tagName: "gf-p"
    leaf: true
    parse: false
  quote:
    tagName: "blockquote"
    nestable: true
    groupable: true
  code:
    tagName: "pre"
    text:
      plaintext: true
    groupable: true
  bulletList:
    tagName: "ul"
    parse: false
    groupable: true
  bullet:
    tagName: "li"
    listAttribute: "bulletList"
    test: (element) ->
      Trix.tagName(element.parentNode) is attributes[@listAttribute].tagName
    groupable: true
  numberList:
    tagName: "ol"
    parse: false
    groupable: true
  number:
    tagName: "li"
    listAttribute: "numberList"
    test: (element) ->
      Trix.tagName(element.parentNode) is attributes[@listAttribute].tagName
    groupable: true

  big:
    tagName: "h1"
    inheritable: true
    leaf: true
  small:
    tagName: "h5"
    inheritable: true
    leaf: true
