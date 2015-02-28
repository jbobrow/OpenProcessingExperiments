

import processing.pdf.*;

float x, y;
float angle = 80; 
float r = 200;
float diff = 1; 

color c = color(20,50,0,0);

void setup() {
  size(600, 600);
  background(0,0,8);
  beginRecord(PDF, "every.pdf");
}

void draw() {

  
  
  x = r * cos(angle)*2;
  y = r * sin(angle)*2;

 



strokeWeight(0);
  fill(150,0,50,50);
  
  stroke(200,3,50,60);


  translate(width/2, height/2); 
  rotate(r); 

  ellipse(9, 9, x, y);
  //ellipse(x, 0, x, 50);
  //line( 0, 0, x, y); 
  noStroke();
   fill(50,0,50,30);
rect(100, y, 100, y);
ellipse(width/2 +x, height/2, 8, 8); 



  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}


void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}





