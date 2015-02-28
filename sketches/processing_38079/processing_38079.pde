
void setup()
{
  background(0, 0, 0);
  size(500, 500);
  smooth();
  noStroke();
}

int column = 11;
int row = 11;

void draw()
{
  for(int x = 0; x<column; x+=1)
  {
    for(int y = 0; y<column; y+=1)
    {
        arc(64+(x*36),64+(y*36), 28, 28, 0, PI);
    }
  }
}
