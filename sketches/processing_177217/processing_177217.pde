
int counter;

void setup()
{
  size (200,200);
  background (255);
}
void draw()
{
  for(int i=0;i<400;i=i+5)
  {
  for(int j=0;j<400;j=j+5)
  {
    fill(random(255));
    rect(i,j,50,50);
  }
  }
}
