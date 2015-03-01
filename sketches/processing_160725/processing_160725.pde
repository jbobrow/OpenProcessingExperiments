
int x; //x position of triangle
int y; //y position of triangle
int x1; //x position of circle
int a; //length of one side of triangle, radius of circle
int xSpeed;
int ySpeed;
int cSpeed; //speed for circles
int R;
int G;
int B;


void setup() {
  x = 0;
  y = 0;
  x1 = a = 30;
  xSpeed = 1;
  ySpeed = 1;
  cSpeed = 4;

  size(600, 540);
}


void draw() {
  background(250);
  noStroke();
  smooth();


  //triangle in upper left corner
  x+=xSpeed;
  y+=ySpeed;

  fill(80, 85);
  triangle(x, y, x + 2*a, y, mouseX, mouseY);

  //impact with diagonal corner
  if ( x + 2*a >= width  || x <= 0) {
    xSpeed*=-1;
    ySpeed*=-1;
  }


  //triangle in lower right corner
  x-=-xSpeed;
  y-=-ySpeed;

  fill(80, 85);
  triangle(width - x, height - y, width-x - 2*a, height-y, mouseX, mouseY);

  //impact with diagonal corner
  if ( x + 2*a >= width  || x <= 0) {
    xSpeed*=-1;
    ySpeed*=-1;
  }


  //triangle in upper right corner
  x+=xSpeed;
  y-=-ySpeed;

  fill(242, 152, 152, 85);
  triangle(width - x, y, width-x - 2*a, y, mouseX, mouseY);

  //impact with diagonal corner
  if ( x + 2*a >= width  || x <= 0) {
    xSpeed*=-1;
    ySpeed*=-1;
  }


  //triangle in lower left corner
  x-=-xSpeed;
  y+=+ySpeed;

  fill(242, 152, 152, 85);
  triangle(x, height - y, x + 2*a, height-y, mouseX, mouseY);

  //impact with diagonal corner
  if ( x + 2*a >= width  || x <= 0) {
    xSpeed*=-1;
    ySpeed*=-1;
  }


  //ellipses
  x1+=cSpeed;

  //grey ellipses

  fill(R, G, B, 85);
  ellipse(x1, height/10, 2*a, 2*a);

  pushMatrix();
  translate(0, 4*a);
  ellipse(x1, height/10, 2*a, 2*a);
  popMatrix();

  pushMatrix();
  translate(0, 8*a);
  ellipse(x1, height/10, 2*a, 2*a);
  popMatrix();

  pushMatrix();
  translate(0, 12*a);
  ellipse(x1, height/10, 2*a, 2*a);
  popMatrix();

  //pink ellipses

  fill(R, G, B, 85);
  ellipse(width-x1, height/10+2*a, 2*a, 2*a);

  pushMatrix();
  translate(0, 4*a);
  ellipse(width-x1, height/10+2*a, 2*a, 2*a);
  popMatrix();

  pushMatrix();
  translate(0, 8*a);
  ellipse(width-x1, height/10+2*a, 2*a, 2*a);
  popMatrix();

  pushMatrix();
  translate(0, 12*a);
  ellipse(width-x1, height/10+2*a, 2*a, 2*a);
  popMatrix();

  pushMatrix();
  translate(0, 16*a);
  ellipse(width-x1, height/10+2*a, 2*a, 2*a);
  popMatrix();

  //color change to pink when impact on the right border
  if (x1>=width-a) {
    R = 242;
    G = 152;
    B = 152;
    cSpeed*=-1;
  }

  //color change to grey when impact on the left border
  if (x1<=a) {
    R = G = B = 80;
    cSpeed*=-1;
  }
}



