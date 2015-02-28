
PImage bild;
boolean recordPDF = false;
int drawMode = 1;
 
void setup() {
  size(700, 525);
  smooth();
  bild = loadImage("bild.png");
  noStroke();
}
 
void draw() {
  background(bild);
 
  switch(drawMode) {
 
  case 1:
    noStroke();
    for ( int x = 0; x <= width; x+=10) {
      for (int y=0; y <= height; y+=10) {
        float durchmesser = mouseX/5;
 
        if (durchmesser > 0) {
          fill(bild.pixels[(x + bild.width*y)]);      
          rect(x, y, durchmesser/12, durchmesser/12);
        }
      }
    }
    break;

 
  case 2:
    noStroke();
    for ( int x=0; x <= width; x+=10) {
      for (int y=0; y <= height; y+=10) {    
        float winkel = atan2(mouseY - y, mouseX - x);
        float durchmesser = mouseX/5;    
        if (durchmesser > 0) {
          pushMatrix();
          translate(x, y);
          rotate(winkel); 
          strokeWeight(durchmesser); 
          fill(bild.pixels[(x + bild.width*y)]);
          rect (0, 0, durchmesser/3, durchmesser/3);
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
}
 
public void keyPressed() {
  if (key == 's') saveFrame("img-####.png");
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, "img-####.pdf");
      recordPDF = true;
    }
  }
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      endRecord();
      recordPDF = false;
    }
  }
}

