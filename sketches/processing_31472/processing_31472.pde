

int patternSeperationX = 15;
int patternSeperationY = 15;
   
float position = 1;
float trans = 1;
  
void setup(){
  size(500,500);
background (244,245,227);
     
  
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
  rect (random (0,position),random (0,position),25,25);
  
 
  position = 100 * 1.00091;
  trans = trans - 0.5;


   noStroke(); 
    fill (52,0,34, random (0,10));
    rect (random (0,position),random (0,position),100,100);
  
 
    position = 50 * 1.00091;
    trans = trans - 0.5;
    
     noStroke(); 
    fill (237,233,211, random (0,40));
    rect (random (0,position),random (0,position),70,70);
  
 
    position =0 * 1.00091;
    trans = trans - 0.5;
}


