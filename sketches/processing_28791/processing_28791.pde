
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
import processing.pdf.*;

RFont font;
int i;

void setup() {
  RG.init(this);
  size(1000, 500);
  fill(0);
  smooth();
  i = 50;
 font = new RFont("Chalet Paris Nineteen Sixty.ttf", 50);
 font.align = RFont. CENTER;
 font.setSize(100);
 RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  
}


void draw() {
  background(255);
  translate(width/2, height/2);
  //font.draw("dkslkjadf");
  
  RCommand.setSegmentLength(mouseX/10+2);
  RGroup grp;
  grp = font.toGroup("formschoen");
  grp = grp.toPolygonGroup();
  RPoint[] punkte = grp.getPoints();
  
  for (int i=0; i< punkte.length; i++){
    ellipse(punkte[i].x, punkte[i].y, 4,4);
    stroke(100);
    //line(punkte[i].x, punkte[i].y, punkte[i].x+100, punkte[i].y-100);
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
    saveFrame("frame_####.png");
  }
   
  if (key == 'p') {
   println("start recording");
   beginRecord(PDF,"screen.pdf");
   colorMode(HSB, 100);
   background(0,0,0);
  }
   
  if (key == 'e') {
    endRecord();
  }
}

