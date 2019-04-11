'use strict';
var gulp = require('gulp'),
	concat =require('gulp-concat'),
	cssnano =require('gulp-clean-css'),
	terser = require('gulp-terser'),
	fs = require('graceful-fs')

gulp.task('concat-css',()  => {
	let config = JSON.parse(fs.readFileSync('./config.json'));
	return gulp.src(config.styles,{
		allowEmpty: true,
	})
		.pipe(concat('library.min.css'))
		.pipe(cssnano())
		.pipe(gulp.dest('./dist/css'));
});



gulp.task('concat-js',()  => {
	let config = JSON.parse(fs.readFileSync('./config.json'));
	return gulp.src(config.scripts,{
		allowEmpty: true,
	})
		.pipe(concat('library.min.js'))
		.pipe(gulp.dest('./dist/js'));
});


gulp.task('concat-build-js',()  => {
	let config = JSON.parse(fs.readFileSync('./config.json'));
	return gulp.src(config.scripts,{
		allowEmpty: true,
	})
		.pipe(concat('library.min.js'))
		.pipe(terser())
		.pipe(gulp.dest('./dist/js'));
});
