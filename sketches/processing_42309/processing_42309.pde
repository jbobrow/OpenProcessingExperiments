
/*
Calvin Truong
Emergent Behavior
3rd Period

Snow falling on the ground!
*/


stars a, b, c, d;
float s, h;

void setup()
{
  size (640, 480);
  background(0);
  smooth();
  noStroke();

  a = new stars(700);
  a.show();

  b = new stars(500);
  b.show();

  c = new stars(300);
  c.show();

  d = new stars(100);
  d.show();

// The snow stacking up on the floor!  
  s = 80;
  h = 400;
}



void draw()
{
  background(0);

  fill(255);

  a.stars(2, 1);

  b.stars(4, 2);

  c.stars(6, 5);

  d.stars(8, 10);
  
  rect (0, h, 640, s);
  
  s = s + 1;
  h = h - 0.1;
  
}


class stars
{
  int starAmount = 1000; 
  Star[] star = new Star[starAmount];

  stars(int a)
  {
    starAmount = a;
  }

  void show()
  {

    for (int i=0; i<starAmount; i++)
    {
      star[i]= new Star(random(0, width), random(0, height));
    }
  }


  void stars(int b, float c)
  {
    for (int d=0; d<starAmount; d++)
    {
      star[d].move(b, c);
    }
  }


  class Star
  {

    float x, y, z, p, p2;


    Star(float r, float t  )

    {
      p = r; 
      y = t;
    }


    void move(int j, float k)
    {
      float p2 = p + x;
      y +=x;
      
      ellipse(p2, y, j, j); 

      
      
      if (y < 0)
      {
        y = y + height;
      }

      if (y > height)
      {
        y = y - height;
      }
      
     
      y = y + k;
    }
  }
} 


