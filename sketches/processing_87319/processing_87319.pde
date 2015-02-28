
// Not finished
// Draws ellipses and color of the ellipse changes.

float xpos, ypos;
int r = 12;
int a,b,c = 0;
boolean d,e = true;

void setup() {
  size(640, 360);
  background(102);
  noStroke();
  ellipseMode(RADIUS);
  xpos = width/2;
  ypos = height/2;
  frameRate(60);
}

void draw() {
  stroke(255);

  if (mousePressed) {
    noStroke();
    ellipse(pmouseX, pmouseY, r, r);
    fill(a,b,c);
      a++;
    if (a >= 255 || (d == false)) {
      b++;
    }
    if (b >= 255 && (e == true)) {
      c++;
    if (c >= 255) {
      a = 0;
      b = 0;
      c = 0;
      if (d == false) {
      d = true;
    } else {
      if (d == true) {
        d = false;
      }
    }      
  }
}
}
}
