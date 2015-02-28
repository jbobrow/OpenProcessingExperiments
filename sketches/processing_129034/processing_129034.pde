
boolean gameStart = false;//Game doesnt start if mouse isnt pressed
 
float x = 150;
float y = 150;
float speedX = random(3, 5);
float speedY = random(3, 5);
int leftColor = 255;
int rightColor = 255;
int diam;
int rectSize = 150;
float diamHit;
 
 
void setup() {
  size(500, 500);// Define sketch window size
  noStroke();// No Stroke
  smooth();// Smooth animation
  ellipseMode(CENTER); // Ball
}
 
void draw() {
  background(0); // Set background to black
 
  fill(45, 255, 0);
  diam = 20;
  ellipse(x, y, diam, diam);
 
  fill(leftColor);
  rect(0, 0, 20, height);
  fill(rightColor);
  rect(width-30, mouseY-rectSize/2, 10, rectSize); // Pong bat
 
 
  if (gameStart) {
 
    x = x + speedX;
    y = y + speedY;
 
    // if ball hits movable bar, invert X direction and apply effects
    if ( x > width-30 && x < width -20 && y > mouseY-rectSize/2 && y < mouseY+rectSize/2 ) {
      speedX = speedX * -1;
      x = x + speedX;
      rightColor = 0;
      fill(45, 255, 0);
      diamHit = random(75,150);
      ellipse(x,y,diamHit,diamHit);
      rectSize = rectSize-05;
      rectSize = constrain(rectSize, 10,150);     
    }
 
    // if ball hits wall, change direction of X
    else if (x < 25) {
      speedX = speedX * -1.1;
      x = x + speedX;
      leftColor = 0;
    }
 
    else {    
      leftColor = 255;
      rightColor = 255;
    }
    // resets things if you lose
    if (x > width) {
      gameStart = false;
      x = 150;
      y = 150;
      speedX = random(3, 5);
      speedY = random(3, 5);
      rectSize = 150;
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

