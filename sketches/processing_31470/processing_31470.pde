

int patternSeperationX = 20;
int patternSeperationY = 20;
   
float position = 1;
float trans = 1;
  
void setup(){
  size(500,500);
background (255);
     
  
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
     
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
  fill (random (200,255), random(0,255));
  rect (random (0,position),random (0,position),22,22);
 
  position = position * 1.00091;
  trans = trans - 0.1;
}


