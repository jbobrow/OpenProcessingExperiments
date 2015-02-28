
boolean gameStart = false;
 
float x = 150;
float y = 150;
float speedX = random(3, 5);
float speedY = random(3, 5);
int leftColor = 128;
int rightColor = 128;
int diam;
int rectSize = 150;
float diamHit;
 
 
void setup() {
  size(700, 700);
  noStroke();
  smooth();
  ellipseMode(CENTER);
}
 
void draw() {
  background(29,169,206);
 
  fill(2,73,193);
  diam = 20;
  ellipse(x, y, diam, diam);
 
  fill(24,173,67);
  rect(0, 0, 20, height);
  fill(229,5,155);
  rect(width-30, mouseY-rectSize/2, 10, rectSize);
 
 
  if (gameStart) {
 
    x = x + speedX;
    y = y + speedY;
 
    if ( x > width-30 && x < width -20 && y > mouseY-rectSize/2 && y < mouseY+rectSize/2 ) {
      speedX = speedX * -1;
      x = x + speedX;
      rightColor = 0;
      fill(random(0,128),random(0,128),random(0,128));
      diamHit = random(75,150);
      ellipse(x,y,diamHit,diamHit);
      rectSize = rectSize-10;
      rectSize = constrain(rectSize, 10,150);     
    }
 
    else if (x < 25) {
      speedX = speedX * -1.1;
      x = x + speedX;
      leftColor = 0;
    }
 
    else {    
      leftColor = 252;
      rightColor = 252;
    }
    if (x > width) {
      gameStart = false;
      x = 150;
      y = 150;
      speedX = random(3, 5);
      speedY = random(3, 5);
      rectSize = 150;
    }
 
    if ( y > height || y < 0 ) {
      speedY = speedY * -1;
      y = y + speedY;
    }
  }
}
void mousePressed() {
  gameStart = !gameStart;
  
  text ("Score", 20,20);
}
