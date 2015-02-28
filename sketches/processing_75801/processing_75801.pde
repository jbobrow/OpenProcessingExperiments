
//Allison Wong, Rotating Cube, CP1 mods 4-5
//http://allisonprogrammingsite.webs.com/

void setup()
{
  size(300,300,P3D);
}
void draw()
{

}
void mouseDragged()
{
  background(32,178,170);
  fill(127,255,212);
  stroke(210,105,30);
  strokeWeight(5);
  translate(150,150,-250);
  rotateZ(-.5);
  rotateY(.5);
  rotateX(-.5);
  rotateX(mouseX);
  rotateY(mouseY);
  pointLight(255,0,255,-235,-240,275);
  camera(100,100,200,0,0,0,0,1,0);
  box(mouseX,mouseY,100);
}
