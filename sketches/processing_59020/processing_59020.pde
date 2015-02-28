
float g = 0;
float gSpeed = 0.8;
PShape z;
import processing.pdf.*;
 
boolean recordPDF = false;
void setup() {
  size(700, 400);
  z = loadShape("mad_i.svg");
  smooth();
  background(255);

  
}

void draw () {
  float d = dist(pmouseX, pmouseY, mouseX, mouseY);
  if (mousePressed == true) {
      g=g+gSpeed;
      translate(mouseX, mouseY);
    z.disableStyle();
    stroke(5);
    strokeWeight(0.5);
    
    shape(z, 0,0,d*10+5,d*10+5);

  
}
}

void mousePressed() {
 println("mouse gedrückt");
  translate(mouseX, mouseY);
  fill(random(244,0));
  if (key == '1') z = loadShape("mad_ko.svg");
  if (key == '2') z = loadShape("mad_i.svg");
  if (key == '3') z = loadShape("mad_ka.svg");
  if (key == '4') z = loadShape("mad_ke.svg");
}



 
void keyPressed() {
   
  println("Taste gedrückt:" + key);
  if (key == 's') saveFrame("Mad-I-####.png");
 
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF,  "Mad-I-####.pdf");
      println("recording started");
      recordPDF = true;
    }
  }
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
      background(255);
    }
  }
}

