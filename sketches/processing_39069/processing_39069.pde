
//Ryan Coleman
//Homework 5.1
//Sept 25.11

//Setup drawing

void setup () {
  
  size (400, 400);
  background (30);
  smooth ();
}

//Setup draw function that will use the predefined blinkingDots function

void draw () {
  
  frameRate (0.75);
  blinkingDots ();
  whiteDots ();
}

//Draw sequence of shifting dots that reset with every frame

void blinkingDots () {

  background(30);
  for (int dotX = 30; dotX < width-10; dotX += 20) {
    for (int dotY = 30; dotY < height-10; dotY += 20) {
      noStroke ();
      fill (random (0, 255), 0, random (0, 255));
      ellipse (dotX + random (-5, 5), dotY + random (-5, 5), 10, 10);
    }
  }
}

/*Reorder coordinate system (origin at 0,0) and
 draw foreground ellipse at 15% opacity*/

void whiteDots () {

  pushMatrix ();
  translate (width/2, height/2);

  ellipseMode (CENTER);
  fill (255, 15);
  ellipse (random (-50, 50), random (-50, 50), 450, 450);

  popMatrix ();
}


