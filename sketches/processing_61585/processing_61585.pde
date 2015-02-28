

import processing.pdf.*;

void setup(){
size(1000,500);
noLoop();
smooth();
}

void draw () {

  beginRecord(PDF, "recorded.pdf");
  background(200);
  fill(50);
  stroke(255);
  
   
  
  for( int i = 0; i < 100; i++){
    
    pushMatrix();
    
       for(int j = 0; j < 100; j++){
         float phase = i / 100.0 * TWO_PI;
         ellipse(0, cos(j) * 20, 5, 5);
         translate(0,20);
         
  }
 
 popMatrix(); 
 translate(10, 0);
  
}
 endRecord();
}


