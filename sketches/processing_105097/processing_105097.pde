
int x;
int y;
int xSpeed;
int ySpeed;
int a;
int b;
int aSpeed;
int bSpeed;
 
void setup() {
  size(800, 600);
 
  fill(18, 182, 255, 128); //transparent blue
 
  // start ball in top left
  x = 0;
  y = 0;
  //set initial speed
  xSpeed = 10;
  ySpeed = 10;
  
    fill(47, 62, 255); //second color
 
  // start ball in top left
  a = 0;
  b = 300;
  //set initial speed
  aSpeed = 10;
  bSpeed = 10;
}
 
void draw() {
  //  rectangle(width/2, height/2, 200, 200); 
  background(255); // white background
 
  x = x + xSpeed;
  y = y + ySpeed;
  a = a + aSpeed;
  b = b + bSpeed;
 
  //right boundary
  if (x >= width) {
    xSpeed  = xSpeed * -1;
  }
  if (a >= width) {
    aSpeed  = aSpeed * -1;
  }
  //left boundary
  if (x <= 0) { 
    xSpeed  = xSpeed * -1;
  }
    if (a <= 0) { 
    aSpeed  = aSpeed * -1;
  }
  // top boundary
  if (y >= height) {
    fill(40, 60, 90);
    ySpeed  = ySpeed * -1;
  }
  if (b >= height) {
    fill(40, 60, 90);
    bSpeed  = bSpeed * -1;
  }
  // bottom boundary
  if (y <= 0) {
    ySpeed  = ySpeed * -1;
  }
    if (b <= 0) {
    bSpeed  = bSpeed * -1;
  }
  // top boundary
 
  if (x <= width/2) {
    fill(18, 182, 255);
    ellipse(x, y, 100, 100);
    ellipse(x, y, 150, 150);
    //this will happen if this is true
  }
  if (a >= height/2) {
    fill(147, 212, 55);
    ellipse(a, b, 100, 100);
    ellipse(a, b, 150, 150);
    //this will happen if this is true
  }
  else {
    fill(18, 182, 255, 128);
    //otherwise do this
 
 
    ellipse(x, y, 200, 200);
    fill(18, 182, 255, 110);
    ellipse(x, y, 250, 250);
    fill(18, 182, 255, 90);
    ellipse(x, y, 300, 300);
    
        fill(130, 232, 55);
    //otherwise do this
 
 
    ellipse(a, b, 200, 200);
    fill(20, 122, 255);
    ellipse(a, b, 250, 250);
    fill(245, 204, 255);
    ellipse(a, b, 300, 300);
  }
}
