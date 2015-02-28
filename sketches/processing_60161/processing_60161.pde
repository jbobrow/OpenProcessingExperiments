
PImage kugel;

void setup () {
  size (541, 557);
  smooth ();
  kugel = loadImage("kugel.jpg");
  frameRate (800);
}

void draw () {
  background (0);
  if (mousePressed == true) {
    noCursor();

    for ( int y = 0; y <= width; y+=8)
      for ( int x = 0; x <= width; x+=8) {
        float winkel = atan2(mouseY - y, mouseX - x);
        float durchmesser= mouseX/60;
        if (durchmesser > 0) {
          pushMatrix();
          translate(x, y);
          rotate(winkel);      
          strokeWeight(durchmesser/5);
          stroke(kugel.pixels[0]);
          noStroke();
          fill(kugel.pixels[(x + kugel.width*y)]);
          rect(60, 60, durchmesser, durchmesser);
          rectMode (RADIUS);
          popMatrix();
        }
      }
  }
}


