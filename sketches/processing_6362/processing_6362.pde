
//Made By Prince Jacob



Glass[] A1;

void setup()
{
  size(700,700);
  smooth();
  stroke(215,182,36);
  

A1= new Glass[1000];
  for(int i=0; i<1000; i++)
  {
    A1[i] = new Glass();
    A1[i].x = random(-width,width*2);
    A1[i].y = random(-height,height*2);
    A1[i].d = (int)random(10,90);
    A1[i].v = (int)random(1,10);
  }
}

void draw()
{
  background(0,0,0);
  for(int i=0; i<A1.length; i++)
  {
    A1[i].move();
    A1[i].show();
  }
}

class Glass
{
  float x, y;
  int d, v;

  void show()
  {
    fill(int(random(255)),int(random(255)),random(223), 30);
    ellipse(x,y, d,d);
  }

  void move()
  {   
    x += ( mouseX - width/2  ) * 0.01 * v;
    y += ( mouseY - height/2 ) * 0.01 * v;
    d += ( mouseX - width/2  ) * 0.01 * v;
    d -= ( mouseY - height/2 ) * 0.01 * v;
  }
}


