
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
import codeanticode.gsvideo.*;


Minim minim;
AudioInput input;
AudioPlayer player;

int i=0;
boolean check=false;
int timer=0;

GSMovie myMovie;

int t=10;

PGraphics pg;

void setup() {
  size(640, 480, P2D);
  pg=createGraphics(640,480);
 

  smooth();
  noStroke();
  
  myMovie = new GSMovie(this, "winter.mov");
  myMovie.loop();

   minim=new Minim(this);
   input=minim.getLineIn();
   
   
   pg.beginDraw();
 
 pg.background(0,0,0,0);
pg.endDraw();

  frameRate(30);
}

 

void draw() {
timer++;
if(timer%900==0)
{
    pg.beginDraw();
 
 pg.background(0,0,0,0);
pg.endDraw();
}
  image(myMovie, 0, 0);


float v=abs(input.mix.get(0));
if(v>0.07){
check=true;
}
else
check=false;

 pg.beginDraw();

if(check==true)
{
  
 Breath(); 
}
  
 pg.loadPixels();
  for(int i=0;i<pg.width; i++)
  {
    for(int j=0;j<pg.height; j++)
    {
      int index=j+pg.width+i;
      
      if(i==mouseX && j==mouseY)
    {
      pixelEllipse(pg,i,j,pg.width,pg.height);
    }
    }
  }
  pg.updatePixels();
  
  pg.endDraw();
  image(pg,0,0);
 

println(v);
println(timer);
}

void movieEvent(GSMovie m) {
  m.read();
}

 

 


void Breath()
{
 
 pg.noStroke();
   if(t<=800) {t+=10;}
  for (int i=1; i<10; i++)
  {
  
    pg.ellipse(320, 240, t-(i*10), t-(i*10) );
    pg.fill(255, 255, 255, 1);
  }
  
 
}

void pixelEllipse(PGraphics pg,int x,int y,int w,int h)
{
  int R=30;
  for(int i=-R;i<=R;i++)
  {
    float delta=sqrt((float)(R*R-i*i));
    int j1=-1*(int)delta;
    int j2=(int)delta;
    
    for(int j=j1; j<=j2; j++)
    {
      int tx=i+x;
      int ty=j+y;
      if(tx>=0&& ty>=0 && tx<w&& ty<h)
      {
        int index=(ty)*w+(tx);
        pg.pixels[index]=0;//color(255,255,255,R-abs(i));
      }
    }
  }
}


