
int x; 
int y;
int a;
int b;
int xSpeed;
int ySpeed;
int aSpeed;
int bSpeed;


void setup() {
  size(800, 600);

  x = 0;
  y = 0;
  a = 400;
  b = 0;
  xSpeed = 3;
  ySpeed = 1;
  aSpeed = 4;
  bSpeed = 3;

}

void draw() {
  background(255);//white bg

  x=x+xSpeed;
  y=y+ySpeed;

  if (x >= width) {
    xSpeed = xSpeed * -1;
  }
  if (x <= 0) {
    xSpeed = xSpeed * -1;
  }
  if (y >= height) {
    ySpeed = ySpeed * -1;
  }
  if (y <= 0 ) {
    ySpeed = ySpeed * -1;
  }

  if (x <= width/2) {    
    fill(18, 182, 255);// transparent blue
  } 

  else {
    fill (100, 256, 55);
  }
  ellipse(x, y, 200, 200);

  a=a+aSpeed;
  b=b+bSpeed;


  if (a >= width) {
    aSpeed = aSpeed * -1;
  }
  if (a <= 0) {
    aSpeed = aSpeed * -1;
  }
  if (b >= height) {
    bSpeed = bSpeed * -1;
  }
  if (b <= 0 ) {
    bSpeed = bSpeed * -1;
  }

  if (b <= (width/3)*1) {    
    fill(2, 34, 89);
  } 

  else if (b <=(width/3)*2) {
    fill (100, 256, 55, 10);
  }

  else {
    fill(165, 39, 28);
  }
  ellipse(a, b, 100, 100);
}
