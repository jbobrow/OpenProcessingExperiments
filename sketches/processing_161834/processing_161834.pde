
//egg script by Formo , mathematic solution by "Moss Egg" Robert Dixon , Mathographic

import processing.pdf.*;

void setup() {
  size (800, 800);
  smooth();
  frameRate(2);
}


void draw () {
  background(255);
 egg(200);

 egg(50);
    egg(20);
   
}

void egg(float x) {


  //ellipse egg constructor

  noFill();
  strokeWeight (.5);
  stroke(0);
  //ellipse (300,300,50,50);
  ellipse (width/2, height/2, 2*x, 2*x);
  //ellipse (275,300,100,100);
  ellipse (width/2-x, height/2, 4*x, 4*x);
  //ellipse (325,300,100,100);
  ellipse (width/2+x, height/2, 4*x, 4*x);
  //ellipse (300,275,(((50 *sin (radians (45)))-25)/ sin (radians (45)))*2,(((50 *sin (radians (45)))-25)/ sin (radians (45)))*2);
  ellipse (width/2, height/2-x, (((2*x *sin (radians (45)))-x)/ sin (radians (45)))*2, (((2*x *sin (radians (45)))-x)/ sin (radians (45)))*2);

  line(width/2, height/2, width/2-x, height/2);
  line(width/2, height/2, width/2+x, height/2);
 line(width/2, height/2, width/2, height/2-x);
 line(width/2+x, height/2, width/2, height/2-x) ;
  line(width/2, height/2-x, width/2-cos (radians(45))*((((2*x *sin (radians (45)))-x)/ sin (radians (45)))), height/2-x-cos (radians (45))*(((2*x *sin (radians (45)))-x)/sin(radians (45))));

  strokeWeight (5);
  stroke(0);
  //point 
 point (width/2, height/2);
  point (width/2-x,height/2);
 point (width/2+x,height/2);
  point (width/2,height/2-x);
  point (width/2-cos (radians(45))*((((2*x *sin (radians (45)))-x)/ sin (radians (45)))), height/2-x-cos (radians (45))*(((2*x *sin (radians (45)))-x)/sin(radians (45))));

  strokeWeight (3);
  stroke(0, 100);
 
  //egg
  arc(width/2, height/2, 2*x, 2*x, 0, PI);
  arc(width/2-x, height/2, 4*x, 4*x, 7*PI*.25, 2*PI);
  arc(width/2+x, height/2, 4*x, 4*x, PI, 5*PI*.25);
  arc(width/2, height/2-x, (((2*x *sin (radians (45)))-x)/ sin (radians (45)))*2, (((2*x *sin (radians (45)))-x)/ sin (radians (45)))*2, 5*PI*.25, 7*PI*.25 );
}



