
/* 
   Click for more Thangs ohyeahhh
   by mei deng
*/


Thang[] t, h;


void setup()
{
  size(500, 500);
  smooth();
  stroke(#EDDDA0);
  strokeWeight(random(0, 10));
  fill(255, 230);



  t = new Thang[100];
  for (int i=0; i<100; i++)
  {
    {
      t[i] = new Thang();
      t[i].x = random(-width, width*2);
      t[i].y = random(-height, height*2);
      t[i].d = (int)random(0, 100);
      t[i].v = (int)random(1, 3);
      t[i].r = 183;
      t[i].g = 131;
      t[i].b = 135;
    }
  }
}



void draw()
{
  background(#B295AE);
  for (int i=0; i<t.length; i++)
  {
    t[i].move();
    t[i].show();
  }
}

 
void mousePressed()
{

  for(int i=0; i<30; i++)
  {
  t[i].x = mouseX + random(-width,width);
  t[i].y = mouseY + random(-height,height);
  }
}
   



class Thang
{
  float x, y;
  int d, v;
  float r, g, b;

  void show()
  {
    fill(r, g, b);
    rect(x, y, d, d);
    ellipse(x, y, d, d);
  }

  void move()
  {
    x += ( mouseX - width/2  ) * 0.14 * v;
    y += ( mouseY - height/2 ) * 0.01 * v;
  }
}



