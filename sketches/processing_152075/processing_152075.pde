
int xPos; //position of the ball
int speed = 1; //speed of the abll
int xDir = 1; //direction of the ball
int score = 0; //initial score
int lives = 5; //live you start with
boolean lost = false; //have you lost yet

void setup() {   //runs once the program starts
  size(400, 400);
  smooth();
  xPos = width / 2;  //centers the ball
  fill(255);   //makes the ball and the text white
  textSize(13);  //sets the size of the text
}

void draw() {  //loops over and over again
  background(0);  //black background
  ellipse(xPos, height / 2, 40, 40);  //draw the ball
  xPos = xPos + (speed * xDir);   //update the balls position
  if (xPos > width - 20 || xPos < 20){  //did the ball hit the side?
    xDir = -xDir;  //if so, reverse the direction
}
text("score = " + score, 10, 10);  //print the score on the screen
text("lives = " + lives, width - 80, 10); //print the lives on the screen
if (lives<=0) {  //check to see of you lost
  textSize(20);
  text("Click to Restart", 125, 100);
  noLoop();  //stop looping at the end of the draw function
  lost = true;
  textSize(13);
}
}

void mousePressed() {  //runs whenever the mouse is pressed
  if (dist(mouseX, mouseY, xPos, 200) <=20) {  //did we hit the target?
    score = score + speed;  //increase the speed
    speed = speed + 1;  //increase the score
  }
  else {  //we missed
    if (speed < 1) { //if speed is greater than 1, decrease the speed
      speed = speed - 1;  
    }
    lives = lives - 1;  //take away one life
  }
  if (lost == true) {  //if we lost the game, reset and start over
    speed = 1;  //reseat all variables to initial values
    lives = 5;
    score = 0;
    xPos = width / 2;
    xDir = 1;
    lost = false;
    loop();  //loop the draw function again
  }
}
