
void setup() {
  size(400, 400);
  colorMode(RGB);
  background(11, 9, 173);
  smooth();
  frameRate(2);
}

void draw() {

  //lines coming from left side
  for (int x=10;x<=width;x+=10) {
    stroke(255, x);
    strokeWeight(.3);
    line(3, 200, 400, x-200);
  }
  //rectangles 
  for (int x=150;x<width;x+=150) {
    stroke(255, x);
    rectMode(CENTER);
    noFill();
    strokeWeight(.3);
    rect (width/2, height/2, x, random(100, 400));
  }
}


