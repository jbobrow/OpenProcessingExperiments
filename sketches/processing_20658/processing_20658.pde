
//import PDF library

import processing.pdf.*;

//create a boolean to turn recording on/off
boolean record;

void setup () {

  size (480, 720);
  background (108,3,27);
}

void draw () {

  //use an if statement to start recording
  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "frame-####.pdf");
  }
rectMode(CENTER);
noFill();
stroke(255);
strokeWeight(10);
for (int i = 1; i < 5; i++) {
    rect (width/2, height/2, width -i*100, height-i*100);
}
  noStroke();
  fill (203, 110, 1);

  rectMode (CENTER);

  
  rect (width/2, height/8, width, 10);
  rect (width/2, height/4, width, 10);
  rect (width/2, height/2, width, 10);
  rect (width/2, height-height/4, width, 10);
  rect (width/2, height-height/8, width, 10);
  rect (width/2, height/2,50,50);
  fill (255);
  rect (width/2, height/2,30,30);
  fill (203,110,1);
  rect (width/2, height/2,10,10);

  stroke(0);
  line (width/2, height,720,240);
  line (width,height/3,240,0); 
  line (width/2,height-height/2-120,720,720);
  line (width-width/2,height-height/2-120,-720,-720);
  line (width/2,height,-480,0); 
  line (0,height/3,width/2,0);
  line (0,height/3,480,720);

  noFill();

  stroke (203, 110, 1);
  strokeWeight (20);


  rect (width/2, height/2, width, height);

  strokeWeight (10);
  for (int i = 1; i < 5; i++) {
    rect (width/2, height/2, width -i*80, height-i*80);
  }

  for (int i = 0; i <=720; i +=50) {
stroke(203, 110, 1);
    rect (23, i, 5, 5);
    rect (100,i, 5, 5);
    rect (380, i, 5, 5);
    rect (457, i,5,5);
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

                
                
