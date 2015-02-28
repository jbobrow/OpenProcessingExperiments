
import processing.pdf.*;
PShape a;
float g = 0;
float gSpeed = 0.9;
boolean recordPDF = false;

void setup() {
  size(700, 300);
  a = loadShape("triangel.svg");
  smooth();
  background(255);
}


void draw () {
  float d = dist(pmouseX, pmouseY, mouseX, mouseY);
  if (mousePressed == true) {
    g=g+gSpeed;
    translate(mouseX, mouseY);
    a.disableStyle();
    stroke(1);
    strokeWeight(0.8);
    shape(a, 0, 0, d*-4-1, d*-4-1);
    noFill();
  }
}


void mousePressed() {
  println("mouse gedrückt");
  translate(mouseX, mouseY);
  fill(random(250));
  if (key == '1') a = loadShape("triangel.svg");
  if (key == '2') a = loadShape("circle.svg");
  if (key == '3') a = loadShape("quadrat.svg");
}


void keyPressed() {

  println("Taste gedrückt:" + key);
  if (key == 's') saveFrame("Liny-####.png");

  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, "Liny-####.pdf");
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


