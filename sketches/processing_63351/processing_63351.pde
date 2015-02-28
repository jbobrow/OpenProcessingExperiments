
int xPos = 0;
int yPos = 1;
int xSpeed = 20;
int ySpeed = 100;

void setup() {
  size(960, 640);
  background(255);
  noFill();
  smooth();
  frameRate(24);
}

void draw() {
  //background(255);
  
  stroke(random(255),random(55),random(55));
  strokeWeight(random(5));
  
  xPos = xPos + xSpeed;

  if (xPos >= width || xPos < 0) {
    xSpeed = xSpeed * (-1);
  }
  
  yPos = yPos + ySpeed;
  
 
  if (yPos >= height || yPos < 0) {
    ySpeed = ySpeed * (-1);
  } 
  
  float size = random(50);
  
  ellipse(xPos, yPos, size, size);
}

void mousePressed() {
  saveFrame("thumbnail.png");
}

