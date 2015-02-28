
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
import processing.pdf.*;


int counter;


RFont font;

void setup() {
 size(800,300);
 smooth();
 noStroke();

 
 RG.init(this); //Initialisierung der Library
 
 font = new RFont("telegrafico.ttf");
 font.align = RFont.CENTER;
 font.setSize(80);
 RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
 
}

void draw() {
  background (255);
  translate(width/2,height/2);
  
  
  
  RCommand.setSegmentLength(mouseX/10+2);
  RGroup grp;
  grp = font.toGroup("DAS KARTENSPIEL");
  grp = grp.toPolygonGroup();
  RPoint[] punkte = grp.getPoints();
  

  
  for(int i=0; i < punkte.length-1; i++){
    float distance = dist(punkte[i].x, punkte[i].y, punkte[i+1].x, punkte[i+1].y);
    stroke(distance*6,155,155,155);
    line(punkte[i].x, punkte[i].y, punkte[i+1].x+5, punkte[i+1].y+5);
  
  }
  
  
  
  
  for(int i=0; i < punkte.length-1; i++){
    float distance = dist(punkte[i].x, punkte[i].y, punkte[i+1].x, punkte[i+1].y);
    stroke(distance*2,155);
    line(punkte[i].x+2, punkte[i].y+2, punkte[i+1].x+2, punkte[i+1].y+2);
  
  }
  
  
    for(int i=0; i < punkte.length-1; i++){
    float distance = dist(punkte[i].x, punkte[i].y, punkte[i+1].x, punkte[i+1].y);
    stroke(distance*2,255);
    line(punkte[i].x+4, punkte[i].y+4, punkte[i+1].x, punkte[i+1].y);
  
  }
  
  
    for(int i=0; i < punkte.length-1; i++){
    float distance = dist(punkte[i].x, punkte[i].y, punkte[i+1].x, punkte[i+1].y);
    stroke(distance*3,180);
    line(punkte[i].x, punkte[i].y, punkte[i+1].x+15, punkte[i+1].y+15);
  
  }
  
  endRecord();

}

void keyPressed(){
  if(key == 's' ){
    counter++;
    beginRecord(PDF,"daskartenspiel"+counter+".pdf");
  }
}


