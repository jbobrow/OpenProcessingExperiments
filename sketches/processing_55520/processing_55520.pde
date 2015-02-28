
/* Code by Julia Grzeskowiak
York/Sheridan Joint Program in Design */
//reference: Sofía Quintana - http://openprocessing.org/sketch/3075//

float r = random(100);
   float x = random (50, 5);      // (low, high) parameters for randomization for variable x
   float m = random (100, 10);    // (low, high) parameters for randomization for variable m
   float n = random (150, 15);    // (low, high) parameters for randomization for variable n
   float o = random (200, 20);    // (low, high) parameters for randomization for variable o
  
void setup(){
  background(0);                  // background set to black
  size(700,700);
  smooth();
  noStroke();
 
}
void draw(){
 
  fill(mouseX, mouseY,x,r);           //Red hue determined by horizontal mouse coordinate, Green hue determined by vertical mouse coordinate, Blue hue determined by x value ((random(50,5)), opacity determined by r value (random 100)
  ellipse(225,225,mouseX,mouseX);     // x position 225, y position 225, width and height determined by horizontal mouse coordinate.
   
    fill(mouseX,mouseY,m,r);          //Red hue determined by horizontal mouse coordinate, Green hue determined by vertical mouse coordinate, Blue hue determined by m value ((random(100,10)), opacity determined by r value (random 100)
  ellipse(475,225,mouseX,mouseX);     // x position 475, y position 225, width and height determined by horizontal mouse coordinate.
  
   fill(mouseX, mouseY,n,r);          //Red hue determined by horizontal mouse coordinate, Green hue determined by vertical mouse coordinate, Blue hue determined by n value ((random(150,15)), opacity determined by r value (random 100)
  ellipse(225,450,mouseX,mouseX);     // x position 225, y position 450, width and height determined by horizontal mouse coordinate.
   
    fill(mouseX,mouseY,o,r);          //Red hue determined by horizontal mouse coordinate, Green hue determined by vertical mouse coordinate, Blue hue determined by o value ((random(200,20)), opacity determined by r value (random 100)
  ellipse(475,450,mouseX,mouseX);     // x position 475, y position 450, width and height determined by horizontal mouse coordinate.

}


