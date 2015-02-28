
int xpos;
int xSpeed;
int ypos;
int ySpeed;
int xPaddle;
int yPaddle;


void setup() {


  size(800, 400);
  xpos = 100;
  xSpeed = 3;
  ypos = 200;
  ySpeed = 3;
  xPaddle = 770;
  yPaddle = 50;
}

void draw() { 
  background(175, 222, 107);

  //bounce against paddle
  if (xpos+25 >= xPaddle && (ypos >= yPaddle && ypos <= yPaddle+80)) {
    xSpeed=xSpeed *-1;
  }

  //ball movement
  if (ypos>=height||ypos<= 0) {
    ySpeed=ySpeed *-1;
  }
  if (xpos<=0) {
    xSpeed=xSpeed *-1;
  }

  //paddle movement
  if (keyPressed) {
    if (key == 'i') {
      yPaddle -= 2;
    }
    if (key == 'k') {
      yPaddle += 2;
    }
  }

  //paddle
  rect(xPaddle, yPaddle, 10, 80);

  //ball
  noStroke();
  fill(105, 109, 216);
  xpos += xSpeed;
  ypos += ySpeed;
  ellipse(xpos, ypos, 50, 50);
}


