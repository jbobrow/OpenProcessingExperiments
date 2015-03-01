
float x, y;
float angle = 5;
float r = 350;
float diff = 0.5;
float a = 1;
float red = 10;
//import processing.pdf.*;
color col = color(23,221,206,a);
  
  
void setup() {
  size(600, 600);
  background(1,105,120);
// beginRecord(PDF, "every.pdf");
  
}
  
void draw() {
  
  fill(col);
    
  x = r * cos(angle);
  y = r * sin(angle);
  
 noStroke();
 stroke(152,190,241);
 
   
  translate(width/2, height/2);
  rotate(r);
  
  strokeWeight(0.5);
  ellipse(0, 0, x, y);
  strokeWeight(1);
  rect(x/2,y/2,2,2);
  ellipse(x*1.1,y*1.1,x*0.1,y*0.1);
  
  
  stroke(x*0.5,y*0.2,200);
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
