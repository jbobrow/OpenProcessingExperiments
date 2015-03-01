
/* 
Bouncing Balls
what this app will do:
We will have some drums (circles with a wav associated)
on the bottom of the screen
When you hit a circle the corresponding wav play, the circle 
changes its color depending on the power spectrum of the player
associated with it
On the upper part of the screen we have a floor composed of 
little tiles that move up and down as the sum of the 
power spectrum of the drums.
On the floor there are some balls, when the surface moves 
they are spinned up.

*/
Physics physics;
CollisionDetector detector; 


class Drum
{
  int x,y,range; // position and range
  float hue,sat,bri; // base color
  AudioPlayer pl;  // the sound element
  
  public Drum(int x,int y,int range,int ch,int cs, int cb,AudioPlayer p)
  {
    this.x=x;
    this.y=y;
    this.range=range;
    this.hue=ch;
    this.sat=cs;
    this.bri=cb;
    this.pl=p;
    this.pl.setAnalysing(true);
    this.pl.setLooping(false);
 }
  
  public void draw()
  {
    colorMode(HSB,100);
    if (isPlaying())
    {
      float []ps = getSpectrum();
      float rs;
      for (int i=ps.length-1; i>-1; i--)
      {
        noFill();
        stroke(hue, sat, 100-(ps[i]*100));
        rs = map(i,0,ps.length,1,range);
        ellipse(x,y,rs,rs);
      }
    }
    else
    {
        noStroke();
        fill(hue,sat,bri);
        ellipse(x,y,range,range);
    }
    colorMode(RGB);
    
  }
  
  public boolean isPlaying()
  {
    return pl==null?false:pl.isPlaying();
  }
  
  public float[] getSpectrum()
  {
    return pl==null?null:pl.getPowerSpectrum();
  }
  

  void onMouseClick()
  {
    float f=dist(x,y,mouseX,mouseY);
    if (f<range/2)
    {
      //if (pl.isPlaying()) pl.stop();
      pl.cue(0);
      pl.play();
    }
  }
  
}

public class Tile
{
  int x,y,w,h;
  int r,g,b;
  float delta;
  AudioPlayer pl;
  Body body;
  public Tile(int x,int y,int w,int h,int cr,int cg,int cb,AudioPlayer p)
  {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.r=cr;
    this.g=cb;
    this.b=cb;
    this.pl=p;
    physics.setDensity(10000);
    body = physics.createRect(x, y, x+w, y+h);
  }
  public void setDelta(float d)
  {
    delta=d;
  }
  
  void draw()
  {
    noStroke();
    fill(r,g,b);
    body.setPosition(physics.screenToWorld(new Vec2(x, y-delta)));
    rect(x,y-delta,w,h);
  }
}

public class Floor
{
  Tile [] tiles;
  
  public Floor(int y, int n, int r, int g, int b)
  {
    
    tiles = new Tile[n];
    int tileW = (width/n);
    int tileH = 8;
    int xStart = (width-(tileW*n))/2;  
    for (int i=0;i<tiles.length;i++)
    {
      tiles[i]=new Tile(xStart+(tileW*i), y ,tileW-1,tileH
                      ,r,g,b,null);
    }
  }
  
  void moveTiles(float []deltas, float c)
  {
    float j;
    for (int i=0; i<tiles.length;i++)
    {
      j= map(i,0,tiles.length,0,deltas.length);
      tiles[i].setDelta((c+(j/10))*deltas[(int)j]);
    }
  }
  void quietTiles()
  {
    for (int i=0; i<tiles.length;i++)
    {
      tiles[i].setDelta(0);
    }
  }
  
  void draw()
  {
    for (Tile t :tiles) t.draw();
  }
  
}

public class Ball
{
  int r,g,b,d;
  Body body;
  public Ball(int x, int y, int d, int r, int g, int b)
  {
    this.r=r;
    this.g=g;
    this.b=b;
    this.d=d;
    physics.setDensity(0.1);
    body = physics.createCircle(x,y,d/2);
  }
  
  public void draw()
  {
    Vec2 center = body.getWorldCenter();
    Vec2 pos = physics.worldToScreen(center);
    colorMode(RGB,255);
    fill(r,g,b);
    ellipse(pos.x, pos.y, d,d);
    
  }
}


Maxim maxim;
Drum []drums;
Ball []balls;
Floor floor;

void setup()
{
  size(480,640);
  physics = new Physics(this, width, 500, 0, -10, width*2, 500*2, width, 500, 100);
  physics.setCustomRenderingMethod(this, "myCustomRenderer");
  physics.setDensity(10.0);
  detector = new CollisionDetector (physics, this);


  background(0);
  maxim = new Maxim(this);
  drums=new Drum[3];
  drums[0] = new Drum(60,600,70,20,20,0xff,maxim.loadFile("drum.wav"));
  drums[1] = new Drum(230,600,70,50,50,0xf0,maxim.loadFile("snare1.wav"));
  drums[2] = new Drum(420,600,70,80,80,0xc0,maxim.loadFile("tap.wav"));
  floor = new Floor(500,25,(int)random(255),(int)random(255),(int)random(255));
  balls = new Ball[5];
  for (int i=0; i<balls.length; i++) 
    balls[i]=new Ball(80+(80*i),475,50,(int)random(255),(int)random(255),(int)random(255));
    

}

void draw()
{
  background(0);
  float []s=null;
  for (Drum d:drums)
  { 
    d.draw();
    if (d.isPlaying())
    {
      if (s==null) s=d.getSpectrum();
      else
      {
        float []s1=d.getSpectrum();
        for (int i=0; i<s.length;i++) s[i]+=s1[i];
      }
    }
  }
  if (null==s) floor.quietTiles();
  else floor.moveTiles(s,150);
  
  floor.draw();
  
  for (Ball b:balls) b.draw();
  
}

void mousePressed()
{
  for (Drum d:drums) d.onMouseClick();
}

void collision(Body b1, Body b2, float impulse)
{
  
}

void myCustomRenderer(World world)
{
  
}

