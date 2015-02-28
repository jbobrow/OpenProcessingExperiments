
import processing.dxf.*;

boolean record;


void setup (){
  size(800,800,P3D);
smooth();

}


void draw() {
background (255);
 
 if (record) {
   beginRaw(DXF, "output.dxf");
 }

for (int i = 0; i < 60; i++){
   
  pushMatrix();
   
   rotate(radians(i));
   translate (i+690,150,35);
   scale(1,5,6);
  box(30,18,i++);
  sphere(i++);
  popMatrix();}
  
  if (record) {
   endRaw();
  record = false;
  }
  

}
void keyPressed(){
  if (key == 'r') record = true;}

