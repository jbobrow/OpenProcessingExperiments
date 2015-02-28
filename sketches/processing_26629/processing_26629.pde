
import processing.pdf.*;
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;


RFont font;
RGroup grp;
RShape shp;

String words = "A";

RPoint[] safePoints = new RPoint[1];
float[] rotation = new float[1];
float[] scl = new float[1];

int count;


void setup(){
  
  //Geomerative initialisieren
  RG.init(this);
  size(400, 400);
  background(255);
  noStroke();
  fill(0);
  frameRate(200);
  count = 0;
  
  font = new RFont("AkkuratBold.ttf");
  font.setAlign(RFont.CENTER);
  font.setSize(300);
  grp = font.toGroup(words);
  shp = RG.loadShape("kristall.svg");
  shp = RG.centerIn(shp, g);

  while(count < 3000){
    pushMatrix();
    translate(width/2, height/2+140);
    grp.draw();
    popMatrix();
    
    int newX = (int)random(width);
    int newY = (int)random(height);
    
    color control = get(newX, newY);
    
    if(control == color(0,0,0)){
      count++;
      safePoints = (RPoint[]) expand(safePoints, count);
      safePoints[count-1] = new RPoint(newX, newY);
      
      rotation = expand(rotation, count);
      rotation[count-1] = radians(random(360));
      
      scl = expand(scl, count);
      scl[count-1] = random(0.01, 0.17);
    }   
  }
  
  background(255);
  smooth();
  fill(255);
  rect(0, 0, width, height);
  
  //String dateiname = words + ".pdf";
  //beginRecord(PDF, dateiname);
  
  for(int i=0; i<count; i++){
      pushMatrix();
      translate(safePoints[i].x, safePoints[i].y);
      scale(scl[i]);
      rotate(rotation[i]);
      RG.shape(shp);
      popMatrix();
  }
 
  //endRecord(); 
}
 



