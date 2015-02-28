
void setup() {
size(800,400);
smooth();
ellipseMode(CORNER);
background(255);
noStroke ();
noLoop ();
}

int t=1;
int o=20;

void draw () {
for (float xvar = 0; xvar < width; xvar = xvar + 40) {
 for (float yvar = 0; yvar < height; yvar = yvar + 30) {
      fill(255,0,0,o);
      ellipse (xvar, yvar, t, t);
      t=t+10;
      o=o+40;
      if (o>255) {
        o=20;
      }
      if (t>50) {
        t=0;
      }
      rect (xvar*2, yvar*2.5, 2, 2);
    }
  }
}

