
float[] oldx = new float [100];
float[] oldy = new float [100];
float[] clr = new float [256];
float a;

void pstn() {

  int i = 0;
  while (i < oldx.length) { 
    oldx[i] = 0;
    oldy[i] = random(height);
    clr[i] = random(256);
    i++;
    a = random(HALF_PI);
  }
}



void setup () {
  size(400, 700);
  background (0);
  colorMode(HSB);
  pstn();
}

void vibe() {
  int i = 0;
  while (i < oldx.length) {
    stroke(clr[i], 70);
    strokeWeight(0.5);
    float[] newx = new float [100];
    float[] newy = new float [100];
    newx[i] = oldx[i] + cos(a)*5;
    newy[i] = oldy[i] + sin(a)*2*cos(a)*3;

    line (oldx[i], oldy[i], newx[i], newy[i]);
    oldx[i] = newx[i];
    oldy[i] = newy[i];

    a = random(-PI+HALF_PI, HALF_PI);

    if (oldx[i] - 50 > width) {
      //background(0);
      pstn();
    }
    i++;
  }
}

void draw() {
  //fill(255, 10);
  //rect(0, 0, width, height);
  vibe();
}

void mousePressed() {
  saveFrame("graphic.png");
}

