
/* Douglas Tran March 10 Creative Computing Rory Solomon */

float[] a;

void setup() {
  size(500, 500);
  a = new float[8];
  int i = 0;
  while ( i <= 7 ) {
    a[i] = 200;
    i = i + 1;
  }
}

void draw() {
  background(255);
  int i = 0;
  while ( i <= 7 ) {
    fill(0,0,0,100);
    rect (i*50+50, a[i], 50, 50);
    fill (random(0, 255));
    rect (i*50+50, a[i], 10, 10);
    rect (i*50+90, a[i], 10, 10);
    fill(255, 0, 0);
    ellipse(i*50+75, a[i]+25, 10, 10);
    line (i*50+50, a[i], 250, 10);
        line (i*50+100, a[i], 250, 10);
    if ( mouseX > i*50 && mouseX < i*50+100 ) {
      a[i] = a[i] + random(-20, 20);
    }
    i = i + 1;
  }
}



