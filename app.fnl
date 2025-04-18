(set (. ngx.header "Content-Type") "text/html")
(local uri ngx.var.uri)

(if (= uri "/") (ngx.say "<h1>Hello from Fennel!</h1>")
    (= uri "/projects") (ngx.say "projects")
    (ngx.say "not home"))

