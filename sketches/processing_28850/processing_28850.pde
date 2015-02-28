
import controlP5.*;
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
 
RFont font;
int radius = 0;

void setup() {

    size(800,400);
    smooth();
  
    RG.init(this);
    font = new RFont("Aller_It.ttf");
    font.setSize(150);
    font.setAlign(RFont.CENTER);
 
    noStroke();  
}
 
void draw () {
  
  
  fill(0,5);
  rect(0,0,width,height);
  fill(0);
  
  translate(width/2-10,height/2+80);
  RCommand.setSegmentLength(mouseX/20);
  RGroup grp = font.toGroup("Serio");
  grp = grp.toPolygonGroup();
  RPoint[] punkte = grp.getPoints();
  
  for (int i=1; i < punkte.length-1; i+=50) { 
      stroke(random(0,255), random(0,255), random(200,255));      
      float wert = random(-1000, 1000);
      float wert2 = random (-1000, 1000);
      line(punkte[i].x, punkte[i].y, wert, wert2);
  }
  
    for (int i=0; i < punkte.length-1; i++) { 
      fill(233);
      noStroke();
      ellipse(punkte[i].x, punkte[i].y, 5, 5);
  }
   
}

void keyPressed() {
  if (key == 's') {
    saveFrame("bild-####.png");
  }
}


