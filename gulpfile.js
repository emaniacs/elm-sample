'use strict';

var gulp = require('gulp'),
  uglify = require('gulp-uglify'),
  gutil = require('gulp-util'),
  elm = require('gulp-elm'),
  rename = require('gulp-rename');

const OPTIONS = {
  warn: true,
  debug: true,
};

gulp.task('elm-init', elm.init);

gulp.task('default', function(){
  gutil.log("There are no default task");
});

// TASKS

// compile Activity
// gulp.task("activity", ["elm-init"], function(done){
//   var dest = './../public/js';
//   var target = 'activity.js';
//   var targetMin = 'activity.min.js';

//   return gulp.src('./src/Activity/Activity.elm')
//     .pipe(elm(OPTIONS)) // compile
//     .on("error", gutil.log)
//     .pipe(rename(target)) // rename to target
//     .pipe(gulp.dest(dest)) // move
//     .pipe(uglify()) // minimize
//     .pipe(rename(targetMin)) // rename to target
//     .pipe(gulp.dest(dest)); // move
// });
