







//PRESS PLAY!


star[] q;
moon k;
void setup()
{
  size(600,600);
  smooth();
  noStroke();
    k = new moon();
    k.x = 200;
    k.y = 200;
    k.l = 100;
    k.m = 100;
  
  q = new star[1000];
  for(int i=0; i<1000; i++)
  {
    q[i] = new star();
    q[i].x = random(-width,width);
    q[i].y = random(-height,height);
    q[i].d = (int)random(1,5);
    q[i].v = (int)random(1,5);
  }
}

void draw()
{
  background(0,0,0);
  k.move();
  k.show();
  
  for(int i=0; i<q.length; i++)
  {
    q[i].move();
    q[i].show();
  }
}

class star
{
  float x, y;
  int d, v, i;

  void show()
  {
    ellipse(x,y, d,d);
    
}

  void move()
  {
    x += ( mouseX - width/3  ) * 0.001 * v;
    y += ( mouseY - height/2 ) * 0.001 * v;
  }
}


class moon
{
  float x,y;
  int l,m;

  void show()
  { 
    fill (#DED7D7);
    ellipse ( x, y, l, l);
  }
  
  void move()
  { 
    x += ( mouseX - width/2  ) * 0.00003 * m;
    y += ( mouseY - height/2 ) * 0.00003* m;
  }
}

