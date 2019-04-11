'use strict';
var gulp = require('gulp'),
del = require('del');

gulp.task('clean',()=>{
	return del('./dist/')
})

gulp.task('clean-img',()=>{
	return del('./dist/img')
})
