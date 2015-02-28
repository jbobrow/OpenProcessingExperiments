
int patternSeperationX = 25;
int patternSeperationY = 25;
     
void setup(){
  size(500,500);
background (255);
      
  fill(255);
  noStroke();
       
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int ii = 0; ii < height/patternSeperationY; ii++){
        pushMatrix();
        translate(i*patternSeperationX, ii*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
       
}
void draw(){   
  }   
void yourFunction(){
  
  
 noStroke();
  fill (random (20,60),25,255,25 );
  ellipse (random (10),random (10),random(50),random(50));
  smooth();

   
  noStroke();
  fill ( random (10,20),255,255,25);
  ellipse (random (10),random (10),random (80),random (80));
  smooth();
    
   
   noStroke();
    fill (57,164,165, random (0,20));
    ellipse (random (10),random (10),random (10),random (10));
   smooth();
   
   
    noStroke();
    fill (57,164,165, random (50,60));
    ellipse (random (10),random (10),random (60),random (60));
   smooth();
   //println("finished");
  //exit();
}


