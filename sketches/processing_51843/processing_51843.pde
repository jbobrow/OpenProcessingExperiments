
/*************************************
 
 *Assignment 02
 *Name: Leslie Tjing
 *Email: Ltjing@haverford.edu
 *Course: CS 110- Section 02
 *Submitted: 2-7-2012
 *
 * Presented here is the futuristic 3-D "Action Lanes" Bowling Alley. In this eye-popping drawing (regarding the pins), you will be able to fill
 the alley with however many bowling balls you would like. I wanted to set parameters to limit the bowling ball
 to be clicked on just the lane and gutter, but did not know how. Nevertheless, as the balls near the horizon, 
 they will decrease in size significantly. It was difficult to set restrictions as to how "small" the ball should be scaled.
 I also wanted to set parameters to limit where you could click to bowling pins but as for right now, this lane has unlimited 3-D "flying" pins.
 **************************************/
PFont f;
int horizon = 350;

void setup () {
  size (700, 800);
  background (201, 173, 102);
  // Alley Background
  noStroke ();
  fill (113, 15, 11);
  rect ( 0, 0, 700, 350);
  smooth ();
  f=loadFont("SynchroLET-48.vlw");
 
  //Backboard 
  fill (18, 70, 198);
  rect ( 60, 0, 578, 225);
  //Frontboard
  noStroke ();
  fill (255, 255, 255, 75);
  rect ( 60, 150, 578, 75);
  //Strobe lights
  fill (200, 200, 30);
  quad ( 60, 150, 170, 225, 250, 225, 200, 150);
  fill (200, 200, 30);
  quad (505, 150, 450, 225, 530, 225, 639, 150);

  //Goal
  fill (0);
  rect (100, 225, 500, 125);
  //Runway 
  fill (149, 125, 110);
  quad (0, 800, 175, 350, 525, 350, 700, 800);
  //Left Gutter
  fill (59, 44, 16);
  quad (100, 350, 0, 800, 80, 800, 175, 350);
  stroke (255);
  strokeWeight (2);
  line (174, 226, 174, 348);
  //Right Gutter
  line (526, 226, 526, 348);
  noStroke ();
  fill (59, 44, 16);
  quad (525, 350, 610, 800, 700, 800, 600, 350);


  //Other Left Lane
  //Backboard
  fill (85, 10, 184);
  rect (0, 0, 55, 225);
  //Frontboard
  noStroke ();
  fill (255, 255, 255, 75);
  rect ( 0, 150, 55, 75);
  //Strobe Light
  fill (200, 200, 30);
  triangle (0, 150, 55, 150, 0, 225);
  //Hole
  fill (0);
  rect (0, 225, 30, 125);
  fill (59, 44, 16);
  triangle (0, 350, 30, 350, 0, 450);

  //Other Right Lane
  //Backboard
  fill (21, 124, 12);
  rect ( 645, 0, 55, 225);
  //Frontboard
  noStroke ();
  fill (255, 255, 255, 75);
  rect ( 645, 150, 55, 75); 
  //Strobe Light
  fill (200, 200, 30);
  triangle (645, 150, 700, 150, 700, 225);
  //Hole
  fill (0);
  rect (670, 225, 30, 125);
  fill (59, 44, 16);
  triangle (670, 350, 700, 350, 700, 450);

  //Circle Design
  fill (113, 15, 11);
  ellipse (160, 190, 20, 20);
  ellipse (190, 190, 20, 20);
  fill (113, 15, 11);
  ellipse (510, 190, 20, 20);
  ellipse (540, 190, 20, 20);

  //Arrows
  fill (113, 15, 11);
  triangle(200, 790, 218, 690, 222, 790);
  triangle(320, 750, 335, 650, 344, 750);
  triangle(440, 790, 448, 690, 462, 790);

  //"Action Lanes"
  textFont(f, 55);
  fill(255, 0, 0);
  text("Action Lanes", 175, 100);
  text("12", 320, 200);

  //Strike Bar
  stroke (255, 100);
  float i=0;
  while (i< 68) {
    rect (61+ i*8, 110, 40, 40);
    i=i+1;
  }
}


void draw () {
}

void mousePressed () {
  float s = (horizon-mouseY)* 0.001;
  if (mouseY > 350) {
    drawBowlingBall (mouseX, mouseY, s);
  } 
  else if (mouseY < 350) {
    drawBowlingPin (mouseX, mouseY, s);
  }
}

void drawBowlingBall (int x, int y, float scal) {
  //How to draw bowling ball
  noStroke ();
  fill (0);
  ellipse (x, y, 300*scal, 300*scal);
  //Fingerholes 
  fill (255);
  ellipse (x-33*scal, y-21*scal, 30*scal, 30*scal);
  fill (255);
  ellipse (x-75*scal, y-25*scal, 30*scal, 30*scal);
}


void drawBowlingPin (int x, int y, float scal) {
  //How to draw bowling pin
  fill (255);
  ellipse ( x, y, 200*scal, 400*scal);
}


