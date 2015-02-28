
import processing.pdf.*;

import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;


RFont font;

void setup() {
  size(1500,700);
  smooth();
  fill(0);
  noStroke();
  RG.init(this);
  font = new RFont("saxmono.ttf",100,RFont.CENTER);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  
  RCommand.setSegmentLength(mouseX/4+2); 
  //font.draw("asl");
  RGroup grp;
  grp = font.toGroup("OUT OF BOX AWARD 2012");
  grp = grp.toPolygonGroup();
  RPoint[] punkte = grp.getPoints();
  
  stroke(100,100);
  
  for (int i=0; i< punkte.length-1; i++) {
    float distance = dist(punkte[i].x,punkte[i].y,punkte[i+1].x,punkte[i+1].y);
    stroke(distance*4);
    line(punkte[i].x,punkte[i].y,punkte[i+1].x,punkte[i+1].y);
  }
  
  noStroke();
    for (int i=0; i< punkte.length; i++) {
      ellipse(punkte[i].x,punkte[i].y, 1, 1);
  }
}

void keyPressed() {
 if (key == 's') { saveFrame("Poster_####");}
 if (key == 'p') {beginRecord(PDF, "Poster-####.pdf");
   colorMode(HSB, 100);
   background(0,0,100);
 
}
 if (key == 'e') {endRecord();  }
}


