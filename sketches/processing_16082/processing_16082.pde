
import processing.dxf.*;
import peasy.*;
PeasyCam cam;



boolean record = false;

void setup() {
  stroke(255);
  smooth();
  strokeWeight(1);
  
  size(800, 800, P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(200);
  cam.setMaximumDistance(50000);
 
}

void draw() {
  background(56);
  fill(247,12,12);;
  
  smooth ();
  lights();
  if (record) {
    beginRaw(DXF, "output.dxf");
  }
  
  for (int i = 0; i < 500; i=i+10) {
    pushMatrix();
    translate(i, height/6);
    rotateY(PI/2);
    box (random(5,9));
    
    translate(i, height/6);
    box(random (1, 3));
    
    translate(i, width);
    box(random (1,10));
    
    //fill(12,6,56);
   
   translate(i, width/5);
    box(random( 1,15));
    
    translate(i, 2*width);
    box(random (5,15));
    
    translate(i, width/2);
    box(random(3,35));
    
    translate(i, width);
    box(random (6,20));
    popMatrix();
  }


  if (record) {
    endRaw();
    record = false;
  }
}

void keyPressed() {

  if (key == 's') record = true;
}


