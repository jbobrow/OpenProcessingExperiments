
/**************************************************************

Generative Typography. Playing with fonts. Using libraries

***************************************************************/

import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
import processing.pdf.*;

int counter;

RFont font;

void setup(){
  size(800,600);
  smooth();
  noStroke(); //soll den Schriftzug nicht hinmalen, erst unten durch ellipsen

  RG.init(this);
  font=new RFont("Georgia Italic.ttf");
  font.setAlign(RFont.CENTER); 
  font.setSize(200);
}

void draw(){
 // background (0);
  noStroke();
  fill(0,30);
  rect(0,0,width,height); //fade
  translate(width/2, height/2); //male auf der höhe und breite meinen schriftzug
  
  RGroup grp;
  grp = font.toGroup("Marta");
  grp = grp.toPolygonGroup();
  RPoint[] punkte = grp.getPoints(); //erstell eine Liste mit den Koordinaten der Punkte die mein schriftzug hat (ecken des polygons)
  
  if(mousePressed){
    for(int i=0;i<punkte.length;i+=random(4)){ //i=i+random(3), wähle zufallswert zwischen 0 und 3 --> Auswahl vom Punkt
      punkte[i].x+=random(70); //zählt zufallswert zur x-koordinate des Punktes hinzu --> das was zum Punkt hinzusummiert wird
      punkte[i].x-=random(70);
      punkte[i].y+=random(100);
      punkte[i].y-=random(100);
    }
  }
  

  fill(255,0,255); //farbe von "Marta" 
  for(int aktuell=0; aktuell< punkte.length; aktuell++){ 
    //aktuell=0, solange aktuell< anzahl der Punkte in der Liste(array), malt es an der aktuellen Stelle einen Punkt hinzu mit dem was drunter steht, also ellipse
    ellipse(punkte[aktuell].x, punkte[aktuell].y,2,2); // ich bin an dem punkt.koordinate x und y und male eine ellipse mit druchmesser 2,2
  }
  endRecord();
}

void keyPressed(){
  if(key == 's' || key == 'S'){
    counter++;
    beginRecord(PDF,"marta"+counter+".pdf");
  }
}

