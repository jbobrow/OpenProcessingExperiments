
boolean gameStart = false;
 
float x = 150;
float y = 150;
float yLeft=75;
float speedX = random(3, 5);
float speedY = random(3, 5);
int leftColor = 128;
int rightColor = 128;
int diam;
int rectSizeRight = 150;
int rectSizeLeft = 150;
float diamHit;
 
 
void setup() {
  size(500, 500);
  noStroke();
  smooth();
  ellipseMode(CENTER);
}
 
void draw() {
  background(255);
 
  fill(128,128,128);
  diam = 20;
  ellipse(x, y, diam, diam);
 
  fill(leftColor);
  rect(0, yLeft-rectSizeRight/2, 10, rectSizeRight);
  fill(rightColor);
  rect(width-30, mouseY-rectSizeRight/2, 10, rectSizeRight);
 
 
  if (gameStart) {
    
    x = x + speedX;
    y = y + speedY;
    //makes the left bar a little slow and a little stupid!
    yLeft = yLeft + speedY * 0.8;
 
    // if ball hits movable bar, invert X direction and apply effects
    if ( x > width-30 && x < width -20 && y > mouseY-rectSizeRight/2 && y < mouseY+rectSizeRight/2 ) {
      speedX = speedX * -1;
      x = x + speedX;
      rightColor = 0;
      fill(random(0,128),random(0,128),random(0,128));
      diamHit = random(75,150);
      ellipse(x,y,diamHit,diamHit);
      rectSizeRight = rectSizeRight-10;
      rectSizeRight = constrain(rectSizeRight, 10,150);     
    }
 
    // if ball hits left bar, change direction of X
    else if (x < 25 && y > yLeft-rectSizeLeft/2 && y < yLeft+rectSizeLeft/2 ) {
      speedX = speedX * -1.1;
      x = x + speedX;
      leftColor = 0;
    }
 
    else {    
      leftColor = 128;
      rightColor = 128;
    }
    // resets things if you win or lose
    if (x > width || x < 20) {
      gameStart = false;
      x = 150;
      y = 150;
      yLeft = y;
      speedX = random(3, 5);
      speedY = random(3, 5);
      rectSizeLeft = 150;
      rectSizeRight = 150;
    }
 
 
    // if ball hits up or down, change direction of Y  
    if ( y > height || y < 0 ) {
      speedY = speedY * -1;
      y = y + speedY;
    }
  }
}
void mousePressed() {
  gameStart = !gameStart;
}                                                                                                                                                                                                                               
