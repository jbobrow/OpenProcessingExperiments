
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
import prosvg.*;

RFont font;
float counter = 0;
int zahl = 0;
 
void setup() {
  size(900,350);
  smooth();
 
  RG.init(this);
  font = new RFont("HelveticaLight.ttf");
  font.setSize(200);
  font.setAlign(RFont.CENTER);
   
  noStroke();
  fill(0);
  colorMode(HSB,100);
  background(0);
}

void draw() {
  fill(0,.45);
  rect(0,0,width,height);
 
  translate(width/2,height/2+90); 

  RCommand.setSegmentLength(300-counter);
  RGroup grp = font.toGroup("Spinne");  
  grp = grp.toPolygonGroup();           
  RPoint[] punkte = grp.getPoints();     
  for (int i=0; i < punkte.length-1; i++) {
    float distance = dist(punkte[i].x, punkte[i].y, punkte[i+1].x, punkte[i+1].y);
    stroke(255-distance*3.5);
    line(punkte[i].x, punkte[i].y, punkte[i+1].x, punkte[i+1].y);
    noStroke();
    fill(100);
    rect(punkte[i].x,punkte[i].y, 1, 5); //jaja, der letzte punkt fehlt...
  }
  if(mousePressed){
      counter = 0;
  }
  if(counter < 300){
    counter+=1;
  }
}

void keyReleased(){
  if(key == 's' || key == 'S'){
    zahl++;
    saveFrame("minimum"+zahl+".svg");
  }
}





