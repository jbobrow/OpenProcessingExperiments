
void setup() {   
  size(380, 800);   
  background(255);   
  smooth();   
  noLoop();   
  noFill();
}   
int rows = 12; 
int columns = 25; 
int side = 30; 
//of the square & distance   
//variables to calibrate the randomness 
float translationRandomness = .5; 
float rotationRandomness = 1;   
void draw() {     
  for (int r = 0; r<rows ; r++) {     
    for (int c = 0; c<columns; c++) {       
      pushMatrix();         //10 is the margin       
      float xPos = 10 + r*side + (random(-translationRandomness*c, translationRandomness*c));       
      float yPos = 10 + c*side + (random(-translationRandomness*c, translationRandomness*c));       
      translate(xPos, yPos);         
      float rotation = random(-c*rotationRandomness, c*rotationRandomness);             
      rotate(radians(rotation));         
      rect(0, 0, side, side);       
      popMatrix();
    }
  }
}

