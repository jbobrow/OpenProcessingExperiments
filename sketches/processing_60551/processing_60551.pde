
final int rad = 20;         //radius of circles.
int redX;                   //X location for red ball.
int redY;                   //Y location for red ball.
int redDirection;           //Direction red ball is bouncing.
int blackX;                 //X location for black ball.    
int blackY;                 //Y location for black ball.
float distance;             //distance between balls.
boolean blackmove = false;  //used to start the black ball moving.

void setup() {
  size(200, 200);
  smooth();
  textAlign(CENTER);
  textSize(24);
  redX = 20;
  redY = 20;
  redDirection = 1;
  blackX = width/2;
  blackY = height-20;
}

void draw() {


  background(255);
  stroke(1);
  line(0, 60, width, 60);             //draws line.
  noStroke();
  fill (255, 0, 0);
  ellipse (redX, redY, 2*rad, 2*rad); // draws red circle.

  if (((redX + rad) == (width)) && ((redY + rad) == (height)))  // reach bottom-right corner
  {
    redDirection = 3;
  }
  else if (((redX + rad) == (width)) && ((redY - rad) == 0))    // reach top-right corner
  {
    redDirection = 2;
  }
  else if ((redX - rad == 0) && (redY - rad == 0))              // reach top-left corner
  {
    redDirection = 1;
  }
  else if ((redX - rad == 0) && (redY + rad == height))         // reach bottom-left corner
  {
    redDirection = 4;
  }
  else if ((redX + rad == width) && (redY + rad < height) && (redY - rad > 0))     // reach righ border
  {
    if (redDirection == 1) redDirection = 2;
    if (redDirection == 4) redDirection = 3;
  }
  else if ((redX - rad == 0) && (redY + rad < height) && (redY - rad > 0))         // reach left border
  {
    if (redDirection == 2) redDirection = 1;
    if (redDirection == 3) redDirection = 4;
  }
  else if ((redY - rad == 0) && (redX + rad < width) && (redX - rad > 0))          // reach top border
  {
    if (redDirection == 3) redDirection = 2;
    if (redDirection == 4) redDirection = 1;
  }
  else if ((redY + rad == height-140) && (redX + rad < width) && (redX - rad > 0)) // reach bottom border
  {
    if (redDirection == 1) redDirection = 4;
    if (redDirection == 2) redDirection = 3;
  }


  if (redDirection == 1) // control the speed and direct the ball bounces
  {
    redX = redX + 1; 
    redY = redY + 1;
  }
  else if (redDirection == 2)
  {
    redX = redX - 1; 
    redY = redY + 1;
  }
  else if (redDirection == 3)
  {
    redX = redX - 1; 
    redY = redY - 1;
  }
  else if (redDirection == 4)
  {
    redX = redX + 1; 
    redY = redY - 1;
  }

  fill(0); 
  ellipse(blackX, blackY, 2*rad, 2*rad); // draws the black ball

  if (keyPressed == true) { // start the black ball moving if a key is pressed.
    blackmove = true;
  }

  if (blackmove == true) {
    blackY --;
  }

  fill(255, 0, 0);
  distance = sqrt(sq(blackX - redX)+sq(blackY - redY)); //pithag theorum used to determine distance between balls.
  if (distance <= 2*rad) { //if balls collide.
    text("YOU WIN!!!", width/2, height/2);
    noLoop();
  }
  else if (blackY < - 20) { //if black ball misses.
    text("GAME OVER!!!", width/2, height/2);
    noLoop();
  }
}


