
import processing.pdf.*;

void setup() {
  size(600,600);
  frameRate(10);  
  beginRecord(PDF, "everything.pdf");
}

void draw() {
  //background(100);
  translate(width/2,height/2);
  strokeWeight(0.1);
  for (int j= 0; j<10; j++) {
    pushMatrix();
    rotate(radians(random(360)));
    for (int i = 0; i < 200; i++) {
      rotate(radians(random(-5,5)));
      scale(1.01);
      line(0,0,0,-0.5);
      translate(0,-0.5);
    }
    popMatrix(); 
  }
}

void keyPressed() {
  endRecord();
}
