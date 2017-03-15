/* global angular */

(function() {
  angular.module("app").controller("privateMessagesCtrl", function($scope, $http) {
    $scope.setup = function(id) {
      // modify http get request to pass in chatroom param
      // https://stackoverflow.com/questions/13760070/angularjs-passing-data-to-http-get-request
      // could also modify url to automatically pass in a param, but i'm lazy
      $http({method: "GET", url: "/api/v1/messages.json", params: {chatroom_id: id}}).then(function(response) {
        $scope.messages = response.data;
      });
    };

    $scope.createNewMessage = function(body, currentUserId, chatroomId) {
      if (body) {
        var params = {
          body: body,
          user_id: currentUserId,
          chatroom_id: chatroomId
        };
        $http.post("/api/v1/messages.json", params).then(function(response) {
          $scope.newMessageBody = "";
        });
      }
    };

    $scope.enterNewMessage = function(e, body, currentUserId, chatroomId) {
      var keycode = e.keyCode ? e.keyCode : e.which;
      // this checks to see if the user has hit the enter key or not.
      // more info here: https://css-tricks.com/snippets/javascript/javascript-keycodes/
      if (keycode == 13) {
        $scope.createNewMessage(body, currentUserId, chatroomId);
      }
    };
  });
})();