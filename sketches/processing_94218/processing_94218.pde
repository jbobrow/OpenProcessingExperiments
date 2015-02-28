
PImage myImage; 
PImage goalIe;

int goalieX = 300;
int goalieSpeed = 4;
int ballX = 300;
int ballY = 325;
int ballSpeed;
color ballColor = color(252, 252, 5);
boolean changecolor = false;

void setup() {
  size (600, 800);
  myImage =loadImage("soccer-field90.jpg");
  goalIe =loadImage("goalie.png");
}

void draw() {
  background (0);
  imageMode(CENTER);
  image(myImage, width/2, height/2, 600, 800);
  image (goalIe, goalieX, 150, 50, 150);
  ellipseMode(CENTER);
  rectMode(CENTER);
  noStroke();
  noFill();

  //fan boxes 
  fill(23, 126, 232);
  rect(18, height/2, 30, 800);
  rect(582, height/2, 30, 800);

  fans();
  moveGoalie();
  soccerBall();
  moveBall();

  //Reset the ball to original position after goal or goalie block
  if (ballY <= 100 || goalieX <= ballX+10 && goalieX >=ballX-10 && ballY <=150 && ballY>=100) {
    changecolor = true;
    ballSpeed = 0;
    ballY = 325;
  }

  ballY=ballY+ballSpeed;

  ballX = constrain(ballX, 230, 370);
  
}

//Draws the Fans
void fans() {
  for (int i = 12; i <=745; i+= 12) {
    fill(int(random(0, 150)), int(random(0, 150)), int(random(0, 150)));
    ellipse (10, i, 10, 10);
  }

  for (int i = 15; i <=747; i+= 12) {
    fill(int(random(0, 150)), int(random(0, 150)), int(random(0, 150)));
    ellipse (25, i, 10, 10);
  }

  for (int i = 12; i <=745; i+= 12) {
    fill(int(random(0, 150)), int(random(0, 150)), int(random(0, 150)));
    ellipse (575, i, 10, 10);
  }

  for (int i = 15; i <=747; i+= 12) {
    fill(int(random(0, 150)), int(random(0, 150)), int(random(0, 150)));
    ellipse (590, i, 10, 10);
  }
}

//goalie moving back and forth
void moveGoalie() { 
  if (goalieX >= 383)
  {
    goalieSpeed *= -1;
  }
  if ( goalieX <= 215)
  {
    goalieSpeed *= -1;
  }
  goalieX=goalieX+goalieSpeed;
}  

//Moves the yellow ball depending on the key you press
void moveBall() {
  if (keyPressed && key == 'l') {
    ballX -= 2;
  }
  if (keyPressed && key == 'r') {
    ballX += 2;
  }
}

// Draws the yellow Ball
void soccerBall() {
  fill(ballColor);
  if (changecolor == true) {
    ballColor = color(203,23,232);
  }
  ellipse(ballX, ballY, 20, 20);
}


//User Interaction
void mousePressed() {
  ballSpeed -= 8;
}



