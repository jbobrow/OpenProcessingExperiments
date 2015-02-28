
float g = 0;
float gSpeed = 0.8f;
PShape a;
boolean recordPDF = false;

public void setup() {
  size(1000, 800);
  a = loadShape("Geo1.svg");
  smooth();
  background(0, 0, 0);
}


public void draw() {
  float d = dist(pmouseX, pmouseY, mouseX, mouseY); 
  if (mousePressed == true) {
      g=g+gSpeed;
      translate(mouseX, mouseY);
    a.disableStyle();
    a.rotate(radians(g));
    shape(a, d*3,d*3,d*3,d*3);    
  }
}

public void mousePressed() {
 println("Maus");
  fill(random(80,140),random(100,180),random(20,70));
}

public void keyReleased(){
 if (key == '1') a = loadShape("Geo1.svg");
 if (key == '2') a = loadShape("Geo2.svg"); 
 if (key == '3') a = loadShape("Geo3.svg");
}

public void keyPressed() {
  
  println("Taste:" + key);
  if (key == 's') saveFrame("line-####.png");

  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, "Geonature-####.pdf");
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





