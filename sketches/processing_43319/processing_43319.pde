
int xPos=320;
int yPos=240;
int zPos=1;

int xSpeed=2;
int ySpeed=2;
int zSpeed=2;

int xDirection=1;
int yDirection=1;
int zDirection=1;

// end of variables

void setup() {

  size (640, 480, P3D);
  smooth();
}

void draw() {

  background(1);
  lights();


  // box setup

  stroke(255);

  // background square

  line(0, 0, -500, width, 0, -500);
  line(0, 0, -500, 0, height, -500);
  line(0, height, -500, width, height, -500);
  line(width, height, -500, width, 0, -500);

  // perspective lines

  line(0, 0, -500, 0, 0, 0);
  line(width, 0, -500, width, 0, 0);
  line(0, height, -500, 0, height, 0);
  line(width, height, -500, width, height, 0);


  // inital ball set up

  translate (xPos, yPos, -zPos);
  sphere(50);
  noFill();

  // motion setup

  xPos = xPos + (xSpeed * xDirection);  
  yPos = yPos + (ySpeed * yDirection); 
  zPos = zPos + (zSpeed * zDirection);

  if (xPos>width-50) {
    xDirection*=-1;
  }

  if (yPos>height-50) {
    yDirection*=-1;
  }

  if (zPos>500) {
    zDirection*=-1;
  }

  if (xPos<50) {
    xDirection*=-1;
  }

  if (yPos<50) {
    yDirection*=-1;
  }

  if (zPos<0) {
    zDirection*=-1;
  }

  //reversal

  if (mousePressed) {

    xDirection *=-1;
    yDirection *=-1;
    zDirection *=-1;
  }
}


