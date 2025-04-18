
# openresty with fennel
## Technology
- Openresty, Nginx with LuaJIT
- Fennel, lisp that compiles to lua
- Fixi.js, extending hypermedia controls of html. It is only 89 lines of js, 1388 bytes gzipped
- PicoCSS, semantic html styling

## Running locally

to start run openresty run:
    openresty -p $(pwd) -c nginx.conf -g "daemon off;"

to compile fennel:
    fennel --compile app.fnl > out.lua

to run both: 
    fennel --compile app.fnl > out.lua && openresty -p $(pwd) -c nginx.conf -g "daemon off;"


to check logs:
    tail -f errors.log

