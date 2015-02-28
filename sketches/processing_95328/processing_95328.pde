
/*
Based on http://www.openprocessing.org/sketch/19065
Tweaked by @ramayac
*/

void setup(){
   size(400,400);
   noStroke();
   smooth();
}
 
void draw(){
   background(230);
   for(int i=0; i<=width; i+=50){
      for(int j=0; j<=height; j+=50){
        //using dist() in a nested for loop
        //creates a halftone spotlight effect
         float diameter = dist(mouseX,mouseY, i, j) / 3.3;
         fill(0, diameter*4); //added alpha channel
         ellipse(i,j, diameter, diameter); 
      }
   }
}
