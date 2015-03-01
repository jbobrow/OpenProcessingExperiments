
void setup ()
{
  size(400, 400, P3D);
  stroke(20,5,255);
  noFill();
}
void draw ()
{
  background (0);
  translate (width/2, height/2);

  rotateX(frameCount*PI/60.0);
  rotateY(frameCount*PI/60.0);
  rotateZ(frameCount*PI/60.0);
  box(200, 200, 200);
}
