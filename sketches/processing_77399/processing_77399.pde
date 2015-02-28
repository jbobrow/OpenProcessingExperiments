
//Iam B
//100 random shapes project for computer programming 1
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
  int number=1;
  while (number<101)
  {
    fill(100,(random(0,256)),(random(0,256)));
    pushMatrix();
    translate((random(0,500)),(random(0,500)),(random(0,-500)));
    sphere(30);
    popMatrix();
    number=number+1;
  }
}


