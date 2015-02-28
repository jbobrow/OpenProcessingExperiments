
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
import processing.pdf.*;

 
RFont font; 
void setup() {
  size(600,500);
  smooth();
  noStroke();
  fill(255);
   
  RG.init(this);
 
  font = new RFont("Smirnof.ttf");
  font.setAlign(RFont.CENTER);
  font.setSize(120);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH); 
}
 
void draw() {
  background(55);
  translate(width/2, height/2);
   
  RCommand.setSegmentLength(mouseX/10);
  RGroup grp;
  grp = font.toGroup("analog");
  grp = grp.toPolygonGroup();
  RPoint[] punkte = grp.getPoints();
 
   for (int i=0; i < punkte.length-1; i++) {
    float distance = dist(punkte[i].y, punkte[i].y, punkte[i+1].y, punkte[i+1].y);
    stroke(100); 
    line(punkte[i].x, punkte[i].y, punkte[i+1].x, punkte[i+1].y);
  }
     
  stroke(0,20);
  for (int i=5; i < punkte.length; i++) {
     line(punkte[i].x, punkte[i].y, punkte[i].x-100, punkte[i].y-200);
  }
     noStroke();
  for (int i=10; i < punkte.length; i++) {
    line(punkte[i].x, punkte[i].y, 20,2);
  }
   
}
void keyPressed() {
 if (key == 's') { saveFrame("asdf_####");}
 if (key == 'p') {beginRecord(PDF, "Zeichnung-####.pdf");
   colorMode(HSB, 100);
   background(0,0,100);

}
 if (key == 'e') {endRecord();  }
}

