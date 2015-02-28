
void setup()
 { 
  size(400, 600);
   background(200, 100, 455);
   smooth(); 
  frameRate(85);
 } 


void draw() 
{

   fill( random(255), random(255), random(255), 50 );
  rect( 0, 0, width, height );
  fill(161, 96, 185);
  ellipse( mouseX, mouseY, 100, 100 );
 

}
