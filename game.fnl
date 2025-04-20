(local grid-size 5)
(local player {:x 1 :y 1})

(fn draw-grid []
  (io.write "\027[2J")
  (for [y 1 grid-size]
    (for [x 1 grid-size]
      (if (and (= x player.x) (= y player.y))
          (io.write " @ ")
          (io.write " . ")))
    (io.write "\n")))

(fn clamp [val min max]
  (math.max min (math.min val max)))

(fn move [dir]
  (match dir
    "w" (set player.y (clamp (- player.y 1) 1 grid-size))
    "s" (set player.y (clamp (+ player.y 1) 1 grid-size))
    "a" (set player.x (clamp (- player.x 1) 1 grid-size))
    "d" (set player.x (clamp (+ player.x 1) 1 grid-size))
    _ nil))

(fn getch []
(os.execute "stty -echo -icanon") ; turn off echo + canonical mode
(let [fh (io.open "/dev/tty" "r")
      ch (fh:read 1)]
  (fh:close)
  (os.execute "stty sane")
  ch))

(fn main []
  (draw-grid)
  (print "Use WASD to move. Press q to quit.")
  (let [input (getch)]
    (when (not= input "q")
      (move input)
      (main))))

(main)
