
/* Christian Uziel Carvajal Santos
    GLOBO */

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
float ancho=0, alto=0;
float m=0;
void setup()
{
  size(500,500);
  smooth();
  frameRate(15);
  minim= new Minim(this);
  in=minim.getLineIn(Minim.MONO,512);
}
 
void globo()
{
  fill(#2AA5B8);
  noStroke();
  ellipse(250,250,ancho+80,alto+120);
  stroke(250);
  noFill();
  bezier(254,300+(alto/2),254,350+(alto/2),250,400+(alto/2),400,400+(alto/2));
}
 
void inflado()
{
  for(int i=0;i<in.bufferSize()-1;i++)
  {
    if(abs(in.mix.get(i))>m)
    {
      m=abs(in.mix.get(i));
    }
  }
 
} 
void draw()
{
   
  background(0);
  if(ancho<450)
  {
  globo();
  inflado();
  }
  ancho=int(m*500);
  alto=int(m*500);  
 // println(conf2);
  println(ancho);
}

