module.exports =
  activate: ->
    atom.commands.add 'atom-text-editor',
      'upper-case:toggle': ->
        editor = atom.workspace.getActiveTextEditor()
        toggleUpperCaseInSelection(editor)

# Public: Executes the replacement function on each selection in the editor.
#
# * `editor` {TextEditor} to replace selections in.
toggleUpperCaseInSelection = (editor) ->
  editor.mutateSelectedText (selection) ->
    text = selection.getText()
    
    if /[a-z]/.test( text )
      text = text.toUpperCase()
    else
      text = text.toLowerCase()
      
    selection.delete()
    selection.insertText(text, {
        select: true
    })
