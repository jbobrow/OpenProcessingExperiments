
//Kitty Kwan, mods 4-5, Rotating Cube

float rotatex=0.1;
float rotatey=-0.1;

void setup() 
{
  size (500,500,P3D);
}

void draw ()
{
  background (120,146,216);
  fill (116,160,142);
  translate (mouseX,mouseY,0);
  rotateX(rotatex);
  rotateY(rotatey);
  lights ();
  box (300-mouseX);
  rotatex=rotatex + 0.01;
  rotatey=rotatey + 0.01;
  if (mousePressed ==true)
  {
    rotatex=rotatex+.1;
    rotatey=rotatey+.1;
  }
  translate(400-mouseX,400-mouseY,0);
  rotateX(rotatex);
  rotateY(rotatey);
  lights ();
  fill (103,40,40);
  box(400-mouseX);
}
