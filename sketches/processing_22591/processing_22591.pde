
int _width = 200;
int _height = 200;
//OrbQueu(int startx, int starty, int incx, int incy, int clusterq, int speed, int radius, int fade, int r, int g, int b)
int clusterq = 20;
int speed = 10;
int radius = 10;
int fade = 6;
int refresher = 200;
int counter = refresher;
OrbParty ORBPARTY;

void setup()
{
  background(0);
  smooth();
  size(_width,_height);
}

void draw()
{
  if(counter == refresher)
  {
    ORBPARTY = new OrbParty(round(random(5,25)), clusterq, speed, radius, fade, _width, _height);
    counter = 0;
  }
  ORBPARTY.draw();
  counter++;
}

class OrbParty
{
  int clst;
  OrbQueu[] ORBS;
  
  OrbParty(int clst, int clusterq, int speed, int radius, int fade, int lwidth, int lheight)
  {
    int startx,starty,incx,incy,r,g,b;
    this.clst = clst;
    this.ORBS = new OrbQueu[clst];

    for(int i = 0; i < clst; i++)
    {
      startx = round(random(0,lwidth));
      starty = round(random(0,lheight));
      incx = round(random(-10,10));
      incy = round(random(-10,10));
      r = round(random(0,255));
      g = round(random(0,255));
      b = round(random(0,255));
      
     this.ORBS[i] = new OrbQueu(startx,starty,incx,incy,clusterq,speed,radius,fade,r,g,b);
    }
  }
  
  void draw()
  {
    background(0);
    for(int i = 0; i < this.clst; i++)
      this.ORBS[i].draw();
  }
}

class OrbQueu
{
  int clusterq = 20;
  FadingOrb[][] clusters = new FadingOrb[clusterq][];
  int incx = 30;
  int incy = -10;
  int startx = 10;
  int starty = 450;
  int speed = 5;
  int radius = 20;
  int fade = 6;
  int r,g,b;

  int maxorb = 1;
  int delayer = 1;

  OrbQueu(int startx, int starty, int incx, int incy, int clusterq, int speed, int radius, int fade, int r, int g, int b)
  {
    this.startx = startx;
    this.starty = starty;
    this.incx = incx;
    this.incy = incy;
    this.clusterq = clusterq;
    this.speed = speed;
    this.radius = radius;
    this.fade = fade;
    this.r = r;
    this.g = g;
    this.b = b;

    this.clusters = new FadingOrb[this.clusterq][];
    int clusterorbs;

    for(int i = 0; i < this.clusterq; i++)
    {
      clusterorbs = round(random(5,20));
      this.clusters[i] = new FadingOrb[clusterorbs];
      for(int j = 0; j < clusterorbs;j++)
        this.clusters[i][j] = new FadingOrb(this.startx + round(random(-this.radius,this.radius)),this.starty + round(random(-this.radius,this.radius)),this.radius*2,this.r,this.g,this.b,this.fade);
      this.startx += this. incx;
      this.starty += this.incy;
    }
  }

  void draw()
  {
    this.delayer++;
    for(int i = 0; i < this.maxorb; i++)
    {
      for(int j = 0; j < this.clusters[i].length ;j++)
      {
        this.clusters[i][j].draw();
        this.clusters[i][j].fade();
      }
      if(this.delayer == this.speed)
      {
        this.delayer = 0;
        if(this.maxorb < this.clusterq)
          this.maxorb++;
      }
    }
  }

}

class FadingOrb
{
  int x,y,diam,r,g,b,fader;
  boolean gone;
  
  FadingOrb(int x, int y, int diam, int r, int g, int b, int fader)
  {
    int mn;
    this.x = x;
    this.y = y;
    this.diam = diam;
    this.r = r;
    this.g = g;
    this.b = b;
    this.fader = fader;
    this.gone = false;
  }
  
  void draw()
  {
    if((this.r > 0) || (this.g > 0) || (this.b > 0))
 //     this.gone = true;
 //   if(!this.gone)
    {
      noStroke();
      fill(0,0,0);
      ellipse(this.x,this.y,this.diam,this.diam);
      fill(this.r,this.g,this.b);
      ellipse(this.x,this.y,this.diam,this.diam);
    }
  }
  
  void fade()
  {
    if(this.r > 0)
      this.r -= this.fader;
    else
      this.r = 0;
    if(this.g > 0)
      this.g -= this.fader;
    else
      this.g = 0;
    if(this.b > 0)
      this.b -= this.fader;
    else
      this.b = 0;
  }
}


