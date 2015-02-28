
void setup() {
  size(700, 700);
  background(0);
  stroke(color(255, 100));
  smooth();
  fill(255);
}

int Dx = 0;
int Dy = height;

void draw() 
{
  for (int i = 0; i < 100; i++)
  {
    switch(int(random(3)))
    {
    case 0:
      Dx = (0+Dx)/2;
      Dy = (height+Dy)/2;
      break;
    case 1:
      Dx = (width+Dx)/2;
      Dy = (height+Dy)/2;
      break;      
    case 2:
      Dx = (width/2+Dx)/2;
      Dy = (0+Dy)/2;
      break;
    }
    point(Dx, Dy);
  }
}




