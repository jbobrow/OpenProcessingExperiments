

void setup() {
  size(300, 300) ;
  background(100, 50, 0) ;
}


void draw() {
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      fill(100, 50, 0);
    }
  } else {
    fill(255);
  }
  noStroke() ;
  ellipse(100, 100, 100, 75);
  ellipse(210, 100, 100, 75);
}


