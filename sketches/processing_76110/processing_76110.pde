
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

float x2;
float y2;
Minim audio;
AudioOutput salida;
SineWave seno;


void setup()
{
   size(400,400);
  audio=new Minim(this); 
  salida=audio.getLineOut(Minim.STEREO);
  seno=new SineWave(96000,0.8,salida.sampleRate());
  seno.portamento(200);
  salida.addSignal(seno);
}


void draw()
{
  background(255);
  x2=map(mouseX,0,400,100,300);
  y2=map(mouseY,0,400,100,300);
  fill(255,0,0);
  ellipse(x2,y2,20,20);  
  
  float frec=map(mouseY,0,width,440,14400);
  seno.setFreq(frec);
  background(0);
  stroke(255);
  for(int i=0;i<salida.bufferSize()-1;i++)
  {
    float x1=map(i,0,salida.bufferSize(),0,width);
    float x3=map(i+1,0,salida.bufferSize(),0,width);
    
    line(x1,50+salida.left.get(i)*50,x3,50+salida.left.get(i+1)*50);
    line(x1,150+salida.right.get(i)*50,x3,150+salida.right.get(i+1)*50);
  }
  
}

