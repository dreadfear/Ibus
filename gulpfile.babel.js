'use strict';

var gulp = require('gulp'),
	HubRegistry = require('gulp-hub'),
	hub = new HubRegistry(['init/*.js']),
	browserSync=require('browser-sync'),
	plugins = require('gulp-load-plugins')();
	gulp.registry(hub),


gulp.task('start',()=>{
	browserSync.init({
		server: {
			baseDir: "./dist"
		},port: 3000,
	})
		gulp.watch(['./src/_components/**/*.pug','./src/templates/**/*.pug'], gulp.series('create-html'))

		gulp.watch('./src/_components/**/*.sass', gulp.series('create-sass'))

		gulp.watch('./src/js/**/*.js', gulp.series('create-script'))
		gulp.watch(['./src/img/*.*'], gulp.series('clean-img','copy-images'))
		gulp.watch('./config.json', gulp.series('concat-css', 'concat-js'))
		gulp.watch('./dist').on('change', browserSync.reload)
})



gulp.task('default',
	gulp.series(
		'clean',
		'copy-favicon',
		'copy-fonts',
		'copy-webfonts',
		'copy-images',
		'concat-css',
		'concat-js',
		'create-html',
		'create-sass',
		'create-script',
		'start'


	)
)
