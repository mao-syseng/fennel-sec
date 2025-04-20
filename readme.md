# Game
## Very minimal turn based multiplayer game
- 2 players take turns
- simple grid, just HTML
- Tactical like Advance Wars or Into the Breach
- Chess like notation to move
- Manual button to check if other player has moved. Quite limited by Fixi.js and just HTML

## Technology
### openresty with fennel
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

