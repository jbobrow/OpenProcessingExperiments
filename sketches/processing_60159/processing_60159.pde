
PImage bild;
boolean recordPDF = false;
int drawMode = 1;
 
void setup() {
  size(800, 800);
  smooth();
  noStroke();
  noCursor();
  bild = loadImage("abstract1.jpg");
  bild = loadImage("abstract2.jpg");
}
 
void draw () {
  background(0);
 
 switch(drawMode) {
 
  case 1:
  for ( int x = 0; x <= width; x+=40) {
    for ( int y = 0; y <= height; y+=5) {
 
       float winkel = atan2(mouseY - y, mouseX - x);
      float durchmesser = mouseX/50;
       
      if (durchmesser > 0) {
        pushMatrix();
        translate(x,y);
        rotate(winkel);
        fill(bild.pixels[x + bild.width*y]);
        triangle(5, 5, durchmesser*2, 40,1,1);
        ellipse(100, 1, 1 ,1);
        ellipse(1, 100, 1 ,1);
        popMatrix();
      }
    }
  } 
  break;
  
  case 2:
  for ( int x = 0; x <= width; x+=40) {
    for ( int y = 0; y <= height; y+=5) {
 
       float winkel = atan2(mouseY - y, mouseX - x);
      float durchmesser = mouseX/50;
       
      if (durchmesser > 0) {
        pushMatrix();
        translate(x,y);
        rotate(winkel);
        fill(bild.pixels[x + bild.width*y]);
        rect(50, 50, 10, 10);
        ellipse(100, 1, 1 ,1);
        ellipse(1, 100, 1 ,1);
        popMatrix();
      }
    }
  } 
  break;
}
}
  
void keyReleased() {
  if (key == '1') drawMode = 1;
  if (key == '2') drawMode = 2;
  if (key == 'a') bild = loadImage("abstract1.jpg");
  if (key == 'b') bild = loadImage("abstract2.jpg");
}

public void keyPressed() {
    
  println("Taste:" + key);
  if (key == 's') saveFrame("abstract-####.png");
  
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, "abstract-####.pdf");
      println("recording started");
      recordPDF = true;
    }
  }
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
      background(0);
    }
  }
}


