
/* Parameterized Form_ Week06_ ID03 */

void setup () {
  size (850, 250);
  smooth ();
  noLoop ();
  noStroke ();
}

void draw () {
  background (54);

  for (int x=70; x<width ; x+=100) {
    int gray= int (random (0, 10));
    float y;
    y = height/2;
    float middle = random (5, 10);
    float thickness = random (20, 39);
    float length = random (40, 90);
    float slant = random (5, 25);
    float scalar = random (0.5, 1.0);
    float circle = random (20, 30);

    //scissors
    fill (random (255), random (255), 255);
    rectMode (CENTER);
    fill (random (255), random (255), 255);
    quad (x-thickness-5, y-length, x-thickness, y-length, x+thickness+5, y+length, x+thickness-5, y+length);
    quad (x+thickness-5, y-length, x+thickness, y-length, x-thickness+5, y+length, x-thickness-5, y+length);

    ellipseMode (CENTER);
    ellipse (x-thickness-8, y+length, circle+5, 35);            //left hole
    ellipse (x+thickness+8, y+length, circle+5, 35);            //right hole

    fill (54);
    ellipse (x+thickness+8, y+length, 20, circle);
    ellipse (x-thickness-8, y+length, 20, circle);



    fill (133, 133, 133);
    ellipse (x-1, y, 8, 9);
  }
}
void mousePressed () {
  redraw();
}



