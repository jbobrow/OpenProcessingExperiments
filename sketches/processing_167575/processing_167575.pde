
float x, y;
float angle = 0;
float r = 400;
float diff = 1;
float a = 1;
float red = 10;
//import processing.pdf.*;
color col = color(23,221,206,a);
 
 
void setup() {
  size(600, 600);
  background(220,176,190);
// beginRecord(PDF, "every.pdf");
 
}
 
void draw() {
 
  fill(col);
   
  x = r * cos(angle);
  y = r * sin(angle);
 
 noStroke();
 stroke(255);

  
  translate(width/2, height/2);
  rotate(r);
 
  strokeWeight(0.5);
  ellipse(0, 0, x, y);
  strokeWeight(1);
  rect(x/2,y/2,2,2);
  rect(x/1.7,y/1.7,0.7,0.7);
 
 
  stroke(210,220,200);
  line(0,0,x,y);
  ellipse(x/2,y/2,200,200);
 
 
 
  angle = angle + 3;
  r = r - diff;
   
  red = red + 10;
  a = a + 10;
 
  if ( r == 100 || r == 500) {
    diff =  diff * -1;
  }
}



void keyPressed() { 
  if (key == 'q') { 
    endRecord();
    exit();
  }
}




















