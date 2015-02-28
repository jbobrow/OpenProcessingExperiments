
float xPos = 0;
float yPos = 250;
float d = 30;
float xSpeed = 5;
float ySpeed = 10;

color fillColor = color(255);

void setup() {
  size (500, 500);
  background(0);
  smooth();
  fill(255);
  noStroke();
}

void draw() {
  //background(0);
  ellipse (xPos, yPos, d, d);
  xPos += xSpeed;
  yPos += ySpeed;
  
  fill(0, 10);
  rect(0, 0, width, height);
  
  fill(fillColor);
  
  
  if ((xPos > width) || (xPos < 0)) {
    xSpeed = xSpeed * -1;
    fillColor = color(random(255), random(255), random(255));
    d = random(10, 50);
    
  }
  
  if ((yPos > height) || (yPos < 0)) {
    ySpeed = ySpeed * -1;
    fillColor = color(random(255), random(255), random(255));
    d = random(10, 50);
  }
}

