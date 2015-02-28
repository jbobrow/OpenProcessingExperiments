
//Michael H. 16-17 cp1
//Hundred Shapes

void setup()
{
  size(300,300);
  frameRate (20);
  
}

void draw()
{
  background(0);
  int i=1;
  while(i<=100)
  {
    ellipse(int(random(300)),int(random(300)),30,30);
    i++;
    fill(0,200,200);
  }
}
