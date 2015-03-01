
int x;
int y;
int xSpeed;
int ySpeed;
int a; //length of one side of triangle, radius of circle


void setup() { 
  x = 0;
  y = 0;
  xSpeed = 1;
  ySpeed = 1;
  a = 30;
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


  // grey ellipses
  fill(80, 85);
  ellipse(x+a, y+a, 2*a, 2*a);

  pushMatrix();
  translate(0, 4*a);
  ellipse(x+a, y+a, 2*a, 2*a);
  popMatrix();

  pushMatrix();
  translate(0, 8*a);
  ellipse(x+a, y+a, 2*a, 2*a);
  popMatrix();

  pushMatrix();
  translate(0, 12*a);
  ellipse(x+a, y+a, 2*a, 2*a);
  popMatrix();

  pushMatrix();
  translate(0, 16*a);
  ellipse(x+a, y+a, 2*a, 2*a);
  popMatrix();


  //pink ellipses
  fill(242, 152, 152, 85);
  ellipse(x+a, height-3*a, 2*a, 2*a);

  pushMatrix();
  translate(0, -4*a);
  ellipse(x+a, height-3*a, 2*a, 2*a);
  popMatrix();

  pushMatrix();
  translate(0, -8*a);
  ellipse(x+a, height-3*a, 2*a, 2*a);
  popMatrix();

  pushMatrix();
  translate(0, -12*a);
  ellipse(x+a, height-3*a, 2*a, 2*a);
  popMatrix();

  pushMatrix();
  translate(0, -16*a);
  ellipse(x+a, height-3*a, 2*a, 2*a);
  popMatrix();
}



