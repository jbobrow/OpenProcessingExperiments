
paddle pete;
ball phillip;
ball a;
ball b;
ball c;
ball az;
ball bz;
ball cz;
ball an;
ball bn;
ball cn;
ball azn;
ball bzn;
ball czn;
ball ar;
ball br;
ball cr;
ball azr;
ball bzr;
ball czr;
ball ae;
ball be;
ball ce;

ball aze;
ball bze;
ball cze;
ball ane;
ball bne;
ball cne;
ball azne;
ball bzne;
ball czne;
ball are;
ball bre;
ball cre;
ball azre;
ball bzre;
ball czre;
void setup()
{
  size(400, 400);
  background(225);
  pete = new paddle();
  phillip = new ball();
  a = new ball();
  b = new ball();
  c = new ball();
  az = new ball();
  bz = new ball();
  cz = new ball();
  an = new ball();
  bn = new ball();
  cn = new ball();
  azn = new ball();
  bzn = new ball();
  czn = new ball();
  ar = new ball();
  br = new ball();
  cr = new ball();
  azr = new ball();
  bzr = new ball();
  czr = new ball();
  ae = new ball();
  be = new ball();
  ce = new ball();
  aze = new ball();
  bze = new ball();
  cze = new ball();
  ane = new ball();
  bne = new ball();
  cne = new ball();
  azne = new ball();
  bzne = new ball();
  czne = new ball();
  are = new ball();
  bre = new ball();
  cre = new ball();
  azre = new ball();
  bzre = new ball();
  czre = new ball();
}
void draw()
{
  background(0, 225, 0);
  //background(random(0,226),random(0,226),random(0,226));
  pete.display();
  if (keyPressed == true && key== 'a')
  {
    pete.moveleft();
  }
  if (keyPressed == true && key== 'd')
  {
    pete.moveright();
  }
  if (keyPressed == true && key== 's')
  {
    pete.movedown();
  }
  if (keyPressed == true && key== 'w')
  {
    pete.moveup();
  }
  phillip.move();
  phillip.display();
  phillip.bounce();
  a.move();
  a.display();
  a.bounce();
  b.move();
  b.display();
  b.bounce();
  c.move();
  c.display();
  c.bounce();
  az.move();
  az.display();
  az.bounce();
  bz.move();
  bz.display();
  bz.bounce();
  cz.move();
  cz.display();
  cz.bounce();
  an.move();
  an.display();
  an.bounce();
  bn.move();
  bn.display();
  bn.bounce();
  cn.move();
  cn.display();
  cn.bounce();
  azn.move();
  azn.display();
  azn.bounce();
  bzn.move();
  bzn.display();
  bzn.bounce();
  czn.move();
  czn.display();
  czn.bounce();
  ar.move();
  ar.display();
  ar.bounce();
  br.move();
  br.display();
  br.bounce();
  cr.move();
  cr.display();
  cr.bounce();
  azr.move();
  azr.display();
  azr.bounce();
  bzr.move();
  bzr.display();
  bzr.bounce();
  czr.move();
  czr.display();
  czr.bounce();
  ae.move();
  ae.display();
  ae.bounce();
  be.move();
  be.display();
  be.bounce();
  ce.move();
  ce.display();
  ce.bounce();
  aze.move();
  aze.display();
  aze.bounce();
  bze.move();
  bze.display();
  bze.bounce();
  cze.move();
  cze.display();
  cze.bounce();
  ane.move();
  ane.display();
  ane.bounce();
  bne.move();
  bne.display();
  bne.bounce();
  cne.move();
  cne.display();
  cne.bounce();
  azne.move();
  azne.display();
  azne.bounce();
  bzne.move();
  bzne.display();
  bzne.bounce();
  czne.move();
  czne.display();
  czne.bounce();
  are.move();
  are.display();
  are.bounce();
  bre.move();
  bre.display();
  bre.bounce();
  cre.move();
  cre.display();
  cre.bounce();
  azre.move();
  azre.display();
  azre.bounce();
  bzre.move();
  bzre.display();
  bzr.bounce();
  czre.move();
  czre.display();
  czre.bounce();
}
class ball
{
  float mx = random(-5, 4);
  float my = random(-5, 4);
  float x, y;
  ball()
  {
    x = random(15, 386);
    y = random(15, 386);
  }
  void move()
  {
    x = x + mx;
    y = y + my;
    if (x<0)
    {
      x=x+400;
    }
    if (x>400)
    {
      x=x-400;
    }
    if (y<0)
    {
      y=y+400;
    }
    if (y>400)
    {
      y=y-400;
    }
  }
  void display()
  {
    noStroke();
    //fill(225, 225, 225);
    fill(random(0, 225), random(0, 225), random(0, 225));
    ellipse(x, y, 10, 10);
  }
  void bounce()
  {
    //    if (dist(x, y, 0.0, y) <= 10.0 || dist(x, y, 400.0, y) <= 10.0)
    //    {
    //      //mx = 0;
    //      //mx = -mx;
    //      if(mx>0)
    //      {
    //        x=x-400;
    //        println("x is now " + x);
    //      }
    //      if(mx<0)
    //      {
    //        x=x+400;
    //      }
    //    }
    //    else if (dist(x, y, x, 0.0) <= 10.0 || dist(x, y, x, 400.0) <= 10.0)
    //    {
    //      //my = 0;
    //      my = -my;
    //      if(my>0)
    //      {
    //        y=y-400;
    //      }
    //      `                                                                        if(my<0)
    //      {
    //        y=y+400;
    //      }
    //    }
    if ( get(int(x), int(y)+10)==color(0, 0, 0) && my >=0)
    {
      my=-my;
    }
    else if ( get(int(x), int(y)-10)==color(0, 0, 0) && my <=0)
    {
      my=-my;
    }
    else if ( get(int(x)+10, int(y))==color(0, 0, 0) && mx >=0)
    {
      mx=-mx;
    }
    else if ( get(int(x)-10, int(y))==color(0, 0, 0) && mx <=0)
    {
      mx=-mx;
    }
  }
}
class paddle
{
  int sld;
  int m;
  int x;
  int y;
  paddle()
  {
    x = 230;
    y = 128;
  }
  void moveleft()
  {
    x=x-4;
  }
  void moveright()
  {
    x=x+4;
  } 
  void movedown()
  {
    y=y+4;
  }
  void moveup()
  {
    y=y-4;
  }
  void display()

  {
    fill(0);
    rect(x-50, y-20, 50, 10);
  }
}
