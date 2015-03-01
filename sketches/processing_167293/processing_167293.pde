
float angle = 0;
float r = 150;
float d = 0.5;
import processing.pdf.*;

void setup(){
  size(600,600);
  background(255);
  
  
  
}
void draw(){
  float x = r* sin(angle);
  float y = r* cos(angle);
  
noFill();
stroke(#9725C9,25);

ellipse(width/2, height/2,width/2-x,height/2-y);
triangle(width/2, height/2,width/2-x,height/2-y,width/2+x,height/2+y);

  rotate (angle);
  angle = angle +0.1;
  r ++ ;
  r = r-d;
  //same like 'angle ++' 'angle += 0.01'
  println(angle);
  
}

void mousePressed() {
  beginRecord(PDF, "Lines.pdf"); 
  background(255);
}

void mouseReleased() {
  endRecord();
  background(255);
}
