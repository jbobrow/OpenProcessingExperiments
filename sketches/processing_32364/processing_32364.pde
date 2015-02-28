

int patternSeperationX = 20;
int patternSeperationY = 20;
   
float position = 1;
float trans = 1;
  
void setup(){
  size(1000,500);
background (210);
    
     
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
 
  strokeWeight(5);
  stroke(random (0,150),random (1,9), random (2, 40), random (1, 100));
  noFill();
  //fill (random (200,255), random(0,255));
  rect (random (0,position),random (0,position),22,22);
 
  position = position * 1.00091;
  trans = trans - 0.1;
}


