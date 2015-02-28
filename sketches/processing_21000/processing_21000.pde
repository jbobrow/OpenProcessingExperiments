
     import processing.pdf.*;
boolean record;
void setup () {
  size (480, 720);
  background (255);
  smooth();
}


void draw () {
  if (record) {
    beginRecord (PDF, "rug-001.pdf");
  }


  noStroke();
  fill (145,180,209);

  rectMode (CENTER);


  rect (width/2,height/2,width,height);
  stroke(15,57,110);
  strokeWeight(5);
  //1st//
  rect (width/2,height/2, width, height);
  //setting condition//

  for ( int i = 1; i < 8; i++) {
    /*rect ( width/2,height/2,width-1*30, height-1*30); 
     } */


    rect(width/2,height/2, width-40,height-40) ;
    rect(width/2,height/2, width-80,height-80) ;
    rect(width/2,height/2, width-120,height-120) ;
    rect(width/2,height/2, width-160,height-160) ;
    rect(width/2,height/2, width-200,height-200) ;
    rect(width/2,height/2, width-240,height-240);
    rect(width/2,height/2, width-340,height-340);
  }

  noStroke();
  fill(214,220,225);
  ellipse (width/2, height/2,90,90);

  fill ( 219,56,94);
  triangle (width/2-20, height/2+20, width/2, height/2-20, width/2+20, height/2+20);


if (record) {
  endRecord();
  record = false;
 }
 }
//if you press a key, a pdf will be recorded
 void keyPressed () {
  record = true;
 }

