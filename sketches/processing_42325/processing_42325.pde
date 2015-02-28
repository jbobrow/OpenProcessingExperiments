
//Emergent behavior occurs when simple individual behaviors combine
//to make a group appear to act in complex ways.

//All the black squares(EDMOND GUAN VIRUSES) are all growing 
//big to kill all the bloodcells(red squares)thus spreading 
//the disease causing a person to be stupid and alergic to 
//everything.


Grow[] gr;
boolean d;

void setup()
{
  size(800, 500);
  stroke(10);
  smooth();
 

  gr = new Grow[700];
  for (int i=0; i<700; i++)
  {
    gr[i] = new Grow();
    gr[i].x = random(-width, width*2);
    gr[i].y = random(-height, height*2);
    gr[i].d = (int)random(1, 10);
    gr[i].v = (int)random(1, 30);
    gr[i].r = 0;
    gr[i].g = 0;
    gr[i].b = 0;

    if (i%5 == 0)
    {
      gr[i].r = 255;
      gr[i].g = 0;
      gr[i].b = 0;
      
    }
  }
}

void draw()
{
  background(0, 0, 255);
  for (int i=0; i<gr.length; i++)
  {
    gr[i].move();
    gr[i].show();
  }
}

class Grow
{
  float x, y;
  int d, v, k;
  float r, g, b;
  float p, u, o;

  void show()
  {
    fill(r, g, b);
    stroke(p, u, o, d--);
    rect(x, y, d, d);
  }

  void move()
  {
    x += ( mouseX - width/2  ) * 0.001* v;
    y += ( mouseY - height/2 ) * 0.001 * v;

    if (x < -5)
    {
      x = 900;
    }

    if (x > 905)
    {
      x = 0;
    }

    if (y < -5)
    {
      y = 900;
    }

    if (y > 905)
    {
      y = 00;
    }
  }
}


