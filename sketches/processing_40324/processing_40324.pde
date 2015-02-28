
// Eric Wong
//press z to make the circles bigger.
//press x to make the circles smaller.
//press c to clear the screen.
circle a;
int s;
void setup()
{
  size(600, 500);
  background(255, 255, 0);
  s = 30;
  smooth();
  noStroke();
  
  a = new circle();
  //a.x = width/2;
  a.x = 0;
  a.y = 0;
}

void draw()
{
  a.b= color(random(255, 255), random(128, 223), random(223), 150);
  a.show();
}

class circle
{
  float x, y;
  color b;

  void show()
  {
    for (int y=0; y<1; y++)
    {
      for (int x=0; x<1; x++)
      
      {
        fill(b);
        ellipse (x+random(600), y+random(500), s, s);
      }

    }
  }
}
  void keyPressed()
  {
    if(key == 'z' || key == 'z')
    {
     s++; 
    }
    
    if(key == 'x' || key == 'x')
    {
     s--; 
     if(s == 1)
     {
       s = 2;
     }
    }
    
    if(key == 'c' || key == 'c')
    {
     background(255, 255, 0);
    }
  }

