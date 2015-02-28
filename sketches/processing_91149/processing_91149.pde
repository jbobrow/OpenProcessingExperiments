
void setup(){
 size(480,480);
 smooth();
 }
 void draw(){
  //draw a line with my mouse while my mouse is being pressed
  if(mousePressed == true){
   line(mouseX,mouseY,pmouseX,pmouseY);
    }
   }
   void mouseReleased(){
   stroke (random(0,255), random(0,255), random(0,255),120);
   }
