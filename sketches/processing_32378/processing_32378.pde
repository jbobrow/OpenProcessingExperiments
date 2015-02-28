
import processing.pdf.*;


int patternSeperationX = 10;
int patternSeperationY = 1;
   
float position = 1.001;
float trans = 5;
  
void setup(){
  size(1000,500);
background (195,201,219);
     
  for(int i = -15; i < width/patternSeperationX; i++){
      for(int j = -60; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
     
}
   
   
void draw()
{

}
   
   
void yourFunction(){
     
strokeWeight(random(1,20));
  stroke(random (0,150),random (1,9), random (2, 40), random (1, 7));  
  noFill();
  //fill (random (0,255),random (1,23), random (2, 40), random (1, 10));
  rect (random(0,1000),random (10,1000),1500,30);
  smooth();
  position = position * 1.001;
  trans = trans - 0.1;
  
}




