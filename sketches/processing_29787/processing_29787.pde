
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
import processing.pdf.*;

RFont font;

void setup() {
   size(1200,600);
   smooth();
   
   RG.init(this);
   font = new RFont("BEBAS___.TTF");
   font.setSize(300);
   
   noStroke();
   fill(0);
   //colorMode(HSB, 100);
}

void draw(){
  background(255);
  translate(30,400);
 // font.draw("Design");
  
  RCommand.setSegmentLength(mouseX-300);
 // Randpunkte der Schrift bestimmen
  RGroup grp = font.toGroup("media");
  grp = grp.toPolygonGroup();
  RPoint[] punkte = grp.getPoints();
  float a = mouseY-300;
  stroke(0);
  for (int i=0; i < punkte.length; i++){
    // pos1: point(punkte[i].x, punkte[i].y);
    // pos2: line(punkte[i].x-5, punkte[i].y-5, punkte[i].x, punkte[i].y); 
      float durchmesser = random(5,8);
      fill(random(0), random(0), random(0));
      ellipse(punkte[i].x, punkte[i].y, a, a);
     } 
  
  for (int i=0; i < punkte.length-1; i++){
    if (dist(punkte[i].x, punkte[i].y, punkte[i+1].x, punkte[i+1].y)<80){
    line(punkte[i].x, punkte[i].y, punkte[i+1].x, punkte[i+1].y);
    strokeWeight(random(0,0.5));}
  } 
}

void keyPressed() {
  if (key == 's') {
    println("Frame abspeichern");
    saveFrame("screenshot-####.tif");
  }
  
  if (key == 'b') {
   background(255);
  }
  
  if (key == 'p') {
    beginRecord(PDF, "zeichnung-####.pdf");
    background(255);
   

  }
  if (key == 'e') {
    endRecord();
  }
}


