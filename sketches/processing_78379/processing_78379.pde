
//Iam B
// Doubling shapes project for computer programming 1
void setup()
{
  size(500,500,P3D);
  noStroke();
  background(0);
  frameRate(10);
  smooth();
}
void draw()
{
  noStroke();
  background(0);
  pointLight(255,255,255,0,0,500);
  int count=1;
  int limit=2;
  while (count<=limit)
  {
    fill(100,(random(0,256)),(random(0,256)));
    pushMatrix();
    translate((random(0,500)),(random(0,500)),(random(0,-500)));
    sphere(30);
    popMatrix();
    count=count*2;
  }
  limit=limit*2;
}



