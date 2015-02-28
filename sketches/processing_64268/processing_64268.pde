
int xPos = 0;
int yPos = 80;
int speed = 20;
int yspeed = 100;
 
void setup() {
  size(500,500);
  fill(0,200,0);
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
  ellipse(xPos, yPos, 20, 20);
}

