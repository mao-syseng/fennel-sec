;; Setup
(set (. ngx.header "Content-Type") "text/html")
(local uri ngx.var.uri)

;; Components
(fn base [content] (.. "<html><head><title>fennel-hypermedia</title><link rel='stylesheet' href='/static/pico.css'><script src='/static/fixi-0.6.5.js'></script></head><body><main class='container'>" content "</main></body></html>"))
(fn h1 [t] (.. "<h1>" t "</h1>"))
(fn h2 [t] (.. "<h2>" t "</h2>"))
(fn p [t] (.. "<p>" t "</p>"))
(fn hr [] "<hr/>")
(fn a [t url] (.. "<a href='" url "'>" t "</a>"))
(fn pb [t url] (.. "<button href='" url "'>" t "</button>"))
(fn sb [t url] (.. "<button class='secondary' href='" url "'>" t "</button>"))
(fn cb [t url] (.. "<button class='contrast' href='" url "'>" t "</button>"))

;; Routing
(if (= uri "/") (ngx.say (base (h1 "Hello from Fennel!")))
  (= uri "/projects") (ngx.say (base (.. (h1 "Projects") (p "List of cool stuff here."))))
  (ngx.say (base (.. (h2 "Page not found") (a "Go back" "/")))))
