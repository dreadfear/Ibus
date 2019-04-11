var gulp =require('gulp'),
	pug=require('gulp-pug'),
	plumber=require('gulp-plumber');

gulp.task('create-html',()=>{
	return gulp.src([
				'./src/templates/*.pug',
				'!./src/templates/\_*.pug',
	])	.pipe(plumber())
		.pipe(pug({ pretty: '\t' }))
		.pipe(gulp.dest('./dist'));
})
