
int x = 15;
int speedX = 5;
int y = 0;
int speedY = 3; 

void setup() {

  size(400, 400);
  smooth();
}

void draw() {
  background(20, 20, 20);



  if (keyPressed && key == ENTER) {
    speedX=0;
    speedY=0;
    background(255);
  }
  if (keyPressed && key == 'a') {
    speedX=3;
    speedY=3;
  }

  ellipse(x, y, 45, 20);
  ellipse(x+80, y, 45, 20);
  fill(0);
  // is x bigger than right border? 
  if (x >=200 || x < 15
  
  ) {
    speedX= speedX * -1;
  }

  if (y >=width || y < 0) {
    speedY= speedY * -1;
  }

  x = x + speedX;
  y = y + speedY; 



  //------------------- 
  int x1 = 1;
  int speedX1 = 5;
  int y1 = 1;
  int speedY1 = 3;  



  ellipse(x+80, y, 15, 20);
  ellipse(x, y, 15, 20);
  fill(255);
  // is x bigger than right border? 
  if (x >=WIDTH|| x1 < 1) {
    speedX1= speedX1 * -1;
  }

  if (y1 >=width || y1 < 1) {
    speedY1= speedY1 * -1;
  }

  x1 = x1 + speedX1;
  y1 = y1 + speedY1;
}
//------------


