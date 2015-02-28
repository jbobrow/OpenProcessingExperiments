
int x;
int y;
int x1;
int y1;
int x2;
int y2;
int xSpeed;
int ySpeed;
int x1Speed;
int y1Speed;
int x2Speed;
int y2Speed;

void setup() {
  size(800, 600);
  smooth();
  fill(18, 182, 255, 10);  //transparent blue

  // start ball in top left
  x = 0;
  y = 0;

  // ball 2 start
  x1 = 100;
  y1 = 250;

  // ball 3 start
  x2 = 750;
  y2 = 290;

  // set initial speed
  xSpeed = 3;
  ySpeed = 2;

  // ball 2 speed
  x1Speed = 8;
  y1Speed = 6;

  // ball 3 speed
  x2Speed = 12;
  y2Speed = 16;
}

void draw() {
  background(35, 236, 245);  // yellow background
  //ellipse(width/2,height/2, 200, 200);

  x = x + xSpeed;
  y = y + ySpeed;

  x1 = x1 + x1Speed;
  y1 = y1 + y1Speed;

  x2 = x2 + x2Speed;
  y2 = y2 + y2Speed;

  // right boundary
  if (x >= width) {
    xSpeed = xSpeed * -1;
    // OR xSpeed = -xSpeed;
    // xSpeed *= -1;
    // circleX = circleX + 100
    // circleX += 100
  }
  // left boundary
  if (x <= 0) {
    xSpeed = xSpeed * -1;
  }
  // bottom boundary
  if (y >= height) {
    ySpeed = ySpeed * -1;
  }
  // top boundary
  if (y <= 0 ) {
    ySpeed = ySpeed * -1;
  } 

  //changing fill for ball
  if (x <= width/2) {
    fill(18, 182, 255, 128); // transparent blue
    //if (the mouse is less than (or equal to) half of the width) {
    // this will happen if this is true
  } 
  else {
    // otherwise do this
    fill(0, 299, 28);  //green
  }

  // ball2 right boundary
  if (x1 >= width) {
    x1Speed = x1Speed * -1;
  }
  // ball2 left boundary
  if (x1 <= 0) {
    x1Speed = x1Speed * -1;
  }
  // ball2 bottom boundary
  if (y1 >= height) {
    y1Speed = y1Speed * -1;
  }  
  // ball2 top boundary
  if (y1 <= 0 ) {
    y1Speed = y1Speed * -1;
  }


  // ball ellipse(mouseX, mouseY, 200, 200);
  ellipse(x, y, 200, 200);

  // changing fill for ball 2
  if (y1 <= height/2) {
    fill(230, 12, 45, 128); // transparent red
    // this will happen if this is true
  } 
  else {
    // otherwise do this
    fill(250, 255, 10);  //yellow
  }
  // ball3 right boundary
  if (x2 >= width) {
    x2Speed = x2Speed * -1;
  }
  // ball3 left boundary
  if (x2 <= 0) {
    x2Speed = x2Speed * -1;
  }
  // ball3 bottom boundary
  if (y2 >= height) {
    y2Speed = y2Speed * -1;
  }  
  // ball3 top boundary
  if (y2 <= 0 ) {
    y2Speed = y2Speed * -1;
  }

  // ball 2
  ellipse(y1, x1, 200, 200);

  //changing fill ball 3
  if (y2 <= height/2) {
    fill(255, 118, 13, 220); // orange
    // this will happen if this is true
  } 
  else {
    // otherwise do this
    fill(16, 255, 13, 128);  //transparent green
  }
  //ball 3
  ellipse(x2, y2, 100, 100);
  }

