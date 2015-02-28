

import processing.pdf.*;

//final assign2
float x, y;
float angle = 0; 
float r = 100;
float diff = 1; 

color col = color(255, 0, 0);

void setup() {
  size(600, 600);
  background(34, 37, 34);
  
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);


  strokeWeight(0.05); 
  //stroke(0); 




  translate(width/2, height/2); 
  //rotate(r); 

  //triangle(0,0, 0,0, y, x);

  stroke(255,94,38);
  triangle(0, 0, 0, 0, 1.7*x, 1.7*y);
  
  rotate(PI/3.0);
  //fill(100, 20, 0); 
stroke(255,234,55);
  triangle(0, 0, 0, 0, y, x);
  
  //rect(0,0,x,y,2*x, 2*y, 2*x, 2*y);
 
  //line( 0, 0, x, y); 


  stroke(46,248,255);
  //rotate(45); 
  //translate(width/2-40, height/2-40); 
  //stroke(0, 127, 0);
  line(0, 0, x, y);
  //width/y*10, height/x*70);



  //triangle(0,0, 0,0, x/20, y/20);

  angle = angle +2.5;
  r = r - diff;

  if ( r == 0 || r == 200) { 
    diff =  diff * -1;
  }
}



