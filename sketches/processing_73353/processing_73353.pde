
//Nigel Z, Mods 14-15 CP1, Awkward Fan
float rot = 0.5;

void setup()
{
  noStroke();
  size (600, 600, P3D);
}
void draw()
{
 
  pointLight(255,255,255,mouseX,mouseY,300);
  background (175,180,176);
  translate (300,400,0);
  sphere (100);
  translate (0,-150,0);
  sphere (75);
  rotateZ(rot);
  translate (0,-100,0);
  sphere (50);
  translate (0,-50,0);
  sphere (25);
  rot= rot + 10;
}
