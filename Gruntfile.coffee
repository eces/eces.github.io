module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    ###
    https://github.com/gruntjs/grunt-contrib-coffee
    dev, prod 모드 공통. coffee를 js로 컴파일
    ###
    coffee:
      dev:
        expand: true
        flatten: false
        cwd: ''
        src: [
          'assets/js/*.coffee'
        ]
        ext: '.js'
      prod:
        compile_all:
          expand: true
          flatten: false
          cwd: ''
          src: [
            'assets/js/*.coffee'
          ]
          ext: '.js'
      
    ###
    https://github.com/gruntjs/grunt-contrib-uglify
    prod 모드에서만, js 파일을 minify 시킴
    ###
    # uglify:
    #   options: 
    #     report: 'gzip'
    #     wrap: false
    #     mangle: false
    #     compress:
    #       drop_console: true
    #     # banner: "/* <%= pkg.name %> - v<%= pkg.version %> - <%= grunt.template.today('yyyy-mm-dd') %> */"
    #   minify_all:
    #     files: [
    #       {
    #         expand: true
    #         cwd: ''
    #         src: [
    #           '*.js'
    #           '!newrelic.js'
    #           '!Gruntfile.js'
    #         ]
    #       }
    #     ]

    ###
    https://github.com/gruntjs/grunt-contrib-less
    dev 모드에서는, 예쁜 css로 컴파일
    prod 모드에서는, minified and gzip compressed css로 컴파일
    ###
    less:
      dev:
        options:
          paths: [
            'assets/css'
          ]
          compress: false
          cleancss: false
        expand: true
        flatten: false
        cwd: ''
        # src: [
        #   'assets/css/*.less'
        # ]
        files: [
          'assets/css/bootstrap.css': 'assets/css/bootstrap/bootstrap.less'
          'assets/css/main.css': 'assets/css/main.less'
        ]
        ext: '.css'
         
      prod:
        options:
          paths: [
            'assets/css'
          ]
          compress: true
          cleancss: true
          report: 'gzip'
        expand: true
        flatten: false
        cwd: ''
        files: [
          'assets/css/bootstrap.css': 'assets/css/bootstrap/bootstrap.less'
          'assets/css/main.css': 'assets/css/main.less'
        ]
        ext: '.css'

    
    ###
    https://github.com/gruntjs/grunt-contrib-watch
    dev 모드에서만, coffee, less를 watch하여 다시 컴파일
    ###
    watch:
      coffee:
        files: [ '**/*.coffee' ]
        tasks: [ 'coffee:dev' ]
      less:
        files: [ '**/*.less' ]
        tasks: [ 'less:dev' ]
    
    ###
    https://github.com/sindresorhus/grunt-concurrent
    dev 모드에서만 이용함. 여러개의 task를 동시에 실행시킴
    ###
    # concurrent:
    #   debug: 
    #     tasks: [ 'nodemon', 'watch' ]
    #     options:
    #       logConcurrentOutput: true

    # env:
    #   # options:
    #   dev:
    #     NODE_ENV: 'development'
    #   test:
    #     NODE_ENV: 'test'
    #   'test-verbose':
    #     NODE_ENV: 'test-verbose'
    #   prod:
    #     NODE_ENV: 'production'

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'

  grunt.registerTask 'default', () ->
    grunt.log.writeln 'You can use: \n\tgrunt compile\n\tgrunt serve'
  grunt.registerTask 'compile', ['coffee:prod', 'less:prod']
  grunt.registerTask 'serve', ['coffee:dev', 'less:dev', 'watch']