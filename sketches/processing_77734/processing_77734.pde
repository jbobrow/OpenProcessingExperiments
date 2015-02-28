
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
float ancho=0.0;
int expl=0;


void setup()
{
  size(600,600);
  smooth();
  stroke(0,0,0);
  frameRate(15);
  minim=new Minim(this);
  in=minim.getLineIn(Minim.MONO,512); 
}

void draw()
{
  background(#FFED4B);
  float m=0;
  for(int i=0;i<in.bufferSize()-1;i++)
  {
    if(abs(in.mix.get(i))>m)
    {
      m=abs(in.mix.get(i));
    }
  }  
  ancho+=(m*20);
  fill(#1B26DE);
  strokeWeight(2);
  if(ancho<230&&expl==0)
  {
    ellipse(250,250,ancho+50,1.3*ancho+70);
    beginShape(POLYGON);
      fill(#FFED4B);
      curveVertex(300,300); 
      curveVertex(250,285+(1.3*ancho)/2); 
      curveVertex(250,325+(1.3*ancho)/2); 
      curveVertex(350,350+(1.3*ancho)/2); 
      curveVertex(250,375+(1.3*ancho)/2); 
    endShape();
  }
  else if(ancho<235&&ancho>230)
  {
      expl=1;
      background(#1B26DE);
      ellipse(250,250,ancho,ancho+30);
  }     
}

