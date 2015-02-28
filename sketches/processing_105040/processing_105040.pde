
//assignment#3 Balllllllls

int x;
int y;
int z;
int w;
int xSpeed;
int ySpeed;
int zSpeed;
int wSpeed;


void setup() {
  size(800, 800);
  smooth();
  noStroke();

  //start ball in the top left
  x=0;
  y=0;

  //start ball in the bottom right
  z=400;
  w=400;

  //set initial speed
  xSpeed=3;
  ySpeed=2;
  zSpeed=1;
  wSpeed=2;
}
void draw() {
  background(#FFC408);
  x=x+xSpeed;
  y=y+ySpeed;
  z=z+zSpeed;
  w=w+wSpeed;

  //right

  if (x>=width) {
    xSpeed=-xSpeed;
  }
  if (z>=width) {
    zSpeed=-zSpeed;
  }
  //left
  if (x<=0) {
    xSpeed=-xSpeed;
  }
  if (z<=0) {
    zSpeed=-zSpeed;
  }
  //bottom
  if (y>=height) {
    ySpeed=-ySpeed;
  }
  if (w>=height) {
    wSpeed=-wSpeed;
  }
  //top
  if (y<=0) {
    ySpeed=-ySpeed;
  }

  if (w<=0) {
    wSpeed=-wSpeed;
  }


  if (x<=width/2) {
    fill(#AB3B3A);
  }
  else {
    fill(#D7C4BB);
  }

  ellipse(x, y, 300, 300);
  ellipse(z, w, 200, 200);
}
