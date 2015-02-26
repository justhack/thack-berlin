var customInterpolationApp = angular.module('thack', []);

customInterpolationApp.config(function($interpolateProvider) {
	$interpolateProvider.startSymbol('[[');
	$interpolateProvider.endSymbol(']]');
});