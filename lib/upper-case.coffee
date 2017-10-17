module.exports =
  activate: ->
    atom.commands.add 'atom-text-editor',
      'upper-case:toggle': ->
        editor = atom.workspace.getActiveTextEditor()
        toggleUpperCaseInSelection(editor, titleCase)

# Public: Executes the replacement function on each selection in the editor.
#
# * `editor` {TextEditor} to replace selections in.
# * `fn` {Function} to use to replace selected text.
toggleUpperCaseInSelection = (editor, fn) ->
  editor.mutateSelectedText (selection) ->
    text = selection.getText()
    
    if /^[\$_A-Z\d]+$/.test( text )
      text = text.toLowerCase()
    else
      text = text.toUpperCase()
      
    selection.delete()
    selection.insertText(text)
