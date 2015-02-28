
void setup ()
{
  size ( 400, 600);
  background (255, 255, 255) ;
  smooth ();
  frameRate (70);  
} 

void draw() 

{
background (654, 758, 928); 
fill (random(255), random(255), random(255) ); 
triangle(0, 0, mouseY, mouseX, width, 0);

triangle( 400, 89, mouseX, mouseY, width, 0);
triangle (3, 4, mouseX, mouseY, width, 0); 

}
