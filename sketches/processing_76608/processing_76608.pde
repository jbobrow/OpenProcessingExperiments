
int a=200;
int b=400;
int c=45;
int d= 10;
int xPos1= 20;
int xPos2= -300;
int dirX1= 6;
int dirY1= 0;
int yPos1= 277;

int gravity = 1;
Boolean buttonPressed = false;
void setup() {

  size(900, 500);
  noCursor();
}
void draw() {

  background(255);

  //campo da gioco
  strokeWeight(3);
  line(0, height/1.52, width, height/1.52);

  //ostacolo 1
  xPos1=dirX1 + xPos1;
  fill(6);
  rect(xPos1, height/1.76, c, c);

  if (xPos1 > width) {
    xPos1=0;
  }

  //ostacolo 2
  xPos2=xPos2+dirX1;
  rect(xPos2, height/1.76, c, c);

  if (xPos2 > width) {
    xPos2=0;
  }
  fill(16, 247, 206);
  strokeWeight(2);
  ellipse(850, yPos1, 45, 45);

  yPos1 = yPos1 + dirY1;//move
  dirY1 = dirY1 + gravity; //gravity pulls you down. (what a drag)
  if (yPos1 >= 306) {//if on the ground
    dirY1 = 0;
    yPos1 = 306; //set character on ground;
  }
}
void keyPressed() {
  if ((keyCode == UP) && (buttonPressed == false)){
    buttonPressed = true;
    dirY1 = -15;
  }
}

void keyReleased() {
  buttonPressed = false;
}
