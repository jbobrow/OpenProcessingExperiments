
frameRate(25);

rint cs = 40;

void setup() {
  size(600, 600);
  smooth();
}
void draw () {
  background (0);
  noStroke ();

  float x;
  float y;

  for (int i=0; i<=width/cs;i=i+1) {
    for (int j=0; j<=height/cs;j++) {
      x = i*100;
      y = j*100;
      fill (i*45, 150, j*45);
      ellipse (i*cs, j*cs, random(10-100), random(mouseY-mouseX));
    }
  }
  for (int i=0; i<=width/cs;i=i+1) {
    for (int j=0; j<=width/cs;j++) {
      x = i*100;
      y = j*100;
      fill (i*45, 100, j*45);
      ellipse (i*cs, j*cs, random(10-80), random(mouseY-mouseX));
    }
  }
  for (int i=0; i<=height/cs;i=i+1) {
    for (int j=0; j<=width/cs;j++) {
      x = i*100;
      y = j*100;
      fill (i*45, 50, j*45);
      ellipse (i*cs, j*cs, random(10-50), random(mouseY-mouseX));
    }
  }
  for (int i=0; i<=width/cs;i++) {
    for (int j=0; j<=height/cs;j=j+1) {
      x = i*100;
      y = j*100;
      fill (i*cs, j*cs, random(10-25), random(mouseY-mouseX));
      ellipse (x, y, 25, 25);
    }
  }
}



