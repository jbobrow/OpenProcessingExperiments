
import processing.pdf.*;


int patternSeperationX = 10;
int patternSeperationY = 10;
   
float position = 1.001;
float trans = 2;
  
void setup(){
  size(1000,500);
background (195,201,219);
     
  for(int i = 10; i < width/patternSeperationX; i++){
      for(int j = -10; j < height/patternSeperationY; j++){
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
     
  noStroke ();
  fill (random (0,255),random (1,23), random (2, 40), random (1, 10));
  rect (random(0,1000),random (10,1000),500,50);
  smooth();
  position = position * 1.001;
  trans = trans - 0.1;
  
}




