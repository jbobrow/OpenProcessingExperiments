
float patternSeperationX = 0.5;
int patternSeperationY = 90;
    
float position = 20;
float trans = 20;
   
void setup(){
  size(1000,500);
background (215);
      
   
  fill(255);
  noStroke();
  //rect(0,0,patternSeperationX,patternSeperationY);
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
 
  

 noStroke();
 //noFill();
  fill (random (0,255),random (15,23), random (20, 40), random (0, 250));
  rect (random (0,position),random (0,1000),18,18);
  smooth();
   
  
  position = 0 * 1.00091;
  trans = trans - 0.5;
  
  
}


