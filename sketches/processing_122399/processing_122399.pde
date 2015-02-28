
int cx=100, cy=100, r=10, i=0;
void setup() {
  size(200, 200);
  strokeCap(SQUARE);
}

void draw() {
  background(-1);
  noStroke();
  boolean b = HoverTimer(mouseX, mouseY, pmouseX, pmouseY, r);
  if (b) {
    pushStyle();
    stroke(0);
    noFill();
    strokeWeight(6);
    arc(width/2, height/2, 50, 50, 0, radians(i));
    popStyle();
    i++;
  }
  else {
    i=0;
  }
  if (i>360) {
    fill(255, 0, 0);
    b=!b;
  }
  else {
    fill(0, 255, 0);
  }
  ellipse(cx, cy, 30, 30);
}

boolean  HoverTimer(int x, int y, int cx, int cy, int r) {
  if ( dist(x, y, cx, cy) < r) return true;
  else return false;
}

