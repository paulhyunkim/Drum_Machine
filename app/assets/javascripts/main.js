var app = angular.module('MainApp', ['ngResource']);

app.config(['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

app.factory('Song', ['$resource', function($resource) {
  return $resource('/songs',
     { },
     {update: { method: 'PATCH'}});
}]);

app.controller('MainController', ['$scope', 'Song', function($scope, Song) {
    $scope.songs = [];

    $scope.newSong = new Song();

    Song.query(function(songs) {
      $scope.songs = songs;
      $scope.currentSong = $scope.songs[0];
    });

    

    $scope.saveSong = function () {
      $scope.newSong.$save(function(song) {
        $scope.songs.push(song)
        $scope.newSong = new Song();
      });
    }

    $scope.deleteSong = function(song) {
      song.$delete(function() {
        position = $scope.songs.indexOf(song);
        $scope.songs.splice(position, 1);
      }, function(errors) {
        $scope.errors = errors.data
      });
    }

    $scope.showSong = function(song) {
      song.details = true;
      song.editing = false;
    }

    $scope.hideSong = function(song) {
      song.details = false;
    }

    $scope.editSong = function(song) {
      song.editing = true;
      song.details = false;
    }

    $scope.updateSong = function(song) {
      song.$update(function() {
        song.editing = false;
      }, function(errors) {
        $scope.errors = errors.data
      });
    }

}])