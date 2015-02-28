

Gota[] gotas = new Gota[60];

void setup()
{
  for (int i=0; i<gotas.length;i++)
  {
                      //pos. x, pos y. color, tamaño, velocidad
    gotas[i]=new Gota(random(800),random(-10,-20),0,random(2,40),int(random(2,6.5)));
  }
  size(800,600);
  background(0);
  smooth();
}

void draw()
{
  fill(0,10);
  rect(0,0,width,height);
    /*  if (int(random(1,10)) == 1)
    {
    gotas[int(random(0,gotas.length))].brilla();
    gotas[int(random(0,gotas.length))].desbrilla();
   */ 
  for (int i=0;i<gotas.length;i++)
  {
    
    gotas[i].ver();
    gotas[i].caer();
    gotas[i].checarSiCayo();
    
  }
}
class Gota
{
  float x;
  float y;
  color c;
  float s;
  float vel;

  //pos. x, pos y. color, tamaño, velocidad
  Gota(float tX, float tY, float tC, float tS, float tVel)
  {
    x=tX;
    y=tY*(random(2, 5));
    c=color(tC);
    s=tS;
    vel=tVel+(random(0.2, 0.8));
  }

  void brilla()
  {
    c=255;
  }
  void desbrilla()
  {
    if (y > height)
    {
    c=0;
    }
  }

  void ver()
  {
    fill(c);
    stroke(255);
    ellipse(x, y, s, s);
  }

  void caer()
  {
    y+=vel;
  }

  void checarSiCayo()
  {
    if (y > height+s)
    {
      y=0;
      x=random(800);
    }
  }
}



