
import processing.pdf.*;
boolean record;

void setup () {
  size (480,720);
  smooth();
}

void draw () {
if (record) {
    beginRecord (PDF, "rug-003.pdf");
  }
  background (252,176,145);
  rectMode (CENTER);
  noStroke();
  for (int i=20; i<=width-20; i+= 20) {
    for (int j = 20; j<=height-20; j+=20) {
      fill (166,174,180);
      ellipse (i, j, 10, 10);
    }
  }
  
  rect (width/2, height/2, width-20,20);
  rect (width/5, height/2,20, height-20);
  rect ( width/2+150,height/2-250, 50,50);

/* for (int k=0; k< height; k+=20) {
    fill (163,174,180);
    strokeWeight (5);
    line (0,k, width,k);
  }*/




//recording

if (record) {
 endRecord();
 record = false;
 }
}
 
 void keyPressed () {
 record = true;
 }
 
                
                
