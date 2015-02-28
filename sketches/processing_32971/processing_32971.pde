
void setup(){
  size(400,400);
}

//defines ball's coordinates
int centerX = 200;
int centerY = 200;
//defines "speed"
int speedX = 1;
int speedY = 3;

void draw(){
  background(232,230,19);
  //sets color values
  float r = random(255);
  float g = random(255);
  float b = random(255);
  
  //if centerX location is greater than or equal to 385, which is the stage width minus radius of the ellipse, then ball will go in the opposite direction, AND change to a random color value
  if(centerX >= 385){
  speedX = speedX * -1;
  fill(r,g,b);
  }
  if(centerX <= 15){
  speedX = speedX * -1;
  fill(r,g,b);
  }
  if(centerY >= 385){
  speedY = speedY * -1;
  fill(r,g,b);
  }
  if(centerY <= 15){
  speedY = speedY * -1;
  fill(r,g,b);
  }

  noStroke();
  ellipse(centerX, centerY, 30, 30);

  //initializes the ball's movement
  centerX = centerX + speedX;
  centerY = centerY + speedY;
}

