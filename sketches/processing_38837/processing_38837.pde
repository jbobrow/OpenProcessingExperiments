
//My first sketch

float backR;
float backG;
float backB;

float speed = 5;
float gravity = 0.1;  
float spX = 269;
float spY = 305;
float sp1X = 330;
float sp1Y = 305;

float mX = 70;
float mY = 130;

float carX = 100;
float carY = 275;

float eyeX = 80;
float eyeY = 285;

float eye1X = 120;
float eye1Y = 285 ;

int circleX = 20;
int circleY = 20;

int circleeX = 20;
int circleeY = 20;

int circle2X = 15;
int circle2Y = 15;

int circlee2X = 15;
int circlee2Y = 15;

int circle3X = 10;
int circle3Y = 10;

int circlee3X = 10;
int circlee3Y = 10;

int circle4X = 5;
int circle4Y = 5;

int circlee4X = 5;
int circlee4Y = 5;

int spotX = 269;
int spotY = 110;

int spot2X = 330;
int spot2Y = 110;

void setup() {
  size(400, 400);
  frameRate(30);  // Set the size of the window
  smooth();
}

void draw() {
  background(255);  // Draw a white background


  ellipseMode(CENTER);
  rectMode(CENTER);


  // red square
  noStroke();
  fill (210, 14, 2);
  rect(100, 100, 200, 200);

  // blue square
  noStroke();
  fill (0, 120, 214);
  rect(300, 100, 200, 200);

  // green square
  noStroke();
  fill (111, 166, 44);
  rect(100, 300, 200, 200);

  // orange square
  noStroke();
  fill (240, 135, 8);
  rect(300, 300, 200, 200);

  //mouse over squares
  if (mouseX < 200 && mouseY < 200) {
    fill(backR, backG, backB);
    rect(100, 100, 200, 200);
    
  } 
  else if (mouseX > 200 && mouseY < 200) {
    circleX = circleX - 1;
    circleY = circleY - 1;
    circleeX = circleeX -1;
    circleeY = circleeY -1;
    circle2X = circle2X -1;
    circlee2X = circlee2X -1;
    circle3X = circle3X -1;
    circlee3X = circlee3X -1;
    circle4X = circle4X -1;
    circlee4X = circlee4X +1;
  } 
  else if (mouseX < 200 && mouseY > 200) {
       carX = carX -2;
       eyeX = eyeX -1;
       eye1X = eye1X -1.5;
       mX = mX -1;
       mY = mY -1;
  } 
  else if (mouseX > 200 && mouseY > 200) {
    fill(255);
   rect(300, 300, 200, 200);
    spY = spY + speed;
    speed = speed + gravity;
      if (spY > height) {
   speed = speed * -0.95;  
  }
  rect(300, 300, 200, 200);
    sp1Y = sp1Y + speed;
    speed = speed + gravity;
      if (sp1Y > height) {
   speed = speed * -0.95;  
  }
  }

  //Random Colors
  backR = random(255);
  backG = random(255);
  backB = random(255);


  //red face ears
  stroke (0);
  fill (255);
  ellipse(150, 100, 20, 20);

  stroke (0);
  fill (255);
  ellipse(50, 100, 20, 20);

  // red face
  stroke(0);
  fill (255);
  ellipse (100, 100, 100, 100);

  line(70, 80, 130, 80);

  arc(100, 106, 55, 55, PI/2, PI);

  //red spots
  noStroke ();
  fill (210, 14, 2);
  ellipse (70, 110, 10, 10);

  noStroke ();
  fill (210, 14, 2);
  ellipse (130, 110, 10, 10);

  // red nose
  fill (0);
  ellipse(100, 100, 10, 5);

  //Blue face ears
  stroke (0);
  fill (255);
  ellipse(250, 100, 20, 20);

  stroke (0);
  fill (255);
  ellipse(349, 100, 20, 20);

  // blue face
  stroke(0);
  fill (255);
  ellipse(300, 100, 100, 100);

  arc(300, 106, 55, 55, PI/10, PI);

  // blue eyes
  strokeWeight(0);

  ellipse (280, 90, circleX, circleY);
  ellipse (320, 90, circleeX, circleY);

  ellipse (280, 90, circle2X, circle2Y);
  ellipse (320, 90, circlee2X, circlee2X);

  ellipse (280, 90, circle3X, circle3Y);
  ellipse (320, 90, circlee3X, circlee3Y);

  ellipse (280, 90, circle4X, circle4Y);
  ellipse (320, 90, circlee4X, circlee4Y);

  // blue nose
  fill (0);
  ellipse(300, 105, 10, 5);

  // blue Spots
  noStroke ();
  fill (0, 120, 214);
  ellipse (spotX, spotY, 10, 10);

  noStroke ();
  fill (0, 120, 214);
  ellipse (spot2X, spot2Y, 10, 10);

  //green face ears
  stroke (0);
  fill (255);
  ellipse(150, 300, 20, 20);

  stroke (0);
  fill (255);
  ellipse(50, 300, 20, 20);

  // green face
  stroke(0);
  fill (255);
  ellipse(100, 300, 100, 100);

  line(mX, 325, mY, 325);

  // green eyes

  fill(255);
  rect(carX, carY, 60, 20);

  fill (255);
  ellipse (eyeX, 285, 20, 20);
  ellipse (eye1X, 285, 20, 20);


  // green nose
  fill (0);
  ellipse(100, 300, 10, 5);

  //green spots
  noStroke ();
  fill (111, 166, 44);
  ellipse (70, 305, 10, 10);

  noStroke ();
  fill (111, 166, 44);
  ellipse (130, 305, 10, 10);

  //orange face ears
  stroke (0);
  fill (255);
  ellipse(250, 300, 20, 20);

  stroke (0);
  fill (255);
  ellipse(349, 300, 20, 20);

  // orange face
  stroke(0);
  fill (255);
  ellipse(300, 300, 100, 100);

  ellipse (300, 320, 20, 20);

  // orange nose
  fill (0);
  ellipse(300, 300, 10, 5);

  // orange eyes
  fill (255);
  ellipse (280, 285, 20, 20);
  ellipse (320, 285, 20, 20);

  fill (0);
  ellipse (280, 285, 5, 5);
  ellipse (320, 285, 5, 5);

  noStroke ();
  fill (240, 135, 8);
  ellipse (sp1X, sp1Y, 10, 10);

// orange Spots
  noStroke ();
  fill (240, 135, 8);
  ellipse (spX, spY , 10, 10);
    
}


