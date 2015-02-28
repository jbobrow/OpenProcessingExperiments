
import processing.pdf.*;
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

RFont font;
void setup() {
    RG.init(this); 
    font = new RFont("FreeSans.ttf"); 
  font.setSize(170); 
    size(800,800);
    smooth();
    noStroke();
    fill(0);
    colorMode(HSB,100);
    
}

void draw () {
  background(2);
  translate(0,200);
//  font.draw("hello");
  
  
  RGroup grp = font.toGroup("GONZO");
  grp = grp.toPolygonGroup();
  RPoint[] punkte = grp.getPoints();
stroke (0);
  for (int i=0; i < punkte.length; i++) {
  fill(random(10,100),100,80);
  float durchmesser = random(2,10);
    ellipse(punkte[i].x,punkte[i].y, durchmesser, durchmesser);
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


