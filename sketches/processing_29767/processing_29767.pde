
import processing.pdf.*;  
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

RFont font;

void setup(){
  size(400,400);
  smooth();
  noStroke();
  fill(255);
  RG.init(this);
  font=new RFont("Georgia Italic.ttf");
  font.setAlign(RFont.CENTER); 
  font.setSize(100);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
}

void draw(){

  //fill(0);
  //float angle=atan2(mouseY-y,mouseX-x);
  translate(width/2, height/2);
  //font.draw("asdf");
  RCommand.setSegmentLength((mouseX+1000)/(mouseY+1));
  //die xbewegung mit der Mouse verändert die anzahl der punkte
  RGroup grp;
  grp = font.toGroup("Do it!");
  grp = grp.toPolygonGroup();
  RPoint[] punkte = grp.getPoints();
  
  for(int i=0; i< punkte.length-1; i++){
    stroke(250);
    //line(punkte[i].x, punkte[i].y,punkte[i].x+random(30,50), punkte[i].y+random(30,50));
    line(punkte[i].x, punkte[i].y,punkte[i+1].x, punkte[i+1].y);
  }

  background(#FFFFFF);
  stroke(100);
  for(int i=0; i< punkte.length; i++){
    stroke(0);
    fill(250);
    rect(punkte[i].x, punkte[i].y,10,10);
    line((i+5)*2,i*10,i*8,i+10);
    //line(i,i/2,i/10,i*2);
  //punkte[0].x wäre die x-Koordinate vom ersten Punkt in der oben erstellten array
 //rotate(angle);
  }
}

void keyPressed() {
  if(key=='s'){
    saveFrame("screenshot-####.tif");
    //achtung: "" bei strings '' bei tasten
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

