
//Dominique A., Cube3D, CP 1, Mod 16-17
/**
 Move mouse over sphere to move
 */

 void setup()
{
  fill(17,188,216);
  size(400,400,P3D);
  smooth();
  stroke(144,235,250);
  strokeWeight(2);
}
void draw()
{ 
  background(0);
  rect(0,0,150,150);
  rect(0,0,-125,50);
  rect(0,0,-50,125);
  rect(0,0,-150,-150);
  translate(250,250,0);
  camera(mouseX-400,mouseY-400,400,0,0,0,0,1,0);
  lights();
  pointLight(250,0,250,-150,-150,0);
  sphere(100);
}
