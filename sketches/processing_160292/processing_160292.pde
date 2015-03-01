
//Variables Declared
int x;
int y;
int xSpeed;
int ySpeed;
int newSpeed;
int circSize;
int halfCirc;
int bgColor;
int rFill;
int gFill;
int bFill;

void setup() {

  size (500, 500);

  //Variables Defined
  x = 0;
  y = 0;
  //xSpeed = 5;
  //ySpeed = 5;
  newSpeed = 5;
  circSize = 100;
  halfCirc = circSize/2;
  bgColor = 255;
  rFill = 0;
  gFill = 255;
  bFill = 0;
}

//Press Key to increase speed
void keyPressed() {
  newSpeed = newSpeed + 5;
}

void draw() {

  background (bgColor);

  //Circle
  fill(rFill, gFill, bFill);
  noStroke();
  //x+=xSpeed;
  x = x+xSpeed;
  //y+=ySpeed;
  y = y+ySpeed;
  bgColor = ((x+y)/4);
  ellipse(x, y, circSize, circSize);

  if ((x<= halfCirc) && (y <= halfCirc)) {
    ySpeed = 0;
    xSpeed = newSpeed;
    x = halfCirc+1;
    y = halfCirc+1;
    rFill = 0;
    gFill = 255;
    bFill = 0;
  }

  if ((x >= width-halfCirc) && (y >= halfCirc)) {
    xSpeed = 0;
    ySpeed = newSpeed;
    x = width-halfCirc-1;
    y = halfCirc+1;
    rFill = 0;
    gFill = 0;
    bFill = 255;
  }

  if ((x >= width-halfCirc-1) && (y >= height-halfCirc)) {
    ySpeed = 0;
    xSpeed = -newSpeed;
    x = width-halfCirc-1;
    y = height-halfCirc-1;
    rFill = 255;
    gFill = 255;
    bFill = 0;
  }

  if ((x <= halfCirc) && (y >= height-halfCirc-1)) {
    xSpeed = 0;
    ySpeed = -newSpeed;
    x = halfCirc;
    y = height-halfCirc;
    rFill = 255;
    gFill = 0;
    bFill = 0;
  }
  
  
  /*
  //(Couldn't get this to work...)
  //Mouse Interaction
  if ((mouseX >= 50) && (mouseX <= 450)){
    x = mouseX;
    y = mouseY;
    xSpeed = 0;
    ySpeed = 0;
  }
  else {
    x = halfCirc;
    y = halfCirc;
  }
  */
}



