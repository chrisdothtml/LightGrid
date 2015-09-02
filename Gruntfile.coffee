module.exports = (grunt) ->

	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'

		sass:
			options:
				outputStyle: 'expanded'
				indentType: 'tab'
				indentWidth: '1'
			src:
				expand: true
				src: 'src/<%=pkg.name%>.scss'
				ext: '.css'
		autoprefixer:
			src:
				expand: true
				src: 'src/<%=pkg.name%>.css'
		cssmin:
			dist:
				expand: true
				src: 'src/<%=pkg.name%>.css'
				ext: '.min.css'
		watch:
			css:
				files: ['src/*.scss']
				tasks: ['sass','autoprefixer','cssmin']

	grunt.loadNpmTasks 'grunt-autoprefixer'
	grunt.loadNpmTasks 'grunt-contrib-cssmin'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-sass'

	grunt.registerTask 'default', ['watch']