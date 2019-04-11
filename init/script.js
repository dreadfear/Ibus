'use strict';
var gulp = require('gulp'),
	concat =require('gulp-concat'),
	babel =require('gulp-babel'),
	terser = require('gulp-terser'),
	smap =require('gulp-sourcemaps')


gulp.task('create-script', () => {
	return gulp.src([
		'./src/_components/**/*.js',
		'./src/js/*.js',
	])
		.pipe(smap.init({ loadMaps: true }))
		.pipe(concat('main.min.js'))
		.pipe(babel({
			presets: ['@babel/env']
		}))
		.pipe(terser())
		.pipe(smap.write('.'))
		.pipe(gulp.dest('./dist/js'))
})
