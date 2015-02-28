
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
void confeti()
{
  int i=0;
  float x,y;
  x=random(0,500);
  y=random(0,500);
  fill(random(255),random(255),random(255));
  ellipse(x,y,50,50);
  x=random(0,500);
  y=random(0,500);
  fill(random(255),random(255),random(255));
  ellipse(y,x,50,50);
  y=random(0,500);
  fill(random(255),random(255),random(255));
  ellipse(y+50,y,50,50);
  x=random(0,500);
  fill(random(255),random(255),random(255));
  ellipse(x+50,x,50,50);
}
Minim audio;
AudioInput en;
float aa;
float b=5;
void setup()
{
  size(500,500);
  frameRate(25);
  smooth();
  audio=new Minim(this);
  en=audio.getLineIn(Minim.MONO,512);
}
void draw()
{
  background(255);
  float m=0;
  for(int i=0; i<en.bufferSize()-1;i++)
  {
    if(abs(en.mix.get(i))>m)
    {
      m=abs(en.mix.get(i));
    }
  }
  aa=int(m*10)+5;
  if(aa>5)
  {
    b=b+aa;
  }
  if(b<400)
  {
    fill(200,200,250);
    stroke(200,200,250);
    ellipse(255,255,b,b+40);
  }
 else
 {
   background(255);
   confeti();
 }
  
}
