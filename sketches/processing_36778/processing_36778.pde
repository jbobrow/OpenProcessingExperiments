
boolean doIt;

void setup () {
  size (600, 500);
  smooth ();
}

void draw () {
  if (doIt) {
    background (255);
    stroke (0);
    noFill ();
    strokeWeight (4);
    beginShape ();
    curveVertex (550, 75);
    curveVertex (550, 75);
    curveVertex (500, 125);
    curveVertex (550, 175);
    curveVertex (500, 225);
    curveVertex (550, 275);
    curveVertex (500, 325);
    curveVertex (500, 325);
    endShape (); 
    for (int a=1; a<60; a += 3) {
      for (int b=1; b<50; b += 3) {
        stroke (0);
        strokeWeight (1);
        fill (random (0, 170), random (0, 255), random (200, 255), random (255));
        ellipse (random (a*10), random (b*10), 15, 15);
      }
    }

    for (int x=5; x<600; x += 10) {
      strokeWeight (2);
      stroke (x*20, x/20, x);
      line (x+x*2.5, 0, x*1.5, 350);
      line (x*1.5, 350, x+x*2.5, 500);
    }

    for (int c=1; c<12; c++) {
      float ax = random (100, width);
      float ay = random (350, 500);
      float bx = random (100, width);
      float by = random (350, 500);
      float cx = random (150, width);
      float cy = random (350, 500);

      noStroke ();
      fill (random (255), 255, 0, random (255));
      triangle (ax, ay, bx, by, cx, cy);
    }
    doIt = false;
  }
}

void mousePressed () {
  doIt = true;
}

