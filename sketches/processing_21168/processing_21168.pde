
//import PDF library

import processing.pdf.*;

//create a boolean to turn recording on/off
boolean record;

void setup () {
  size (480, 720);
  background (0,134,123);
  smooth();
}

void draw () {

  //use an if statement to start recording
  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "frame-####.pdf");
  }
  strokeWeight(.5);
  stroke(0,91,92);
  for (int i = 0; i<20; i++) {
  line(0,height/3.2+i*15,width,height/3.2+i*15);
  //line(width/3.2+i*15,0,width/3.2+i*15,height);
   }
  
  rectMode(CENTER);
  noFill();
  stroke(166);
  strokeWeight(10);

  for (int i = 1; i < 9; i++) {
    rect (width/2, height/2, width -i*50, height-i*50);//grey rectangles
  }


  stroke(255);
  for (int i = 1; i < 9; i++) {
    rect (width/2, height/2, width -i*48, height-i*48);//grey rectangles
  }

  rect (width/2,height/2, 50, 50);//white rectangles
  rect (width/2,height/2, 15, 15);
  rect (width/2,height/2.7, 50, 50);
  rect (width/2,height/2.7, 15, 15);
  rect (width/2,height-height/2.7, 50, 50);
  rect (width/2,height-height/2.7, 15, 15);

  strokeWeight(5);
  stroke(166);
  rect(width/2,height/2,45,45);//gray rectangles
  rect (width/2,height/2,2,2);
  rect (width/2,height/2.7, 45, 45);
  rect (width/2,height/2.7,2,2);
  rect (width/2,height-height/2.7, 45, 45);
  rect (width/2,height-height/2.7,2,2);

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


                
                
