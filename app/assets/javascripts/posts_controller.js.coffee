
root = global ? window

PostsIndexCtrl = ($scope, Post) ->
  $scope.posts = Post.query()

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @post
      @post.destroy ->
        $scope.posts = _.without($scope.posts, original)
        
PostsIndexCtrl.$inject = ['$scope', 'Post'];

PostsCreateCtrl = ($scope, $location, Post) ->
  $scope.save = ->
    Post.save $scope.post, (post) ->
      $location.path "/posts/#{post.id}/edit"

PostsCreateCtrl.$inject = ['$scope', '$location', 'Post'];

PostsShowCtrl = ($scope, $location, $routeParams, Post) ->
  Post.get
    id: $routeParams.id
  , (post) ->
    @original = post
    $scope.post = new Post(@original)

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.post.destroy ->
        $location.path "/posts"

PostsShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'Post'];

PostsEditCtrl = ($scope, $location, $routeParams, Post) ->
  Post.get
    id: $routeParams.id
  , (post) ->
    @original = post
    $scope.post = new Post(@original)

  $scope.isClean = ->
    console.log "[PostsEditCtrl, $scope.isClean]"
    angular.equals @original, $scope.post

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.post.destroy ->
        $location.path "/posts"

  $scope.save = ->
    Post.update $scope.post, (post) ->
      $location.path "/posts"

PostsEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'Post'];

# exports
root.PostsIndexCtrl  = PostsIndexCtrl
root.PostsCreateCtrl = PostsCreateCtrl
root.PostsShowCtrl   = PostsShowCtrl
root.PostsEditCtrl   = PostsEditCtrl 