
float number;
void setup()
{
  size(450, 450, P3D);
  float number = 1;
  frameRate(.5);
}

void draw()
{
  background(0);
  int e = 0;
  while (e <=number)
  {
    pushMatrix();
    int x = int(random(50, 400));
    int y = int (random(50, 400));
    translate(x, y, 0);
    fill(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
    box(50);
    e++;
    popMatrix();
    
  }
  
  number = number*2;
  number++;
  if (e > 600)
  {
    number = 0;
  }
  fill(255);
  print(e +" ");
  text(e, 50, 50);
}
