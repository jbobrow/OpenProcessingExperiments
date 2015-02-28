
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer ftf;
AudioInput input;
float r = 0;
float g = 0;
float b = 0;
float x = 0;
float y = 0;

void setup()
{
  size(500, 500, P2D);
   minim = new Minim(this);
   ftf = minim.loadFile("ftf.MP3", 1000);
   ftf.loop();
   input = minim.getLineIn();
   r=random(0,255);
   g=random(0,255);
   b=random(0,255);
   
}
void draw()
{
  background(r,g,b);
  stroke(255);
  // we draw the waveform by connecting neighbor values with a line
  // we multiply each of the values by 50 
  // because the values in the buffers are normalized
  // this means that they have values between -1 and 1. 
  // If we don't scale them up our waveform 
  // will look more or less like a straight line.
  for(int i = 0; i < ftf.bufferSize() - 1; i++)
  {
    line(i, 50 + ftf.left.get(i)*50, i+1, 50 + ftf.left.get(i+1)*50);
    line(i, 150 + ftf.right.get(i)*50, i+1, 150 + ftf.right.get(i+1)*50);
  }
  
  
  r=r+random(-5,5);
  g=g+random(-5,5);
  b=b+random(-5,5);
  if(r<=0){
    r=r+10;
  }
  if(r>=255){
    r=r-10;
  }
  if(g<=0){
    g=g+10;
  }
  if(g>=255){
    g=g-10;
  }
  if(b<=0){
    b=b+10;
  }
  if(b>=255){
    b=b-10;
  }
  translate(width/2,300);
  x=cos(frameCount*0.05)*50;
  y=sin(frameCount*0.05)*50;
  fill(g,b,r);
  ellipse(x,y,20,20);
  fill(b,g,r);
  ellipse(y,x,20,20);
}

