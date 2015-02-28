
float g = 0;
float gSpeed = 0.8;
PShape a;
import processing.pdf.*;

boolean recordPDF = false;
void setup() {
  size(800, 800);
  a = loadShape("Apfel.svg");
  smooth();
  background(255);
}


void draw() {
  float d = dist(pmouseX, pmouseY, mouseX, mouseY); 
  if (mousePressed == true) {
      g=g+gSpeed;
      translate(mouseX, mouseY);
    a.disableStyle();
    stroke(255);
    strokeWeight(0.5);
    a.rotate(radians(g));
    shape(a, 0,0,d*5+5,d*5+5);    
  }
}

void mousePressed() {
 println("mouse gedrückt");
  fill(random(206,229),random(103,187),random(39,145));
}

void keyReleased(){
 if (key == '1') a = loadShape("Birne.svg");
 if (key == '2') a = loadShape("Apfel.svg"); 
}

void keyPressed() {
  
  println("Taste gedrückt:" + key);
  if (key == 's') saveFrame("Apfeltool-####.png");

  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF,  "Apfeltool-####.pdf");
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





