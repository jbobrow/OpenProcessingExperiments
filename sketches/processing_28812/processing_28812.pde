
 // ------ imports ------
import processing.pdf.*;
import java.awt.event.*;
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
import controlP5.*;

 
   
  // ------ image output -----
boolean savePDF = false;

ControlP5 controlP5;
String textValue = "";
Textfield myTextfield;
RFont font;
float opacity = 50;
color col;
float ellWidth  = 20;
float ellHeight = 20;
int angle = 0;

void setup(){
  
  size(900,700);
  controlP5 = new ControlP5(this);
  myTextfield = controlP5.addTextfield("your_text",-40,height/2-120,80,20);

  background(0);
  fill(255,102,0);
  noStroke();
   
  RG.init(this);
 
  font = new RFont("Helvetica Narrow CE Bold.ttf");
  font.setSize(200);
  font.setAlign(RFont.CENTER);
  initializeColors();

  smooth();
  ellipseMode(CENTER);
  angle += second(); 
}
 
void draw() {
   if (savePDF) {
    beginRecord(PDF, timestamp()+".pdf");
    }
  translate(width/2, height/2);
   myTextfield.setFocus(true); 
   initializeColors();
    
  // ------ image output ------
    if (savePDF) {
      savePDF = false;
      println("saving to pdf – finishing");
      endRecord();
      println("saving to pdf – done");
  
    }
}
 
 void initializeColors() {
    col = color(random(255),random(255),random(255),60);
}

 void mousePressed() {
  if (mouseButton == LEFT) {
    initializeColors();
  } else if (mouseButton == RIGHT) {
    background(0); 
  }
}

public void your_text(String theText) {
  RGroup grp = font.toGroup(theText);
  grp = grp.toPolygonGroup();
  RPoint[] punkte = grp.getPoints();

  
   background(0);
   fill(col);
   
//   for (int i=0; i < punkte.length; i++) {
   //fill(col[i],col[i],col[i],random(opacity));
  // float sinHeight = mouseY/float(mouseX*30);
   //float offsetY = sin(mouseX+punkte[i].x/width*4)*sinHeight; 
  // rect(punkte[i].x, punkte[i].y+offsetY, 4, 4);
//}

    
  // Linie nach links oben
  stroke(col);
  for (int i=0; i < punkte.length; i++) {
     line(punkte[i].x, punkte[i].y, punkte[i].x-100, punkte[i].y-100);  
  }
   
  // Punkte auf Positionen
  noStroke();
  for (int i=0; i < punkte.length; i++) {
    ellipse(punkte[i].x, punkte[i].y, 2,2);
    pushMatrix();
    translate(0, height/2);
    ellipse(punkte[i].x, punkte[i].y, 2,2);
    popMatrix();
  }


}
  void keyPressed(){
  if(key=='p' || key=='P') {
    savePDF = true; 
    println("saving to pdf - starting");
  }
}
  
  
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
  




 

