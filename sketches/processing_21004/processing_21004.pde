
//import PDF library

import processing.pdf.*;

//create a boolean to turn recording on/off
boolean record;

void setup () {

  size (480, 720);
  background (255);
}

void draw () {

  //use an if statement to start recording
  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "frame-####.pdf");
  }

  rectMode (CENTER);
  noStroke();
  fill (30);
  rect (width/2, height/2, width, height);




  for (int i = 0; i <height; i+=2.5) {

    if (i%2==0) {
      strokeWeight(.5);
    }

    else {
      strokeWeight (.75);
    }

    stroke (200-map(i, 0, height, 20, 150),map(i, 0, height, 0, 200), 255 -map(i, 0, height, 0, 255));
    line (0, i, width, i);
  }



  for (int i = 0; i <5; i++) {

    strokeWeight (3);
    stroke (230);

    line (0, 120+i*120, width, 120+i*120);

    strokeWeight (1.5);
    stroke (200, 180, 30);

    line (0, 60+i*120, width,60+i*120);
  }



  //top and bottom rectangles
  noStroke();
  fill (10, 20, 50);
  rect (width/2, 30, width, 60);
  rect (width/2, height-30, width, 60);



stroke (175);

line (0, 30, width, 30);
line (0, height-30, width,height-30);

  //diagonal lines
  stroke (250, 20, 20);
  strokeWeight (5);

  for (int i=0; i<5; i++) {
    line (i*120, 60, width, 60+120*(4-i));  
    line (width-i*120, 60, 0, 60+120*(4-i));  

    line (i*120, height-60, width, 180+i*120);  
    line (width-i*120, height-60, 0, 180+i*120);
  }


  stroke (220);
  line (0, 60, width, 60);
  line (0, height-60, width, height-60);


for (int i=0;i<7; i++) {
 
  fill (200, 70, 80);
  rect (i* 80, 30, 20, 20);
   rect (i* 80, height-30, 20, 20);
  
  
}


for (int i=0;i<7; i++) {
 
  noStroke();
  fill (250, 100, 200);
  rect (i* 80, 30, 5, 5);
   rect (i* 80, height-30, 5, 5);
  
  
}

noFill ();

stroke (250, 100, 200);
//ellipse (width/2, height/2, 200, 200);


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
