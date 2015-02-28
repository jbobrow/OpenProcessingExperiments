
import geomerative.*;
import processing.pdf.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

 color[] palette = new color[3000];


 
RFont font;
 
// Basierend auf P_3_2_1_01 Generative Gestaltung
 
void setup() {
  
  size(600,400);
  smooth();
  fill(0);
  colorMode(HSB, 255);
  
  RG.init(this);
 
  font = new RFont("GEIST_KNT.ttf");
  font.setAlign(RFont.CENTER);
  font.setSize(100);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH); 
  
  for(int i=0; i<palette.length; i++){ //schleife füllt farb array
    palette[i] = color(random(30, 255), 255, 255); //füllt die schubladen
  }
  
}
 
void draw() {
//  background(255);
  fill(0, 30);
  noStroke();
  rect(0, 0, width, height);
 

  
  pushMatrix();
  translate(width/2, height/2);
   
  RCommand.setSegmentLength((mouseY/5)-20);
  RGroup grp;
  grp = font.toGroup("STU");
  grp = grp.toPolygonGroup();
  RPoint[] punkte = grp.getPoints();
 
 popMatrix();
 
 
  
    noFill();
  // Linie nach links oben
  for (int i=0; i < punkte.length-1; i++) {
   strokeWeight(2); 
   stroke(palette[i], 40);
   curve((-mouseX+300)*-20, -1000, punkte[i].x+mouseX, punkte[i].y+mouseY, width/2, height, 0, 700+mouseY);  
  }
  
   // Verbinden der Punkte
  pushMatrix();
  
  translate(mouseX, mouseY);
  
  // Punkte auf Positionen
  noStroke();
  fill(0);
  for (int i=0; i < punkte.length; i++) {
    colorMode(RGB);
    fill(255); 
    ellipse(punkte[i].x, punkte[i].y, 3,3);
  }
  popMatrix();
}

void keyPressed(){
    //Save Frame
  if (key== 's') {
    println("Frame abspeichern");
    saveFrame("screenshot-####.tif");
  }
  
  //Begin Record 
  if (key=='b'||key=='B')
  {
    beginRecord(PDF, "zeichnung.pdf");
  }
  
  //End Record
  if (key=='e'||key=='E')
  {
    endRecord();
    exit();
  }
}


