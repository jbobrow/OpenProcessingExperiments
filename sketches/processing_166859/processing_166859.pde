
void setup()
{
  size(200,200);
  background(0);
}
  
  void draw()
  {
  int size = 200;
int N = 15;

size(size, size);

int step=width/N;
  for(int n=0; n<height; n+=step)
{
  stroke(color(255,0,147));
  line(0, n, n, height);
  line(n, height, height, height-n);
  line(height, height-n, height-n, 0);
  line(height-n, 0, 0, n);
}
  }





