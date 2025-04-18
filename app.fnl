(set (. ngx.header "Content-Type") "text/html")
(local uri ngx.var.uri)

(fn h1 [text]
  (.. "<h1>" text "</h1>"))

(fn p [text]
  (.. "<p>" text "</p>"))

(fn base-template [content]
  (.. "<html><head>
  <title>fennel-sec</title>
  <link rel='stylesheet' href='/static/pico.css'>
  <script src='/static/fixi-0.6.5.js'></script>
</head><body><main class='container'>"
      content
      "</main></body></html>"))

(if (= uri "/")
  (ngx.say (base-template (h1 "Hello from Fennel!")))
  (= uri "/projects") (ngx.say (base-template (.. (h1 "Projects") (p "List of cool stuff here."))))
  (ngx.say (base-template (h1 "Not found"))))
