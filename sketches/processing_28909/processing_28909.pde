
/**************************************************************
 
Generative Typography. Playing with fonts. Using libraries
 
***************************************************************/
 
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
import processing.pdf.*;

int counter;

float r = 100;
float g = 255;
float b = 50;
 
RFont font;
 
void setup(){
  size(800,600);
  frame.setResizable(true);
  frameRate(30);
  smooth();
  noStroke(); //soll den Schriftzug nicht hinmalen, erst unten durch ellipsen
 
  RG.init(this);
  font=new RFont("CaslonElegantAltItalic.ttf");
  font.setAlign(RFont.CENTER);
  font.setSize(200);
}
 
void draw(){
 // background (0);
  fill(0,90);
  noStroke();
  rect(0,0,width,height); //fade
  translate(width/2, height/2); //male auf der höhe und breite meinen schriftzug
   
  RGroup grp;
  grp = font.toGroup("Martina");
  grp = grp.toPolygonGroup();
  RPoint[] punkte = grp.getPoints(); //erstell eine Liste mit den Koordinaten der Punkte die mein schriftzug hat (ecken des polygons)
  
  if(mousePressed){
    for(int i=0;i<punkte.length;i+=random(15)){ //i=i+random(3), wähle zufallswert zwischen 0 und 3 --> Auswahl vom Punkt
      punkte[i].x+=random(70); //zählt zufallswert zur x-koordinate des Punktes hinzu --> das was zum Punkt hinzusummiert wird
      punkte[i].x-=random(70);
      punkte[i].y+=random(100);
      punkte[i].y-=random(100);
       
    }
  }

  
  
  for (int i=0; i < punkte.length; i++) {
    fill(r,r,b,95);
    float groesse = random(1,10);
    ellipse(punkte[i].x,punkte[i].y, groesse, groesse);
  }
  for(int i=0;i<punkte.length;i+=random(5)){
    fill(b,r,g,80);
    float groesse = random(2,20);
    ellipse(punkte[i].x,punkte[i].y, groesse, groesse);
  }

  
  endRecord();
}



 
void keyPressed(){
  if(key == 's' || key == 'S'){
    counter++;
    beginRecord(PDF,"martina"+counter+".pdf");
  }
   if(key == 'f' || key == 'F'){
    r = random(255);
    g = random(255);
    b = random(255);
  }
}

