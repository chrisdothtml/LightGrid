module.exports = (grunt) ->

	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'

		sass:
			options:
				style: 'compressed'
			dist:
				files:
					'src/lightgrid.css': 'src/lightgrid.scss'
		autoprefixer:
			main:
				src: 'src/lightgrid.css'
				dest: ''
		cssmin:
			target:
				files:
					'src/lightgrid.min.css': ['src/lightgrid.css']
		watch:
			css:
				files: ['src/*.scss']
				tasks: ['sass','autoprefixer','cssmin']

	grunt.loadNpmTasks 'grunt-autoprefixer'
	grunt.loadNpmTasks 'grunt-contrib-cssmin'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-sass'

	grunt.registerTask 'default', ['watch']