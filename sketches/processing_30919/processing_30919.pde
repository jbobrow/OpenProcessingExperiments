
import processing.xml.*;
import geomerative.*;

RShape pajaro;
RPoint[][] pointPaths;

float xm, ym, newYm, newXm = 0;
float z = 0;

boolean ignoringStyles = true;

void setup(){
  size(600, 600,P3D);

 RG.init(this);
 RG.ignoreStyles(ignoringStyles);
 
 RG.setPolygonizer(RG.ADAPTATIVE);
 
 pajaro = RG.loadShape("origami.svg");
 pajaro.centerIn(g, 100, 1, 1);
 
 pointPaths = pajaro.getPointsInPaths();
 
}
 
void draw(){
  translate(width/2, height/2);
  
  newXm = mouseX/float(width) * TWO_PI;
  newYm = mouseY/float(height) * TWO_PI;

  background(255);
   z = constrain(10 * sin( frameCount/50.0 * PI), 0, 1000);
   noFill();
   for(int i = 0; i<pointPaths.length; i++){
     pushMatrix();
     translate(0,0,z);
    
    if (pointPaths[i] != null) {
      beginShape();
      for(int j = 0; j<pointPaths[i].length; j++){
        vertex(pointPaths[i][j].x, pointPaths[i][j].y);
      }
      endShape();
    }
    popMatrix();
  }

 
}
void mousePressed(){
 saveFrame(); 
}
  

