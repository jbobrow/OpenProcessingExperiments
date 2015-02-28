
PImage field; 
PImage goalIe;
Goalie topGoalie;
Goalie bottomGoalie;
int goalieX = 300;
int ballX = 300;
int ballY = 375;
int ballSpeed;
int ball2X = 300;
int ball2Y = 425;
int ball2Speed;
color ballColor = color(252, 252, 5);
color ball2Color = color(203, 23, 232);
boolean changecolor = false;

void setup() {
  size (600, 800);
  topGoalie = new Goalie(300, 150);
  bottomGoalie = new Goalie(300, 700 );
  field =loadImage("soccer-field90.jpg");
  goalIe =loadImage("goalie.png");
}

void draw() {
  background (0);
  imageMode(CENTER);
  image(field, width/2, height/2, 600, 800);
  ellipseMode(CENTER);
  rectMode(CENTER);
  noStroke();
  noFill();

  //fan boxes 
  fill(23, 126, 232);
  rect(18, height/2, 30, 800);
  rect(582, height/2, 30, 800);

  fans();
  topGoalie.display();
  topGoalie.moveGoalie();
  bottomGoalie.display();
  bottomGoalie.moveGoalie();
  soccerBall();
  soccerBall2();
  moveBall();
  moveBall2();

  //Reset the ball to original position after goal or goalie block
  if (ballY <= 40 || goalieX <= ballX+10 && goalieX >=ballX-10 && ballY <= 150 && ballY>=100) {
    ballSpeed = 0;
    ballY = 375;
  }

  if (ball2Y >= 760 || goalieX <= ball2X+10 && goalieX >=ball2X-10 && ball2Y >= 700 && ball2Y<=750) {
    ball2Speed = 0;
    ball2Y = 425;
  }

  ballY=ballY+ballSpeed;

  ball2Y=ball2Y+ball2Speed;

  ballX = constrain(ballX, 230, 370);
  ballY = constrain(ballY, 0, 390);
  ball2X = constrain(ball2X, 230, 370);
  ball2Y = constrain(ball2Y, 410, height);
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

//Moves the yellow ball depending on the key you press
void moveBall() {
  if (keyPressed && key == 'j') {
    ballX -= 2;
  }
  if (keyPressed && key == 'l') {
    ballX += 2;
  }
  if (keyPressed && key == 'k') {
    ballY += 2;
  }
  if (keyPressed && key == 'i') {
    ballY -= 2;
  }
}

void moveBall2() {
  if (keyPressed && key == 'a') {
    ball2X -= 2;
  }
  if (keyPressed && key == 'd') {
    ball2X += 2;
  }
  if (keyPressed && key == 's') {
    ball2Y += 2;
  }
  if (keyPressed && key == 'w') {
    ball2Y -= 2;
  }
}

// Draws the yellow Ball
void soccerBall() {
  fill(ballColor);
  ellipse(ballX, ballY, 20, 20);
}

void soccerBall2() {
  fill(ball2Color);
  ellipse(ball2X, ball2Y, 20, 20);
}


//User Interaction
void mousePressed() {
  if (mouseY <= height/2) {
    ballSpeed -= 8;
  }
  if (mouseY >= height/2) {
    ball2Speed += 8;
  }
}


class Goalie {
  PImage goalIe;
  int goalieX;
  int goalieY;
  int goalieH;
  int goalieW;
  int goalieSpeed;

  Goalie(int _X, int _Y) {
    goalIe =loadImage("goalie.png");
    goalieX = _X;
    goalieY = _Y;
    goalieH = 50;
    goalieW = 150;
    goalieSpeed= int(random(3,5));
  }

  void display() { 
    image (goalIe, goalieX, goalieY, goalieH, goalieW);
  }
  
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
}



