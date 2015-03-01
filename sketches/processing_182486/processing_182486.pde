

PImage map;
PImage player;
PImage gameover;
//The saturn particle ArrayLists helped me with these
ArrayList snowstorm = new ArrayList();
ArrayList skiers = new ArrayList();
ArrayList skiers2 = new ArrayList();
ArrayList snowplows = new ArrayList();
ArrayList snowplows2 = new ArrayList();
ArrayList zambonis = new ArrayList();
ArrayList zambonis2 = new ArrayList();
//End
Snow s; 
Player p;
Skier sk;
Skier2 sk2;
Snowplow sp;
Snowplow sp2;
Zamboni z;
Zamboni2 z2;
void setup()
{
  //frameRate(5);
  size(1200,720);
  background(255);
  map = loadImage("map.png");
  p = new Player(600,670);

  for(int i=0; i<5000; i++)
  {
    snowstorm.add(new Snow(int(random(1200)),random(720),5,1));
  }
  for(int i=0; i<5; i++)
  {
    skiers.add(new Skier(int(random(1200)),270,5));
    skiers.add(new Skier(int(random(1200)),170,5));
    skiers2.add(new Skier2(int(random(1200)),620,-5));
    skiers2.add(new Skier2(int(random(1200)),220,-5));
    skiers2.add(new Skier2(int(random(1200)),320,-5));
    snowplows.add(new Snowplow(int(random(1200)),520,5));
    snowplows2.add(new Snowplow2(int(random(1200)),470,-5));
    snowplows2.add(new Snowplow2(int(random(1200)),420,-5));
    snowplows.add(new Snowplow(int(random(1200)),570,5));
    zambonis.add(new Zamboni(int(random(1200)),120,-5));
    zambonis2.add(new Zamboni2(int(random(1200)),70,5));    
  }  
}

void draw()
{
  image(map,0,0);
  
  for (int i = 0; i < snowstorm.size(); i++)
  {
    Snow s = (Snow) snowstorm.get(i);
    s.drawSnow();
    if(p.calculateYpos(20) == 0)
    {
      p.winConditions();
      break;
    }
  }
  for (int i = 0; i < skiers.size(); i++)
  {
    Skier sk = (Skier) skiers.get(i);
    sk.update();
    if(p.calculateYpos(20) == 0)
    {
      p.winConditions();
      break;
    }
  }
  for (int i = 0; i < skiers2.size(); i++)
  {
    Skier2 sk2 = (Skier2) skiers2.get(i);
    sk2.update();
    if(p.calculateYpos(20) == 0)
    {
      p.winConditions();
      break;
    }
  }
  for (int i = 0; i < snowplows.size(); i++)
  {
    Snowplow sp = (Snowplow) snowplows.get(i);
    sp.update();
    if(p.calculateYpos(20) == 0)
    {
      p.winConditions();
      break;
    }
  }
  for (int i = 0; i < snowplows2.size(); i++)
  {
    Snowplow2 sp2 = (Snowplow2) snowplows2.get(i);
    sp2.update();
    if(p.calculateYpos(20) == 0)
    {
      p.winConditions();
      break;
    }
  }
  for(int i = 0; i < zambonis.size(); i++)
  {
    Zamboni z = (Zamboni) zambonis.get(i);
    z.update();
    if(p.calculateYpos(20) == 0)
    {
      p.winConditions();
      break;
    }
  }
  for (int i = 0; i < zambonis2.size(); i++)
  {
    Zamboni2 z2 = (Zamboni2) zambonis2.get(i);
    z2.update();
    if(p.calculateYpos(20) == 0)
    {
      p.winConditions();
      break;
    }
  }
  p.drawPlayer();
  p.winConditions();
}
void keyPressed()
{
  //Borrowed parts of code from colorful rectangles
  if(keyPressed)
  {
    if (keyCode == LEFT)
    {
      p.xmove(-27);
    }
    if (keyCode == RIGHT)
    {
      p.xmove(27);
    }
    if (keyCode == UP)
    {
      p.ymove(-50);
    }
    if (keyCode == DOWN)
    {
      p.ymove(50);
    }
  }
  //End
}
class Player
{
  float xpos;
  float ypos;
  PImage player;
  PImage gameover;
  
  
  Player(int x, int y)
  {
      xpos = x;
      ypos = y;
      player = loadImage("snowman.png");
  }
  
  void xmove(int x)
  {
    xpos += x;
    if (xpos <= 0)
    {
      xpos = 1173;
    }
    if (xpos + 27 > 1200)
    {
      xpos = 0;
    }
    image(player,xpos,ypos);
  }
  void ymove(int y)
  {
    ypos += y;
    if (ypos + 50 > 720)
    {
      ypos = 670;
    }
    if (ypos <= 20)
    {
      ypos = 20;
    }
    image(player,xpos,ypos);
  }
  void drawPlayer()
  {
    image(player,xpos,ypos);
  }
  void hit()
  {
    xpos = 600;
    ypos = 670;
  }
  //Borrowed from colorful rectangles 
  float calculateDistance(float x,float y)
  {
    return dist(xpos+13.5,ypos,x,y);
  }
  //End
  float calculateYpos(float y)
  {
    return ypos-y;
  }
  
  void winConditions()
  {
    if (ypos <= 20)
    {
      background(0);
      gameover = loadImage("Game_Over.png");
      image(gameover,0,0);
    }
  }
}

class Snow
{
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  float size;
  
  Snow(float x, float y, float xv, float yv)
  {
    xpos = x;
    ypos = y;
    xvel = xv;
    yvel = yv;
    size = 3;
  }
  
  void drawSnow()
  {
    xpos += xvel;
    ypos += yvel;
    
    if (xpos <= 0)
    {
      xpos = 1200;
    }
    if (xpos >= 1200)
    {
      xpos = 0;
    }
    if (ypos <= 0)
    {
      ypos = 720;
    }
    if (ypos >= 720)
    {
      ypos = 0;
    }
    
    fill(230,230,230);
    noStroke();
    ellipse(xpos,ypos,size,size);
  }
}
class Skier
{
  int xpos;
  int ypos;
  int xvel;
  PImage skier;
  
  Skier(int x, int y, int xv)
  {   
    xpos = x;
    ypos = y;
    xvel = xv;
    skier = loadImage("Skier.png");
  }
  void update()
  {
    if (xpos < 0)
    {
      xpos = 1200;
    }
    if (xpos > 1200)
    {
      xpos = 0;
    }
    if (p.calculateYpos(ypos) == 0)
    {
      if (p.calculateDistance(xpos+27.5,ypos) < 27.5)
      {
        p.hit();
      }
    }
    xpos += xvel;
    image(skier,xpos,ypos);
  }
}
class Skier2
{
  int xpos;
  int ypos;
  int xvel;
  PImage skier2;
  
  Skier2(int x, int y, int xv)
  {   
    xpos = x;
    ypos = y;
    xvel = xv;
    skier2 = loadImage("Skier2.png");
  }
  void update()
  {
    if (xpos < 0)
    {
      xpos = 1200;
    }
    if (xpos > 1200)
    {
      xpos = 0;
    }
    if (p.calculateYpos(ypos) == 0)
    {
      if (p.calculateDistance(xpos+27.5,ypos) < 27.5)
      {
        p.hit();
      }
    }
    xpos += xvel;
    image(skier2,xpos,ypos);
  }
}
class Snowplow
{
  int xpos;
  int ypos;
  int xvel;
  PImage snowplow;
  
  Snowplow(int x, int y, int xv)
  {
    xpos = x;
    ypos = y;
    xvel = xv;
    snowplow = loadImage("Snowplow.jpg");
  }
  void update()
  {
    if (xpos < 0)
    {
      xpos = 1200;
    }
    if (xpos > 1200)
    {
      xpos = 0;
    }
    if (p.calculateYpos(ypos) == 0)
    {
      if (p.calculateDistance(xpos+42.5,ypos) < 42.5)
      {
        p.hit();
      }
    }
    xpos += xvel;
    image(snowplow,xpos,ypos);
  }
}
class Snowplow2
{
  int xpos;
  int ypos;
  int xvel;
  PImage snowplow2;
  
  Snowplow2(int x, int y, int xv)
  {
    xpos = x;
    ypos = y;
    xvel = xv;
    snowplow2 = loadImage("Snowplow2.jpg");
  }
  void update()
  {
    if (xpos < 0)
    {
      xpos = 1200;
    }
    if (xpos > 1200)
    {
      xpos = 0;
    } 
    if (p.calculateYpos(ypos) == 0)
    {
      if (p.calculateDistance(xpos+42.5,ypos) < 42.5)
      {
        p.hit();
      }
    }
    xpos += xvel;
    image(snowplow2,xpos,ypos);
  }
}
class Zamboni
{ 
  int xpos;
  int ypos;
  int xvel;
  PImage zamboni;
  
  Zamboni(int x, int y, int xv)
  {
    xpos = x;
    ypos = y;
    xvel = xv;
    zamboni = loadImage("Zamboni.jpg");    
  }
  void update()
  {
    if (xpos < 0)
    {
      xpos = 1200;
    }
    if (xpos > 1200)
    {
      xpos = 0;
    }
    if (p.calculateYpos(ypos) == 0)
    {
      if (p.calculateDistance(xpos+32,ypos) < 32)
      {
        p.hit();
      }
    }
    xpos += xvel;
    image(zamboni,xpos,ypos);
  }
}
class Zamboni2
{ 
  int xpos;
  int ypos;
  int xvel;
  PImage zamboni2;
  
  Zamboni2(int x, int y, int xv)
  {
    xpos = x;
    ypos = y;
    xvel = xv;
    zamboni2 = loadImage("Zamboni2.jpg");    
  }
  void update()
  {
    if (xpos < 0)
    {
      xpos = 1200;
    }
    if (xpos > 1200)
    {
      xpos = 0;
    }
    if (p.calculateYpos(ypos) == 0)
    {
      if (p.calculateDistance(xpos+32,ypos) < 32)
      {
        p.hit();
      }
    }
    xpos += xvel;
    image(zamboni2,xpos,ypos);
  }
}



