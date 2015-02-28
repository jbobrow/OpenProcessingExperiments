
PImage bild;
boolean recordPDF = false;
int drawMode = 1;

void setup() {
  size(700, 464);
  smooth();
  noStroke();
  noCursor();
  bild = loadImage("bild1.jpg");
}

void draw() {
  background(bild);

  switch(drawMode) {

  case 1:
    rect(0, 0, width, height);

    for ( int x=0; x<=width; x+=10) {
      for ( int y=0; y<= height; y+=10) {
        float abstand = dist (mouseX, mouseY, x, y);
        float angle = atan2(mouseY-y, mouseX-x);
        pushMatrix();
        translate(x, y);
        rotate(angle);
        ellipse(30, 23, 10, 30);
        line(30, 5, 10, 30);
        fill(bild.pixels[(x + bild.width*y)]);
        popMatrix();
      }
    }
    break;

  case 2:
    noStroke();
    for ( int x=0; x <= width; x+=5) {
      for (int y=0; y <= height; y+=5) {    
        float winkel = atan2(mouseY - y, mouseX - x);
        float durchmesser = mouseX/5;    
        if (durchmesser > 0) {
          pushMatrix();
          translate(x, y);
          rotate(winkel); 
          strokeWeight(durchmesser); 
          fill(bild.pixels[(x + bild.width*y)]);
          rect (0, 0, durchmesser/1, durchmesser/1);
          popMatrix();
        }
      }
    } 
    break;

  case 3:
    noStroke();
    for ( int x = 0; x <= width; x+=10) {
      for (int y=0; y <= height; y+=10) {
        float durchmesser = mouseX/5;

        if (durchmesser > 0) {
          fill(bild.pixels[(x + bild.width*y)]);      
          rect(x, y, durchmesser/20, durchmesser/20);
        }
      }
    }
    break;
  }
}
public void keyReleased() {
  if (key == '1') drawMode = 1;
  if (key == '2') drawMode = 2;
  if (key == '3') drawMode = 3;
  if (key == '4') bild = loadImage("bild1.jpg");
  if (key == '5') bild = loadImage("bild2.jpg");
  if (key == '6') bild = loadImage("bild3.jpg");
}

public void keyPressed() {
  if (key == 's') saveFrame("PictureSalzburg-####.png");

  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, "Picture-####.pdf");
      println("recording started");
      recordPDF = true;
    }
  }
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      endRecord();
      recordPDF = false;
      background(0);
    }
  }
}


