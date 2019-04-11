var gulp =require('gulp'),
	sass =require('gulp-sass'),
	smap =require('gulp-sourcemaps'),
	cssnano =require('gulp-clean-css'),
	rename =require('gulp-rename'),
	postcss =require('gulp-postcss'),
	autoprefixer =require('autoprefixer');

	gulp.task('create-sass', () => {

		return gulp.src([
			'./src/_components/*.sass',
			'!./src/_components/\_*.sass',
		])
			.pipe(smap.init({ loadMaps: true }))
			.pipe(sass().on('error', sass.logError))
			.pipe(cssnano())
			.pipe(postcss([autoprefixer({
				cascade: false
			})]))
			.pipe(rename({
				suffix: '.min'
			}))
			.pipe(smap.write('.'))
			.pipe(gulp.dest('./dist/css'))
	})
