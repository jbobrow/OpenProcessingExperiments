
int patternSeperationX = 25;
int patternSeperationY = 25;
    
float position = 20;
float trans = 20;
   
void setup(){
  size(500,500);
background (255);
      
   
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
  fill (98,0,64, random (0,60));
  ellipse (random (0,position),random (0,position),50,50);
  smooth();
   
  
  position = 0 * 1.00091;
  trans = trans - 0.5;
  
  noStroke();
  fill (15,8,85, random (0,15));
  ellipse (random (0,position),random (0,position),80,80);
  smooth();
   
  
  position = 0 * 1.00091;
  trans = trans - 5;
 
 
   noStroke();
    fill (52,0,34, random (0,10));
    ellipse (random (0,position),random (0,position),10,10);
   smooth();
  
    position = 0 * 1.00091;
    trans = trans - 0.5;
     
     noStroke();
    fill (237,233,211, random (0,40));
    ellipse (random (0,position),random (0,position),60,60);
   smooth();
  
    position =0 * 1.00091;
    trans = trans - 2;
}


