
//Alina V, Rotating Cubes, CP1 mods 16,17
/* Click the mouse for a rotating cube
**/
float turn = 0.1;
void setup()
{
  size(500,500, P3D);
}
void draw()
{
  background(0);
  frameRate(5);
  //middle spheres
  translate(250, 250, 0);
  rotateY(turn);
  turn = turn + 0.2;
  noStroke();
  lights();
  fill(25, 188, 245);
  sphere(50);
  fill(255, 217, 0, 75);
  noLights();
  sphere(100);
 //red
  lights();
  translate(100, -60, 150);
  fill(255, 0, 0);
  sphere(25);
  //green
  translate(-30,80,0);
  fill(0,255,0);
  sphere(25);
  if (mousePressed == true)
  {
    background(0);
    translate(40,0,0);
    rotateX(turn);
    rotateY(turn);
    rotateZ(turn);
    stroke(1);
    fill(150,33,234);
    box(100);
  }
}
