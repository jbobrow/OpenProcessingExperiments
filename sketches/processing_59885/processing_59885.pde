
float g = 0;
float gSpeed = 0.8f;
PShape s;
boolean recordPDF = false;
 
public void setup() {
  size(800, 800);
  s = loadShape("square.svg");
  smooth();
  background(255);
}
 
 
public void draw() {
  float d = dist(pmouseX, pmouseY, mouseX, mouseY);
  if (mousePressed == true) {
      g=g+gSpeed;
      translate(mouseX, mouseY);
    s.disableStyle();
    s.rotate(radians(g));
    shape(s, d*3,d*3,d*3,d*3);   
  }
}
 
public void mousePressed() {
 println("Mouse");
}
 
public void keyReleased(){
 if (key == '1') s = loadShape("square.svg");
 if (key == '2') s = loadShape("triangle.svg");
}
 
public void keyPressed() {
   
  println("Taste:" + key);
  if (key == 's') saveFrame("squarangle-####.png");
 
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, "squarangle-####.pdf");
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


