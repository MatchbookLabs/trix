#= require trix/views/text_view

{makeElement} = Trix

class Trix.BlockView extends Trix.ObjectView
  constructor: ->
    super
    @block = @object
    @attributes = @block.getAttributes()

  createNodes: ->
    comment = document.createComment("block")
    nodes = [comment]
    if @block.isEmpty()
      nodes.push(makeElement("br"))
    else
      textConfig = Trix.config.blockAttributes[@block.getLastAttribute()]?.text
      textView = @findOrCreateCachedChildView(Trix.TextView, @block.text, {textConfig})
      nodes.push(textView.getNodes()...)
      nodes.push(makeElement("br")) if @shouldAddExtraNewlineElement()

    if @attributes.length
      # GF Modified: Since we prevent grouping, container elements are
      # responsible for themselves?
      element = @createContainerElement(0)
    else
      element = makeElement(Trix.config.blockAttributes.default.tagName, {className: @getClassName()})

    element.appendChild(node) for node in nodes
    [element]

  createContainerElement: (depth) ->
    attribute = @attributes[depth]
    config = Trix.config.blockAttributes[attribute]
    makeElement(config.tagName, {className: @getClassName()})

  getClassName: ->
    @block.alignment

  # A single <br> at the end of a block element has no visual representation
  # so add an extra one.
  shouldAddExtraNewlineElement:->
    /\n\n$/.test(@block.toString())
