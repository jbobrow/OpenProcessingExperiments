
float xpos, ypos;                
float xspeed, yspeed;            
float xdirection, ydirection;    
int diam;

float paddleWidth;
float paddleHeight;

float paddleLeftX;
float paddleLeftY;

float paddleRightX;
float paddleRightY;

boolean colorR;
boolean colorL;

int scoreR;
int scoreL;

PFont font;

void setup() {
  size(800, 600);
  xpos = width/2;
  ypos=height/2;
  xspeed=2;
  yspeed=2;
  xdirection=1;
  ydirection=1;
  diam=30;

  paddleWidth=30;
  paddleHeight=80;

  paddleLeftX =30;
  paddleLeftY=200;

  paddleRightX=width-30-paddleWidth;
  paddleRightY=200;

  colorR=false;
  colorL=false;

  scoreR=0;
  scoreL=0;

  smooth();
  background(0);
  font=loadFont("EurostileBold-48.vlw");
}

void draw() {

  //draw rectangle so that the background color can change when someone scores
  noStroke();
  fill(0, 20);
  rect(0, 0, width, height);

  //line dividing screen in half
  stroke(255);
  line(width/2, 100, width/2, height-100);

  textFont(font);
  fill(255);
  text("PONG", width/2-60, 60);
  text(scoreL, width/2-200, 80);
  text(scoreR, width/2+200, 80);

  xpos += xspeed* xdirection;
  ypos +=yspeed*ydirection;

  //if right side scores, make the background right side's color(pink)
  if (colorR) {
    noStroke();
    fill(13, 190, 252, 50);
    rect(0, 0, width, height);
  }

  //if left side scores, make background left side's color(blue)
  if (colorL) {
    noStroke();
    fill(252, 13, 85, 50);
    rect(0, 0, width, height);
  }

  //If the ball goes off the left side of the screen, increase right side score, and change background
  //to right side color (pink). Put the ball back in the center of the screen.
  if (xpos < 0-diam) {
    colorR=true;
    colorL=false;
    scoreR++;

    noLoop();
    xpos=width/2;
    ypos=height/2;
    delay(1000);
    loop();
  }

  //If the ball goes off the right side of the screen, increase left side score, and change background
  //to left side color (blue). Put the ball back in the center of the screen.
  if (xpos > width+diam) {
    colorL=true;
    colorR=false;
    scoreL++;

    noLoop();
    xpos=width/2;
    ypos=height/2;
    delay(1000);
    loop();
  }

  //stop the game when the first person reaches 3 points
  if (scoreR==3 || scoreL==3) {
    noLoop();
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    text("GAME OVER", width/2-130, 60);
    textFont(font, 16);
    text("click to play again", width/2-60, 100);
  }

  //check for contact with top and bottom walls
  if (ypos < diam/2 || ypos > height-diam/2) {
    ydirection*=-1;
  }

  //check for contact with the left paddle
  if (xpos>paddleLeftX && xpos < paddleLeftX+paddleWidth && ypos > paddleLeftY && ypos < paddleLeftY +paddleHeight) {
    xdirection*=-1;
  }

  //check for contact with the right paddle
  if (xpos>paddleRightX && xpos < paddleRightX +paddleWidth  && ypos > paddleRightY && ypos < paddleRightY+paddleHeight) {
    xdirection*=-1;
  }

  //draw ball and paddles
  fill(255);
  ellipse(xpos, ypos, diam, diam);
  rect(paddleLeftX, paddleLeftY, paddleWidth, paddleHeight);
  rect(paddleRightX, paddleRightY, paddleWidth, paddleHeight);
}

void keyPressed() {
  if (keyCode==38) {
    paddleRightY-=50;
  } 
  if (keyCode == 40) {
    paddleRightY+=50;
  }

  if (keyCode ==16) {
    paddleLeftY-=50;
  }
  if (keyCode ==18) {
    paddleLeftY+=50;
  }
}

//click the mouse to reset the score and start the game over
void mouseClicked() {
  loop();
  fill(0);
  rect(0, 0, width, height);
  scoreR=0;
  scoreL=0;
}


