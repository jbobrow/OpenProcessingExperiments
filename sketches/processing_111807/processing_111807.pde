
//import processing.pdf.*;
 
float x, y, xx, yy;
float angle = 0;
float radius = 10;
float r = 600;
float diff = 1;
 
 
color col = color(0);
 
 
void setup() {
  size(600, 600);
  background(255,255,106);
  //beginRecord(PDF, "Sub.pdf");
}
 
void draw() {
 
  fill(col,50);
   
   
  x = r * cos(angle);
  y = r * sin(angle);
  xx = r * sin(radius);
  yy = r * cos(radius);
 
 
  strokeWeight(0.1);
  stroke(255);
 
  translate(width/2, height/2);
  rotate(r);
 
  
  //ellipse(0, 0, x, y);
  //ellipse(x, 0, x, 50);
  fill(0,0,106, 50);
  ellipse(0, 0, x-1, y-1);
  fill(0,14, 80 );
  strokeWeight(3);
  stroke(255,random(30,100) );
  ellipse( x, y, 100, 100); //
 
  angle = angle ;//
  radius = radius + 5;
  r = r - diff;
 
  if ( r == 0 || r == 600) {
    diff =  diff * -1;
  }
}
 
 
/*void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}*/


