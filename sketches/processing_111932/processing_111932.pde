
PImage KingLouie;
PImage AdorableLouie;
PImage LouieLouie;
 
void setup()
{
  size(800, 800);
  frameRate(30);
  KingLouie = requestImage("KingLouie.jpg");
  AdorableLouie = requestImage("AdorableLouie.jpg");
  LouieLouie = requestImage("LouieLouie.jpg");
}
 
void draw()
{
if (KingLouie.width > 0);
image(KingLouie, 0, 0, width, height);
filter(INVERT);

strokeWeight(2);
stroke(0,0,0);
 for (int i = 0; i < 800; i = i+50) {
 line(0, i, 800, i);}
 
strokeWeight(2);
stroke(0,0,0);
for (int i = 0; i < 850; i = i+50) {
line(i, 800, i, 0);}
{
 fill(random(255),random(255),random(255));
rect(random(250),random(250),random(800),random(800));
}
{
 if(AdorableLouie.width > 0);
}
   image(AdorableLouie, 60, 60, 150, 150);
   filter(BLUR);
{
 if(LouieLouie.width > 0);
}
   image(LouieLouie, 350, 500, 150, 150);
  filter(POSTERIZE,3);
  
{
 stroke(random(255),random(255),random(255));
 float ly = 50.0;
 float lx = 50.0;
 while (lx < 220)
    {
      float nextX = lx + 10;
      float nextY = ly + random(-10, 10);
      line(lx, ly, nextX, nextY);
      ly = nextY;
      lx = nextX;
    }
  }
  {
 stroke(random(255),random(255),random(255));
 float ly = 230.0;
 float lx = 50.0;
 while (lx < 220)
    {
      float nextX = lx + 5;
      float nextY = ly + random(-6, 6);
      line(lx, ly, nextX, nextY);
      ly = nextY;
      lx = nextX;
    }
  }
  {
 stroke(random(255),random(255),random(255));
 float ly = 50.0;
 float lx = 25.0;
 while (ly < 250)
    {
      float nextX = lx + random(-10, 10);
      float nextY = ly + 5;
      line(lx, ly, nextX, nextY);
      ly = nextY;
      lx = nextX;
    }
  }
   {
 stroke(random(255),random(255),random(255));
 float ly = 50.0;
 float lx = 200.0;
 while (ly < 300)
    {
      float nextX = lx + random(-10, 10);
      float nextY = ly + 5;
      line(lx, ly, nextX, nextY);
      ly = nextY;
      lx = nextX;
    }
  }
  {
 stroke(random(255),random(255),random(255));
 float ly = 500.0;
 float lx = 300.0;
 while (lx < 500)
    {
      float nextX = lx + 10;
      float nextY = ly + random(-10, 10);
      line(lx, ly, nextX, nextY);
      ly = nextY;
      lx = nextX;
    }
  }
  {
 stroke(random(255),random(255),random(255));
 float ly = 650.0;
 float lx = 300.0;
 while (lx < 500)
    {
      float nextX = lx + 5;
      float nextY = ly + random(-6, 6);
      line(lx, ly, nextX, nextY);
      ly = nextY;
      lx = nextX;
    }
  }
  {
 stroke(random(255),random(255),random(255));
 float ly = 350.0;
 float lx = 500.0;
 while (ly < 250)
    {
      float nextX = lx + random(-10, 10);
      float nextY = ly + 5;
      line(lx, ly, nextX, nextY);
      ly = nextY;
      lx = nextX;
    }
  }
   {
 stroke(random(255),random(255),random(255));
 float ly = 50.0;
 float lx = 200.0;
 while (ly < 300)
    {
      float nextX = lx + random(-10, 10);
      float nextY = ly + 5;
      line(lx, ly, nextX, nextY);
      ly = nextY;
      lx = nextX;
    }
  }
}



