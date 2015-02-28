
/* @pgs preload="Tengus-Red-Forest.png, smilyCursor.png, sadCursor.png, diamond.png";*/
PImage shapesBG;
PImage cursorHit;
PImage cursorNormal;
PImage diamondShape;
int maxRockets = 6;
float[] rocketXs = new float[maxRockets];
float[] rocketYs = new float[maxRockets];
float[] rocketSpeeds = {5, 2, 7 };
boolean isHit = false;

void setup() {
    
      
  shapesBG = loadImage("background.png");
  cursorHit = loadImage("sadCursor.png");
  cursorNormal = loadImage("smilyCursor.png");
  diamondShape = loadImage("diamond.png");
  noCursor();
  size(600, 600);
  
  for (int i =0; i < maxRockets; i++) {
    rocketYs[i] = random(-300, 300);
    rocketXs[i] = 600;
  }

}

void draw() {
  image(shapesBG, 0, 0, width, height);
  
  if (mouseX >=60 && mouseX <=130 && mouseY >=80 && mouseY <= 140) {
    image(diamondShape, 70, 100, 70, 70);
      }
  
  if (mouseX >= 305 && mouseX <=360 && mouseY >= 200 && mouseY <= 300 ) {
    image(diamondShape, 325, 208, 70, 70);
      }    
      
  if (mouseX >= 400 && mouseX <= 480 && mouseY >= 400 && mouseY <= 490) {
    image(diamondShape, 432, 437, 70, 70);
      } 
      
   if (mouseX >= 400 && mouseX <= 480 && mouseY >= 400 && mouseY <= 490) {
    image(diamondShape, 432, 437, 70, 70);
      }
     
   if (mouseX >= 50 && mouseX <= 90 && mouseY >= 500 && mouseY <= 570) {
    image(diamondShape, 59, 517, 70, 70);
      }  
  
  for (int i =0; i < maxRockets; i++) {
    rocket(rocketXs[i], rocketYs[i]);
    rocketXs[i] -= rocketSpeeds[i];
    if (rocketXs[i] < -320) {
      rocketXs[i] = 600;
      rocketYs[i] = random(-300, 300);
    }
  }
  
  if (isHit == true) {
    image(cursorHit, mouseX - 25, mouseY - 25);
  }
  else {
    image(cursorNormal, mouseX - 25, mouseY -25);
  }
   

}

void rocket(float rocketX, float rocketY) {
  fill(255, 0, 0);
  float rocketLeftPoint = rocketX + 243;
  float rocketYPoint = rocketY + 270;
  //rect(243 + rocketX, 270 + rocketY, 60, 30);  //box used for collision debugging
  triangle(243 + rocketX, 288 + rocketY, 280 + rocketX, 270 + rocketY, 280 + rocketX, 300 + rocketY);
  rect(280 + rocketX, 270 + rocketY, 60, 30);
  
    if (mouseX < rocketLeftPoint + 97
      && mouseX > rocketLeftPoint
      && mouseY < rocketYPoint + 30
      && mouseY > rocketYPoint) {
       
        isHit = true; 
        
      }
      
      else {
        isHit = false;
        
      }
        
}



