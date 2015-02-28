
int patternSeperationX = 50;
int patternSeperationY = 50;
   
float position = 1.001;
float trans = 255;
  
void setup(){
  size(1000,500);
background (230);
     
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
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
  fill (random (0,255),random (1,23), random (2, 40), random (1, trans));
  triangle (random(500,220),random (0,500),random (0,500),random(0,500),500,500);
  smooth();
  position = position * 1.001;
  trans = trans - 0.1;
}


