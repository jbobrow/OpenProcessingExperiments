
int d = 0;

void setup() {
  size(400, 400);
}

void draw() {
  background(255, 102, 0);
  fill(255);
  //check if mouse is in the ellipse
  if (dist(width/2, height/2, mouseX, mouseY) <30) {
    fill(0);
  } 
  else {
    fill(255);
    stroke(0);
  }
  ellipse(width/2, height/2, 60, 60);
  fill(0);
  stroke(255);
  ellipse(width/2, height/2, d, d);
  if ( mousePressed && (dist(width/2, height/2, mouseX, mouseY) <30)) {
    d = d + 1;
  }
  if (d > width) {
    d = 0;
  }
  else {
    fill(0, 255, 0);
  }
}
void mouseReleased() {
    d = 0;
  }
