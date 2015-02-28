
//importar librerias
//2.- declarar el objeto audio
//minim audio;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim miaudio;

AudioInput in;

float ancho=0;

void setup()
{
size(500,500);
smooth();
stroke(200,100,200);
frameRate(25);
miaudio=new Minim(this);
in=miaudio.getLineIn(Minim.MONO,512);
}
void draw()
{
  background(200,100,150);
  float m=0;
  
  for(int i=0; i<in.bufferSize()-1;i++)
  {
  if(abs(in.mix.get(i))>m)
  {
  m=abs(in.mix.get(i));
  }
  }
  ancho=int(m*600)+100;

strokeWeight(ancho);  
//line(ancho,100,ancho,250);
println(ancho);
arc(250, 300, ancho, ancho, 0, 6.30);
}


