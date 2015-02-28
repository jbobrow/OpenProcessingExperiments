
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim;  
AudioPlayer ladrido;  
AudioPlayer maullido;

int x=0,y=0;

void setup()
{
  size(800,400);
  minim=new Minim(this);  
  ladrido=minim.loadFile("ladrido.wav",2048);  
  maullido=minim.loadFile("maullido.wav",2048);
  smooth();
  frameRate(20);
}

void draw()
{
  background(#F5EB1E);
  fill(255,0,0);
  if(y==0)
  {
    ellipse(x,200,50,50);
    x+=3;
    if(x>width-25)
    {
      y=1;
      ladrido.play(); 
    }
  }
  else
  {
    ellipse(x,200,50,50);
    x-=3;
    if(x<25)
    {
      y=0;
      maullido.play(); 
    }
  }
  
}

