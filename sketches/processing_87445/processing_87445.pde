

import geomerative.*;
float danceFactor = 2;
RFont font;
RGroup grp;


void setup() {
  size(1200, 300);
  smooth();
  noStroke();
  //fill(255, 10);

  RG.init(this);

  font = new RFont("FreeSans.ttf");
  font.setAlign(RFont.CENTER);
  font.setSize(200);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
}

void draw() {
  background(0, 0, 255);
  noFill();
  translate(width/2, height * 0.7);

  RCommand.setSegmentLength(mouseX/10 +2);

  grp = font.toGroup("Geomerative");
  grp = grp.toPolygonGroup();
  RPoint[] punkte = grp.getPoints();

  //  // Verbinden der Punkte
  //  for (int i=0; i < punkte.length-1; i++) {
  //    float distance = dist(punkte[i].x, punkte[i].y, punkte[i+1].x, punkte[i+1].y);
  //    //stroke(distance*6);  
  //    stroke(255, 255, 255, 10);
  //    line(punkte[i].x, punkte[i].y, punkte[i+1].x, punkte[i+1].y);
  //  }
  // randomize the points
  for (int i = 0; i < punkte.length; i++ ) {
    punkte[i].x += random(-danceFactor, danceFactor);
    punkte[i].y += random(-danceFactor, danceFactor);
  }
  // draw curved lines between points
  stroke(0);
  strokeWeight(0.5);
  beginShape();
  curveVertex(punkte[punkte.length-1].x, punkte[punkte.length-1].y);
  for (int i=0; i<punkte.length; i++) {
    curveVertex(punkte[i].x, punkte[i].y);
  }
  curveVertex(punkte[0].x, punkte[0].y);
  curveVertex(punkte[1].x, punkte[1].y);
  endShape();


  // Punkte auf Positionen
  noStroke();
  fill(255);
  for (int i=0; i < punkte.length; i++) {
    ellipse(punkte[i].x, punkte[i].y, 5, 5);
  }
}





