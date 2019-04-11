'use strict';
var gulp = require('gulp');

	gulp.task('copy-favicon', function () {
		return gulp.src([
				'./src/favicon/**.*',
			])
			.pipe(gulp.dest('./dist/favicon'));
	});

	//Copy fonts
	gulp.task('copy-fonts', function () {
		return gulp.src([
				'./src/fonts/**.*',
			])
			.pipe(gulp.dest('./dist/fonts'));
	});
	gulp.task('copy-webfonts', function () {
		return gulp.src([
				'./src/webfonts/**.*',
			])
			.pipe(gulp.dest('./dist/webfonts'));
	});
	//Copy image
	gulp.task('copy-images', function () {
		return gulp.src([
				'./img/**/*.{png,jpg,jpeg,svg,gif}',
			])
			.pipe(gulp.dest('./dist/img'));
	});
// };
