
int cx = 0;

void setup() {
  size(400, 225);
  background(210);
  smooth();
}

void draw() {
  // moving circle
  noStroke();
  if ( cx < 5*width/18 || 14*width/18 < cx) {
    fill(100, 200, 100);
  }
  else if ( 7*width/18 >= cx) {
    fill(230, 100, 50);
  }
  else if ( 11*width/18 >= cx) {
    fill(0);
  }
  else if ( 13*width/18 >= cx) {
    fill(50, 100, 230);
  }
  ellipse(cx, height/2, 15, 20);
  cx += 3;

  ANT();
  
if (mousePressed) {
translate(mouseX, mouseY);
scale(0.1);
ANT();
stroke(2);
line(width/4, height/2, 3*width/4, height/2);
}

}

void ANT() {
  strokeWeight(15);

  // A
  stroke(230, 100, 50);
  line(width/3, height/4, 2*width/9, 3*height/4);
  line(width/3, height/4, 4*width/9, 3*height/4);

  // T
  stroke(50, 100, 230);
  line(2*width/3, 2*height/4, 2*width/3, 7*height/8);

  // +
  stroke(0);
  line(width/2, 3*height/8, width/2, 5*height/8);
}
