
import processing.pdf.*;

int l = 20;
int px;
int py;

void setup() {
  size (864, 864);
  noFill();
  strokeWeight(1);
  background(150);
  hexagons();
  beginRecord(PDF, "poop.pdf");
}

void hexagons() {
  pushMatrix();
  for (int i = 0; i < 13; i ++) {

    line(-l, 0, -l/2, round(-0.866*l));
    line(-l/2, round(-0.866*l), l/2, round(-0.866*l));
    line(l/2, round(-0.866*l), l, 0);
    line(l, 0, l/2, round(l*0.866));
    line(l/2, round(l*0.866), -l/2, round(l*0.866));
    line(-l/2, round(l*0.866), -l, 0);
    for (int j = 0; j < 6; j++) {
      rotate(PI/3);
      rect(-l/2, 3*l/2, l, l/2);
    }
    translate(0, 7*l/2);
  }
  popMatrix();
}

void draw() {
  translate(-6*l, 0);
  pushMatrix();
  for (int i = 0; i < 9; i ++) {
    translate(6*l, 0);
    hexagons();
  }
  popMatrix();
  pushMatrix();
  translate(-3*l, 7*l/4);
  for (int i = 0; i < 8; i ++) {
    translate(6*l, 0);
    hexagons();
  }
  popMatrix();
  
  endRecord();
}



