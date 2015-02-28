
PImage bild;
import processing.pdf.*;
boolean recordPDF = false;
PGraphicsPDF pdf;

void setup() {
  size(822, 548);
  smooth();
  noStroke();
  noCursor();
  bild = loadImage("getreidegasse.JPG");
  background(bild);
  pdf = (PGraphicsPDF) createGraphics(width, height, PDF, "pause-resume.pdf");
}

void draw() {

  for (int x=0; x< width; x+=10) {
    for (int y=0; y<height; y+=10) {
      float durchmesser = mouseX/50;


      if (durchmesser>0) {
        pushMatrix();
        translate(x, y);
        fill(bild.pixels[x+bild.width*y]);
        rect(0, 0, durchmesser, durchmesser);
        popMatrix();
      }
    }
  }

  if (mousePressed == true) {

    for ( int x=0; x<= width; x+=20) {
      for ( int y=0; y<=height; y+=20) {
        float durchmesser = 20-dist(mouseX, mouseY, x, y)/10;
        //umgedreht, ellipse sind dort wo die mausposition ist
        durchmesser += dist(width/2, height/2, x, y)/10;

        if (durchmesser > 0) {
          strokeWeight(durchmesser/5);
          stroke(bild.pixels[0]);
          //Farbwerte des Bildes für stroke laden
          line(x, y, x+durchmesser, y+durchmesser);
        }
      }
    }
  }
}


void mousePressed () {
  println("mouse gedrückt");
  for ( int x=0; x< width; x+=10) {
    for ( int y=0; y<height; y+=10) {

      float winkel = atan2(mouseY - y, mouseX - x);
      float durchmesser = 20-dist(mouseX, mouseY, x, y)/10;

      if (durchmesser > 0) {
        pushMatrix();
        translate(x, y);
        rotate(winkel);
        fill(bild.pixels[x + bild.width*y]);
        rect(0, 0, durchmesser, durchmesser);
        popMatrix();
      }
    }
  }
}

void keyReleased() {
  if (key == '1') bild = loadImage("eurpoark.JPG");
}


public void keyPressed() {
  println("Taste:" + key);
  if (key== 's') saveFrame("pattern-####.png");

  if (key== 'r' || key == 'R') {
    if (recordPDF == false) {
      beginRecord(PDF, "pattern-####.pdf");
      println("recording started");
      recordPDF = true;
    }
  }
  else if (key == 'e' || key == 'E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
      background(0);
    }
  }
}


