bower        = require 'gulp-bower'
browserify   = require 'gulp-browserify'
bump         = require 'gulp-bump'
clean        = require 'gulp-clean'
coffee       = require 'gulp-coffee'
concat       = require 'gulp-concat'
connect      = require 'connect'
declare      = require 'gulp-declare'
fs           = require 'fs'
haml         = require 'gulp-haml'
handlebars   = require 'gulp-handlebars'
http         = require 'http'
gulp         = require 'gulp'
git          = require 'gulp-git'
gutil        = require 'gulp-util'
livereload   = require 'gulp-livereload'
minifyCSS    = require 'gulp-minify-css'
open         = require "gulp-open"
path         = require 'path'
plumber      = require 'gulp-plumber'
prettify     = require 'gulp-prettify'
sass         = require 'gulp-sass'
usemin       = require 'gulp-usemin'
uglify       = require 'gulp-uglify'
watch        = require 'gulp-watch'
del          = require 'del'

# Paths to source files

hamlStagePath   = './stage/stage.haml'
hamlPath        = './app/haml/**/*.haml'
cssPath         = './app/scss/main.scss'
cssStagePath    = './stage/stage.scss'
coffeePath      = './app/coffee/**/*.coffee'
coffeeStagePath = "./stage/**/*.coffee"


htmlStage = ->
  gulp.src hamlStagePath
    .pipe haml() 
    .pipe gulp.dest('./server/') 

html = ->
  gulp.src( hamlPath )
    .pipe haml() 
    .pipe handlebars()
    .pipe declare( namespace:'handlebars', noRedeclare: true )
    .pipe concat('handlebars-templates.js') 
    .pipe gulp.dest('./server/js') 

gulp.task 'hamls', -> html()


css = ->
  # Stage css - not included in build
  gulp.src( cssPath )
    .pipe sass({errLogToConsole: true}) 
    .pipe gulp.dest('./server/css') 

cssStage = ->
  # Stage css - not included in build
  gulp.src( cssStagePath )
    .pipe sass({errLogToConsole: true}) 
    .pipe gulp.dest('./server/stage/css') 

js = ->
  # App
  gulp.src( coffeePath )
    .pipe plumber() 
    .pipe coffee( bare: true ).on( 'error', gutil.log ) .on( 'error', gutil.beep )
    .pipe concat('app.js') 
    .pipe gulp.dest('server/js') 

jsStage = ->
  gulp.src coffeeStagePath
    .pipe plumber() 
    .pipe coffee( bare: true ).on('error', gutil.log).on( 'error', gutil.beep )
    .pipe concat('init.js') 
    # .pipe browserify( insertGlobals : true, debug : !gutil.env.production )
    .pipe gulp.dest('server/stage/js') 

copyBowerLibs = ->
  bower().pipe gulp.dest('./server/bower-libs/')

copyFilesToBuild = ->
  gulp.src( './server/js/*' ).pipe gulp.dest('./rel/') 
  gulp.src( './server/css/main.css' ).pipe gulp.dest('./rel/') 

pushViaGit = ->
  # Start out by reading the version number for commit msg, then git push, etc..
  fs.readFile './bower.json', 'utf8', (err, data) =>
    regex   = /version"\s*:\s*"(.+)"/
    version = data.match(regex)[1]
    gulp.src('./')
      .pipe git.add()
      .pipe git.commit("BUILD - #{version}")
      .pipe git.push 'origin', 'master', (err)=> console.log( err)

bumpBowerVersion = ->
  gulp.src('./bower.json')
    .pipe bump( {type:'patch'} )
    .pipe(gulp.dest('./'));


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Livereload Server
server = ->
  port      = 3000
  hostname  = null # allow to connect from anywhere
  base      = 'server'
  directory = 'server'
  app = connect()
    .use( connect.static(base) )
    .use( connect.directory(directory) )

  http.createServer(app).listen port, hostname

# Open in the browser
launch = ->
  gulp.src("./stage/stage.haml") # An actual file must be specified or gulp will overlook the task.
    .pipe(open("", 
      url: "http://0.0.0.0:3000/stage.html",
      app: "google chrome"
    ))

# Livereload Server
watchAndCompileFiles = (cb)->
  watch { glob:coffeePath      },  -> js().pipe        livereload() 
  watch { glob:cssPath         },  -> css().pipe       livereload()
  watch { glob:hamlPath        },  -> html().pipe      livereload() 
  watch { glob:coffeeStagePath },  -> jsStage().pipe   livereload() 
  watch { glob:cssStagePath    },  -> cssStage().pipe  livereload()
  watch { glob:hamlStagePath   },  -> htmlStage().pipe livereload() 


# ----------- BUILD (rel) ----------- #

gulp.task 'rel:clean',        (cb) -> del ['./rel/'], cb
gulp.task 'bumpVersion',      ()   -> bumpBowerVersion()
gulp.task 'compileFiles',     (cb) -> js(); jsStage(); css(); cssStage(); htmlStage(); html()
gulp.task 'copyBuiltFiles',   ()   -> copyFilesToBuild()
gulp.task 'rel', ['rel:clean', 'bumpVersion', 'compileFiles', 'copyBuiltFiles'], -> pushViaGit()


  # ----------- MAIN ----------- #

gulp.task 'clean',                 (cb) -> del ['./server/*',], cb
gulp.task 'bowerLibs', ['clean'],  (cb) -> copyBowerLibs();
gulp.task 'server', ['bowerLibs'], ()   ->  watchAndCompileFiles(); server(); launch()
gulp.task 'default', ['server']

