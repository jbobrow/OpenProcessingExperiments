

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
float ancho=0,x=0,l=0;

void setup()
{
  size(500,500);
  smooth();
  stroke(255,0,0);
  frameRate(30);
  minim= new Minim(this);
  in=minim.getLineIn(Minim.MONO,512);
}

void draw()
{
  background(#EA3B53);
  float m=0;
  for(int i=0;i<in.bufferSize()-1;++i)
  {
    if(abs(in.mix.get(i))>m)
    {
      m=abs(in.mix.get(i));
    }
    
  }
  ancho=(float)(m*500)+5;
  strokeWeight(l);
  println(ancho*0.09);
  if(ancho*0.09>4.0)
    l+=ancho*0.09;
  globo(l);
 
}

void globo(float a)
{
  strokeWeight(1);
  if(a<300)
  {
    fill(#FFDA08);
    float d,e,f;
    stroke(0);
    ellipse(250,250,20+a,100+a);
    hilo(a/2);
  }
   else
     ghost(0,10);
  
}

void hilo(float a)
{
  noFill();
  stroke(#08FF22);
  bezier(250, 400+a, 200, 375+a, 400, 325+a, 250, 300+a);
}

void ghost(int x,int y)
{
  PImage ghost;
  ghost=loadImage("globo.png");
  image(ghost,x,y);
}

