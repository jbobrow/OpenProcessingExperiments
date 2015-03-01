
import processing.pdf.*;

float x, y, z, a;
float angle = 0;
float angle2 = 200;
float r = 500;
float d = 1;

void setup(){
  size(600,600);
  beginRecord(PDF, "afternoon.pdf"); 
  background(#000000);
}

void draw(){
  
  x = r * sin(angle);
  y = r * cos(angle);
  z = r * sin(angle2);
  a = r * cos(angle2);
  //angle = angle + 0.01;
  
  strokeWeight(0.2);
  stroke(247, 178, 178);
  noFill();
  translate(width/2, height/2);
  rotate(angle);
  //line (0, 0, x, y);
  ellipse(0, 0, x, y);
  ellipse(0, 0, z, a);
  
  strokeWeight(0.2);
  stroke(197, 239, 198);
  noFill();
  translate(width/2, height/2);
  rotate(angle);
  //line (0, 0, x, y);
  ellipse(0, 0, z, a);
  
  
  
  
  angle = angle + 5;
  r = r - d;
  
  if (r == 0 || r ==300){
   d = d* -1; 
  }
  
  println(x + " : " +y);
}


void keyPressed(){
  if ( key == 'q'){
  endRecord();
  exit();
  }
}




