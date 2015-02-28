
int patternSeperationX = 75;
int patternSeperationY = 75;
   
float position = 1.001;
float trans = 10;
  
void setup(){
  size(1000,500);
background (180);
     
  
     
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
  //This is here so the program keeps running and the screengrab will work
}
   
   
void yourFunction(){
     
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
     
  
 stroke(random (0,255),random (1,23), random (2, 40),random(0,225));
  smooth();
  noFill();
  //fill (random (232,250),random (1,23), random (2, 40), random (1, trans));
  triangle (random(225,500),random (0,250),random (0,250),random(0,500),500,500);
  smooth();
  position = position * 1.001;
  trans = trans - 0.1;
}


