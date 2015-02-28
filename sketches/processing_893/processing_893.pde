
void setup() {
  size(200, 200);
  background(102);
}


void draw() {

  int x = (int) random(width/4,width-(width/4));
  int y = (int) random(height/4,height-(height/4));


  stroke(255);
  point(x, y);
}

void mouseDragged() {
  fill(102);
  noStroke();
  circle(mouseX,mouseY,10);
}

void circle(int x, int y, int r) {
  ellipseMode(CENTER);
  ellipse(x, y, r*2, r*2);
}



