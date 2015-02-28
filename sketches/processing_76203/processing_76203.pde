
//Torres Torres Felipe Andrés 
//Hernandez Cruz Yanahi
 
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
Minim minim;
 
AudioInput in;
 
int ancho=0;
 
 
void setup()
{
  size(500,500);
  smooth();
  stroke(255,0,0);
  frameRate(25);
  minim=new Minim(this);
  in=minim.getLineIn(Minim.MONO,512);
}
 
void draw()
{
  background(255);
  float m=0;
  for(int i=0; i<in.bufferSize()-1;i++)
  {
    if(abs(in.mix.get(i))>m)
    {
    m=abs(in.mix.get(i));
  }
}
 
if(ancho <= 200)
{
ancho = int(m*500)+5;
strokeWeight(ancho);
ellipse(250,200,ancho-20,ancho+20);
println(ancho);
}
 
if(ancho>=250)
{
strokeWeight(0);
fill(255,0,0);
ellipse(250,200,0,0);
println(ancho);
}
 
}
