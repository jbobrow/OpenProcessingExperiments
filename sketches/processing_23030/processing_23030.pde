



float r = PI/6;                     // initial rotation

void setup () {
  size (900, 1000);
  smooth();
  background (255);
}

void draw () {


  if (frameCount > 40) {             //if statement to prevent drawing in the upper left corner
    rectMode (CENTER);
    pushMatrix ();
    translate (mouseX, mouseY);         //move the origin point according to mouse value
    rotate (r);
    stroke(255,20);
    fill (random(150), random(10), random(160),5);
    rect (0, 0, 400, 400);               // use 0,0 to position where mouse is
    popMatrix ();
    r += PI/36;                         //increment angle – make smaller to slow rotation
  }
}

