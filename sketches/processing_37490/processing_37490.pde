
float incr = 0.02;
float rot = PI/2;
int x = 100;
int y = 100;

void setup() {
  size(700, 400);
  background(255);
}

void draw() {
  pushMatrix();
  background(0);
  stroke(255);
  strokeWeight(5);
  translate(width/2, height/2);
  rotate(rot);
  rect(-x/2, -y/2, x, y);
  popMatrix();
  rot = rot + incr;

  incr = dist(mouseX, mouseY, x, y)/10000;

  if (mousePressed == true) {
    x = x+2;
    y = y+2;
  }
  else {
    x = x-2;
    y = y-2;
  }
}
                
