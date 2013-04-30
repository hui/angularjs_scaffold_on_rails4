angular.module('kindeditor', []).directive 'kindeditor', ->
  require: '?ngModel'
  link: (scope, elm, attr, ngModel)->
    unless ngModel then return
    ngModel.$render = (value)->
      unless ngModel.editor
        csrfToken = $('meta[name=csrf-token]').attr('content')
        csrfParam = $('meta[name=csrf-param]').attr('content')

        extraParams = {}
        extraParams[csrfParam] = csrfToken

        ke = KindEditor.create $(elm[0]), basePath: '/kindeditor/', uploadJson: '/upload', extraFileUploadParams: extraParams, afterChange: ()->
          if ke
            ngModel.$setViewValue(ke.html())

        ngModel.editor = ke
      ngModel.editor.html(ngModel.$viewValue)