
import processing.pdf.*;

import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
 
RFont font;
float counter = 0;
 
void setup() {
  size(1200,400);
  smooth();
 
  RG.init(this);
  font = new RFont("Georgia Italic.ttf");
  font.setSize(200);
  font.setAlign(RFont.CENTER);
   
  noStroke();
  fill(255);
 
}
 
void draw() {
  background(10);
  translate(width/2, height/2);
  //font.draw("dkslkjadf");
   
  RCommand.setSegmentLength(mouseX/10+2);
  RGroup grp;
  grp = font.toGroup("kookaburra");
  grp = grp.toPolygonGroup();
  RPoint[] punkte = grp.getPoints();
   
  for (int i=0; i< punkte.length; i++){
    ellipse(punkte[i].x, punkte[i].y, 4,4);
    stroke(255);
    line(punkte[i].x, punkte[i].y, punkte[i].x+10, punkte[i].y+20);
  }
 // punkte[0].x
  
  for (int i=0; i < punkte.length-1; i++) {
    float distance = dist(punkte[i].x, punkte[i].y, punkte[i+1].x, punkte[i+1].y);
    stroke(distance*2);
   line(punkte[i].x, punkte[i].y, punkte[i+1].x, punkte[i+1].y);
  }
 
}
   

void keyPressed() {
  if (key == 's') {
    println("Frame abspeichern");
    saveFrame("screenshot-####.tif");
  
  }

  
  if ( key == 'b') {
    background(255);
  }
  
  if ( key == 'p') {
    beginRecord(PDF, "zeichnung.pdf");
    background (255);
  }
  
  if (key == 'e') {
    endRecord();
  }
}


