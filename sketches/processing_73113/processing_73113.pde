
/*****************************************
 * Assignment 3
 * Name:         Louis Cipriano
 * E-mail:       lciprian@haverford.edu
 * Course:       CS 110 - Section 001
 * Submitted:    October 3, 2012
 * 
 * The following code depicts smiley faces and birds getting hit with a baseball.
 * As the ball moves (moves with mouse) toward the faces, they begin to frown.
 * Upon contact with the ball, the face turns blue and tears appear on the frowning face.
 * The eyes of the smiling/frowning faces move with the ball.
 * Wings of the birds flap downward when the ball moves toward them.
 * Also, when the ball moves toward the birds, their eyes widen in anticipation of getting hit.
 * Please see the attached word document for a more full description.
 ***********************************************/

float x1 = random(100, 170);
float y1 = random(400, 180);
float x2 = random(250, 320);
float y2 = random(400, 480);
float x3 = random(400, 470);
float y3 = random(400, 480);
float x4 = random(100, 170);
float y4 = random(100, 180);
float x5 = random(250, 320);
float y5 = random(100, 180);
float x6 = random(400, 470);
float y6 = random(100, 180);
float faceWidth = 100;
float faceHeight = 100;
float eyeWidth = 20;
float eyeHeight = 30;
float eyeBallWidth = 5;
float eyeBallHeight = 10;
float noseWidth = 5;
float noseHeight = 5;
float ballHeight = 30;
float ballWidth = 30;
float lEyeCent = 80;
float rEyeCent = 120;
float mx = mouseX;
float my = mouseY;
float birdFaceWidth = 50;
float birdFaceHeight = 50;
float birdEyeBallWidth = 5;
float birdEyeBallHeight = 10;
float birdEyeWidth = 20;
float birdEyeHeight = 30;
float tearWidth =5;
float tearHeight = 10;


void setup () {
  size(500, 500);
  background (255);

  //sky

  noStroke();
  fill(136, 200, 255);
  rect(0, 0, 500, 300);

  //grass

  fill(0, 200, 0);
  rect(0, 300, 500, 200);
  smooth();
  noCursor();
}

void draw() {
  background (255);
  noStroke();
  fill(136, 200, 255);
  rect(0, 0, 500, 300);
  fill(0, 200, 0);
  rect(0, 300, 500, 200);
  drawFace(x1, y1);
  drawFace(x2, y2);
  drawFace(x3, y3);
  drawBaseBall(mouseX, mouseY);
  drawBird(x4, y4);
  drawBird(x5, y5);
  drawBird(x6, y6);
}

//baseball - moves with mouse

void drawBaseBall(float mx, float my) {
  fill(255);
  stroke(0);
  strokeWeight(3);
  ellipseMode(CENTER); 
  ellipse(mx, my, ballWidth, ballHeight); 

  //seams in baseball

  strokeWeight(3);
  arc(mx-10, my, 15, 21, -1.571, 1.571);
  arc(mx+10, my, 15, 21, 1.785, 4.632);
}

//Smiley Face
//define float "distance" to make tears appear, make the smile a frown, and turn the faces blue
//use map function to make eyes follow baseball

void drawFace(float x, float y) {
  stroke(255, 255, 0);
  fill(255, 255, 0);
  float distance = dist( x, y, mouseX, mouseY);
  fill(255, 255, 0);
  if (distance < x/4) {
    stroke(0, 0, 255);
    fill(0, 0, 255);
  }
  ellipse(x, y, faceWidth, faceHeight); 

  //eyes

  stroke (0);
  strokeWeight(1);
  fill(255);
  ellipse (x-20, y-20, eyeWidth, eyeHeight);
  ellipse (x+20, y-20, eyeWidth, eyeHeight);

  //eyeballs
  //define float "lex" (left eye x-coordinate) as map to move left eyeball with baseball
  //define float "ley" (left eye y-coordinate) as map to move left eyeball with baseball
  //define float "rex" (right eye x-coordinate) as map to move right eyeball with baseball
  //define float "rex" (right eye y-coordinate) as map to move right eyeball with baseball

  float lex = map(mouseX, 0, width, x-25, x-10); //x coordinate in left eyeball moves 
  float ley = map(mouseY, 0, height, y-30, y-10); //y coordinate in left eyeball moves
  float rex = map(mouseX, 0, width, x+15, x+30); //x coordinate in right eyeball moves
  float rey = map(mouseY, 0, height, y-30, y-10); //y coordinate in right eyeball moves
  fill(0);
  ellipse (lex, ley, eyeBallWidth, eyeBallHeight);
  ellipse (rex, rey, eyeBallWidth, eyeBallHeight);

  //nose

  fill(0);
  strokeWeight(1);
  ellipse(x, y+5, noseWidth, noseHeight);

  //mouth
  //will smile at until x < distance/3, where it will frown

  strokeWeight(3);
  noFill();

  if (distance < x/3) {
    strokeWeight(3);
    noFill();
    curve(x-20, y+70, x-15, y+30, x+12, y+30, x+20, y+70);
  } 
  else {
    curve(x-20, y-50, x-16, y+25, x+16, y+25, x+20, y-50);
  }

  //tears - appear when ball contacts face (distance < x/4)

  if (distance < x/4) {
    strokeWeight(1);
    stroke (119, 136, 153);
    fill(119, 136, 153);
    ellipse(x-30, y+10, tearWidth, tearHeight);
    ellipse(x-28, y, tearWidth, tearHeight);
    ellipse(x+30, y+10, tearWidth, tearHeight);
  }
}

//birds
//wings flap downward and eyes widen when ball gets closer (distance < x/2 )

void drawBird(float x, float y) {  
  stroke(255, 0, 0);
  strokeWeight(5);

  //redefine float "distance" to widen eyes and flap wings

  float distance = dist( x, y, mouseX, mouseY);

  //bird wings - flap when ball moves toward birds

  if (distance < x/2) {
    line(x, y, x-70, y+70);
    line(x, y, x+70, y+70);
  }
  else {
    line(x, y, x-70, y-70);
    line(x, y, x+70, y-70);
  }

  fill(255, 0, 0);
  ellipse(x, y, birdFaceWidth, birdFaceHeight);

  //bird eyes

  stroke(0);
  strokeWeight(1);
  fill(255);
  ellipse(x-10, y-5, birdEyeWidth, birdEyeHeight);
  ellipse(x+10, y-5, birdEyeWidth, birdEyeHeight);

  //bird eyeballs - widen as ball moves closer to birds

  fill(0);
  if (distance < x/2) {
    ellipse (x-10, y-5, birdEyeBallWidth+5, birdEyeBallHeight+10);
    ellipse (x+10, y-5, birdEyeBallWidth+5, birdEyeBallHeight+10);
  } 
  else {
    ellipse (x-10, y-5, birdEyeBallWidth, birdEyeBallHeight);
    ellipse (x+10, y-5, birdEyeBallWidth, birdEyeBallHeight);
  }

  //bird beak

  triangle (x-5, y+5, x, y+20, x+ 5, y+5);
}
