

//import PDF library

import processing.pdf.*;

//create a boolean to turn recording on/off
boolean record;

void setup () {

  size (480, 720);
  background (173,151,121);
  smooth ();
  
}

void draw () {
 

  //use an if statement to start recording
  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "frame-####.pdf");
  }
background (173,151,121);




  //bottom white rect
  for (int x = 0; x<width; x +=60) {

    noStroke();
    smooth ();
    fill(131,108,74);
    rect (x,50,60,60,80,150);
  }
  
  for (int x = 0; x<width; x +=60) {

    noStroke();
    smooth ();
    fill(62,38,3);
    rect (x,250,60,60,60,130);
  }
  
    for (int x = 0; x<width; x +=60) {

    noStroke();
    smooth ();
    fill(131,108,74);
    rect (x,290,60,60,60,130);
  }

   for (int x = 0; x<width; x +=60) {

    noStroke();
    smooth ();
    fill(62,38,3);
    rect (x,390,60,60,60,130);
  }
  
    //4 
   for (int x = 0; x<width; x +=60) {

    noStroke();
    smooth ();
    fill(131,108,74);
    rect (x,350,60,60,60,130);
  }
  //last one
     for (int x = 0; x<width; x +=60) {

    noStroke();
    smooth ();
    fill(131,108,74);
    rect (x,585,60,60,80,150);
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

