
import geomerative.*;
import processing.pdf.*;

RFont font;

void setup(){
  size(900,600);
  smooth();
  noStroke();
  background(50);
  RG.init(this);
  font=new RFont("Tuffy_Bold.ttf");
  font.setAlign(RFont.CENTER); 
  font.setSize(150);
}

void draw(){
  translate(width/2, height/2);
  RCommand.setSegmentLength(mouseX/10);
  RGroup grp;
  grp = font.toGroup("DANIELA");
  grp = grp.toPolygonGroup();
  RPoint[] punkte = grp.getPoints();


  for (int i = 0; i < punkte.length; i++ ) {
    strokeWeight(1);
    float durchmesser = 6;
    ellipse(punkte[i].x, punkte[i].y, durchmesser, durchmesser);
  }

  if(mousePressed) {
    background(50);
    for (int i = 0; i < punkte.length-5; i++ ) {
    float distance = dist(punkte[i].x, punkte[i].y, punkte[i+5].x, punkte[i+5].y);
    float l = distance;
    stroke(random(200,255), random(200,255), random(200,255));
    fill(100);  
    line(punkte[i].x-l, punkte[i].y-l, punkte[i].x-l, punkte[i].y+l);
    } 
  }

}

void keyPressed() {
  if(key == 's' || key == 'S'){
    saveFrame("bild-####.png");
  }
  if(key == 'p' || key == 'P'){
    background(50);
    beginRecord(PDF,"daniela.pdf");
  }
  if(key == 'e' || key == 'E'){
    endRecord();
  }
}

