
int xPos = 0;
int yPos = 50;
int speed = 5;
int yspeed = 8;

void setup() {
  size(500,500);
  fill(200,220,180);
  smooth();
  noStroke();
}

void draw() {
  background(255);
  xPos = xPos + speed;
  if (xPos >= width || xPos < 0){
  speed = speed * (-1);
  }
  
  yPos = yPos + yspeed;
  if (yPos >= height || yPos < 0){
  yspeed = yspeed * (-1);
  }
  ellipse(xPos, yPos, 70, 70);
}

