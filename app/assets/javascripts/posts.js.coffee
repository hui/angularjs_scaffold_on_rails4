root = global ? window

angular.module("posts", ["ngResource"]).factory "Post", ['$resource', ($resource) ->
  Post = $resource("/posts/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

    destroy:
      method: "DELETE"
  )
  Post::destroy = (cb) ->
    Post.remove
      id: @id
    , cb

  Post
]
root.angular = angular
