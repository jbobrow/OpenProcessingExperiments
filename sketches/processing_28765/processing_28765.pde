
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
import processing.pdf.*;

int counter;

RFont font;
int i;

void setup() {
  size(1400,400);
  smooth();
  fill(0);
  RG.init(this);
  i = 50;
  font = new RFont("Bello-Script.ttf"); 
  font.align = RFont.CENTER;
  font.setSize(180);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
}

void draw () {
  background(0);
  translate(width/2, height/2);
 // font.draw("asdf");
  RCommand.setSegmentLength(mouseX/10+2);
  RGroup grp;
  grp = font.toGroup("www.gregorsams.at");
  grp = grp.toPolygonGroup();
  RPoint[] punkte = grp.getPoints();
//  punkte[0].x

  for (int i=0; i < punkte.length; i++) {
    ellipse(punkte[i].x, punkte[i].y, 1, 1);
  }

  for (int i=0; i < punkte.length; i++) {
    stroke(255,0,0);

  }
  
  for (int i=0; i < punkte.length-1; i++) { 
    float distance = dist(punkte[i].x, punkte[i].y, punkte[i+1].x, punkte[i+1].y);
    stroke(distance*5);
    line(punkte[i].x, punkte[i].y, punkte[i+1].x, punkte[i+1].y);
  }
  
  for (int i=0; i < punkte.length-2; i++) { 
    float distance = dist(punkte[i].x, punkte[i].y, punkte[i+2].x, punkte[i+2].y);
    stroke(distance*5);
    line(punkte[i].x, punkte[i].y, punkte[i+2].x, punkte[i+2].y);
  }
 
  for (int i=0; i < punkte.length-3; i++) { 
    float distance = dist(punkte[i].x, punkte[i].y, punkte[i+3].x, punkte[i+3].y);
    stroke(distance*5);
    line(punkte[i].x, punkte[i].y, punkte[i+3].x, punkte[i+3].y);
  }
  
  for (int i=0; i < punkte.length-4; i++) { 
    float distance = dist(punkte[i].x, punkte[i].y, punkte[i+4].x, punkte[i+4].y);
    stroke(distance*5);
    line(punkte[i].x, punkte[i].y, punkte[i+4].x, punkte[i+4].y);
  }
  
  for (int i=0; i < punkte.length-5; i++) { 
    float distance = dist(punkte[i].x, punkte[i].y, punkte[i+5].x, punkte[i+5].y);
    stroke(distance*5);
    line(punkte[i].x, punkte[i].y, punkte[i+5].x, punkte[i+5].y);
  }
  

}

void keyPressed() {
  if (key == 's') { 
    saveFrame("bild-####.png");
  }
  
  if (key == 'p') { 
   println("start recording");
   beginRecord(PDF,"zeichnung.pdf");
   colorMode(HSB, 100);
   background(0,0,0);
  }
  
  if (key == 'e') { 
    endRecord();
  }
}



