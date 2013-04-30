angular.module('kindeditor', []).directive 'kindeditor', ->
  require: '?ngModel'
  link: (scope, elm, attr, ngModel)->
    unless ngModel then return
    ngModel.$render = (value)->
      unless ngModel.editor
        ke = KindEditor.create $(elm[0]), basePath: '/kindeditor/', uploadJson: '/upload',afterChange: ()->
          if ke
            ngModel.$setViewValue(ke.html())

        ngModel.editor = ke
      ngModel.editor.html(ngModel.$viewValue)