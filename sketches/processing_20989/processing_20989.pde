

//import PDF library

import processing.pdf.*;

//create a boolean to turn recording on/off
boolean record;



void setup () {
  
    
  size (480, 720);
 
  
  
}

void draw () {
 
  //use an if statement to start recording
  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "frame-####.pdf");

  }
  
  smooth();
  
  background (227,181,133);
  noStroke ();
  
  
  
  for(int i = 0; i<12 ; i++){
    noFill();
    stroke(40);
    strokeWeight(10);
    ellipse (0,0,20+i*40,20+i*40);
    ellipse (0,720, 20+i*40, 20+i*40);
    ellipse (480,0, 20+i*40, 20+i*40);
    ellipse (480,720, 20+i*40, 20+i*40);
    
  }
  
  for(int x = 0; x<7 ; x++){
    noFill();
    stroke(40);
    strokeWeight(10);
    ellipse (0,360,20+x*40,20+x*40);
    ellipse (480,360,20+x*40,20+x*40);
   
  }
  
    for(int y = 0; y<4 ; y++){
    noFill();
    stroke(40);
    strokeWeight(10);
    ellipse (240,360,20+y*40,20+y*40);
  
    }

    //use an if statement to stop recording and turn recording off
  if (record) {
    endRecord();
    record = false;
  }

}
//if you press a key, a pdf will be recorded
void keyPressed () {
  record = true;
}



