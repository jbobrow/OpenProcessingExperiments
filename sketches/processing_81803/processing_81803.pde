
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/25920*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

RFont font;
float counter = 0;
PImage water;
void setup() {
  size(400,400);
  water = loadImage("water.png");
  smooth();

  RG.init(this);
  font = new RFont("miso-regular.ttf");
  font.setSize(200);
  font.setAlign(RFont.CENTER);
  
  noStroke();
  fill(0);
  colorMode(RGB,100);
}

void draw() {
  background(100);
  image(water,0,0);
  translate(width/2-10,height/2+30);
  
  RCommand.setSegmentLength(mouseX/2+6);
  
  RGroup grp = font.toGroup("Water");
  grp = grp.toPolygonGroup();
  RPoint[] punkte = grp.getPoints();
  
  noStroke();
  fill(0,100,100);
  for (int i=0; i < punkte.length; i++) {
//  point(punkte[i].x, punkte[i].y); 
//  line(punkte[i].x-5, punkte[i].y-5, punkte[i].x+5, punkte[i].y+5);
   float sinHeight = mouseY/float(height)*30;
    float offsetY = sin(counter+punkte[i].x/width*4)*sinHeight;

    ellipse(punkte[i].x, punkte[i].y+offsetY, 4, 4); 
  }
  
  for (int i=0; i < punkte.length-1; i++) {
    float abstand = dist(punkte[i].x, punkte[i].y, punkte[i+1].x, punkte[i+1].y);
    stroke(0,0,0,100-abstand*2);
    float sinHeight = mouseY/float(height)*30;
    float offsetY = sin(counter+punkte[i].x/width*4)*sinHeight;
    float offsetY2 = sin(counter+punkte[i+1].x/width*4)*sinHeight;
    line(punkte[i].x, punkte[i].y+offsetY, punkte[i+1].x, punkte[i+1].y+offsetY2);
  }
  
  counter+=0.05;
  
}





