
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim minim;
AudioInput in;
void setup(){
size(500,500);
 smooth();
 frameRate(25);
 minim=new Minim(this);
 in=minim.getLineIn(Minim.MONO,512);
}
int pos=0;
void draw(){
 background(50,50,100);
 float m=0;
 int i;
 for(i=0;i<in.bufferSize()-1;i++);
 {
   if(abs(in.mix.get(i))>m)
      {m=abs(in.mix.get(i));}
 }
 pos+=m*50;
 globo(pos,300,300);
 if(pos>width){pos=0;}
}
void globo(int tamano,int y,int w)
{
  ellipse(y,w,tamano,tamano);
} 


