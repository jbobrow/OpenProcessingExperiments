
color backgr = #34b241;
color circol = #4dcc59;
color white = color(255);

void setup() {
  size(405, 485);
  noFill();
  background(backgr);
  smooth();
}

void draw_grid() {
  background(backgr);
  float incr = 80;
  for (float x= incr/2 - 30; x < width; x +=incr) {
    for (float y =incr/2 -30 ; y < height; y += incr) {
      if (random(200)>120) {
        noStroke();
        fill(white,200);
      } 
      else {
        strokeWeight(2);
        stroke(circol);
        noFill();
      }
      rect(x, y, incr-10, incr-10);
    }
  }
}

void draw() {
}

void mousePressed() {
  draw_grid();
}
