
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim minim;
AudioInput in;
void setup(){
size(400,400);
 smooth();
 frameRate(25);
 minim=new Minim(this);
 in=minim.getLineIn(Minim.MONO,512);
}
int pos=0;
void draw(){
 background(#000000);
 float m=0;
 int i;
 for(i=0;i<in.bufferSize()-1;i++);
 {
   if(abs(in.mix.get(i))>m)
      {m=abs(in.mix.get(i));}
 }
 pos+=m*50;
 globo(pos,200,200);
 if(pos>300){pos=-5;}
}
void globo(int tamano,int y,int w)
{
  fill(#e76b21);
  ellipse(y,w,tamano-20,tamano);
}

