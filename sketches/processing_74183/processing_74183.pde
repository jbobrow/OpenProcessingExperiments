
//Alan C
//14-15
//http://alansprogrammingsite.webs.com/

float x = 10;
float y =10;

void setup()
{
  size(400, 400, P3D);
  background(0);
  stroke(0,255,100);
  strokeWeight(3);
  fill(13,54,255,220);
  smooth();
}
void draw()
{
  translate(200,180,0);
  rotateX(x);
  rotateY(y);
  background(0);
  box(150);
  frameRate(15);
  x = x + .09;
  y = y - .09;
}
