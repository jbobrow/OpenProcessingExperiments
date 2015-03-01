


float x, y;

void setup() {
  size(400,400);
  rectMode(CENTER);
}


void draw() {
}

void mousePressed() {
  fill(255);
  x = mouseX;
  y = mouseY;
  rect(x, y, 33,33);
}

void mouseReleased() {
  fill(random(255),random(255),random(255));
  rect(x, y, 33,33);
}

void mouseDragged() {
  line(x,y,mouseX,mouseY);
}

