
//Ryan Coleman
//Homework 4.3 : Transformations / Loops
//Sept 19.11

//set drawing rules
void setup () {

  size (400, 400);
  background (0);
  smooth ();
  ellipseMode(CENTER);
}

//set parameters
void draw () {

  frameRate(2);

  for (int i=0; i<=360; i+=45) {

    pushMatrix ();

    //set all items to rotate at 45 degrees
    translate(width/2, height/2);
    rotate (radians(i));

    //generate green ellipses
    fill (115, 190, 70);
    ellipse (150, 0, 50, 50);

    //generate dials
    line (150, 0, random (125, 175), random(25, (-25)));

    //generate items on radar
    fill(0);
    ellipse (random(125, 175), random(0, 25), 2, 2);

    popMatrix();
  }
}


