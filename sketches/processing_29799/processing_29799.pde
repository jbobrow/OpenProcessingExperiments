
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
import processing.pdf.*;


RFont font;

void setup(){
  size(842,595);
  smooth();
  //noStroke();
  fill(255);
  RG.init(this);
  font=new RFont("FreeSans.ttf", 100, RFont.CENTER);
  font.setAlign(RFont.CENTER); 
  font.setSize(240);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
}

void draw(){
  background(#FFFFFF);
  translate(width/2, height/2);
  RCommand.setSegmentLength(mouseX);
  RGroup grp;
  grp = font.toGroup("maauu");
  grp = grp.toPolygonGroup();
  RPoint[] punkte = grp.getPoints();
  
  for(int i=0; i< punkte.length-1; i++){
    stroke(0);
    //fill(250);
    line(punkte[i].x, punkte[i].y,punkte[i].x+random(30,50), punkte[i].y+random(30,50));
  }

  stroke(100);
  for(int i=0; i< punkte.length; i++){
    stroke(0,50,80);
    fill(250);
    ellipse(punkte[i].x, punkte[i].y,10, 10);
  }
}


void keyPressed() {
  if(key=='s'){
    saveFrame("screenshot-####.tif");
  }
  if(key=='p'){
    beginRecord(PDF,"zeichnung####.pdf");
    colorMode(HSB,100);
    background(0,0,100);
  }
  if(key=='e'){
    endRecord();
  }
}

