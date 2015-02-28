
float xPos;
float yPos;
float xVel;
float yVel;

void setup (){
  size (600, 400);
  background (#4D4D4D);
  
  xPos = width/2;
  yPos = height/2;
  xVel = 1;
  yVel = 2;
}

void draw (){
  background(#4D4D4D);
  
  xPos = xPos + xVel;
  yPos = yPos + yVel;
  
  if (yPos + 30 > height || yPos - 30 < 0){
    yVel = yVel *  -1;
}

if (xPos + 30 > width || xPos + 30 < 0) {
  xVel = xVel * -1;
}
fill (0); noStroke();
ellipse(xPos, yPos, 60, 60);

}
