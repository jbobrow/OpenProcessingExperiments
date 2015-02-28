
import processing.pdf.*;

void setup(){
  size(900, 900);
  smooth();  
  translate(150,150);
  noStroke();
  beginRecord(PDF, "faces.pdf"); 
  repeatShape();
  endRecord();
}

void repeatShape(){
  int x = 0;
  for (int i=0; i < 9; i++){
    makeShape();
    translate(300,0);
    x++;
    if (x == 3){
      translate(-900,300);
      x = 0;
    } 
  }
}

void makeShape(){
  float circleSize = random(100,250);
  float circleColor[] = {random(0,255), random(0,255), random(0,255)};
  fill(circleColor[0], circleColor[1], circleColor[2]);
  ellipse(0,0,circleSize,circleSize);
}


