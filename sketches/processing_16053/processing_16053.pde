

void setup(){
  size (720,480);
  strokeWeight (50);
  background(255);
  smooth();
 
}
void draw (){
 stroke (random (0, 255), random (0, 255), random (0, 255));
  //ellipse (mouseX, mouseY, 50, 50);
   line (pmouseX,pmouseY,mouseX,mouseY );
   
}
 void mousePressed(){
  saveFrame();
 }
  
 
  

