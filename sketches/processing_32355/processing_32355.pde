
int patternSeperationX = 20;
int patternSeperationY = 20;
   
float position = 0.1;
//float trans = 50;
  
void setup(){
  size(1000,500);
background (200);

     
  
     
  for(int i = -5; i < width/patternSeperationX; i++){
      for(int j = -5; j < height/patternSeperationY; j++){
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
  fill (random (0,255),random (1,23), random (2, 40), random (50,100));
  rect (random (0,position),random (0,position),25,25);
  position = position * 0;
  //trans = trans - 0;
  
  //noStroke(); 
  //fill(255,255,255,random (70,100));
  //rect (random (0,position),random (0,position),20,20);
  //position = position * 0;
  //trans = trans - 2;
  
  
   //noStroke(); 
  //fill(255,255,255,random (0,15));
  //rect (random (0,position),random (0,position),30,30);
  //position = position * 1.001;
  //trans = trans - 2;
  
   
}




