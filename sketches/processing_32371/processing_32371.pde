
float patternSeperationX = 1.5;
int patternSeperationY = 20;
    
float position = 20;
float trans = 20;
   
void setup(){
  size(1000,500);
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
 //noFill();
  fill (random (0,255),random (20,23), random (20, 40), random (0, 250));
  ellipse (random (0,position),random (0,1000),13,13);
  smooth();
   
  
  position = 0 * 1.00091;
  trans = trans - 0.5;
  
  //noStroke();
  //noFill();
  //fill (0, random (0,));
  //ellipse (random (0,position),random (0,1000),10,10);
  //smooth();
   
  
  //position = 0 * 1.00091;
  //trans = trans + 5;
 
 
   //noStroke();
   //noFill();
    //fill (random(0,200), random (0,255));
    //ellipse (random (0,0),random (0,1000),random(10,10),random(50,50));
   //smooth();
  
   // position = 0 * 1.00091;
   // trans = trans + 2;
     
     //noStroke();
     //noFill();
    //fill (random(0,225), random (0,250));
    //ellipse (random (0,500),random (0,1000),30,30);
   //smooth();
  
    //position =0 * 1.00091;
    //trans = trans + 2;
}


