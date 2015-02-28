
float y = 0;
float v = 0;
float a = 0.0136333;
float x = 0;
float orkan =3.333;
void setup()
{
  size(1200,600);
  frameRate(60);
  }
  
  void draw()
  {
    background(255);
    point(x,y);
    x=x+orkan;
    y=y+v;
    v=v+a;
  }
    
