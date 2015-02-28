
import arb.soundcipher.*;
import arb.soundcipher.constants.*;

SoundCipher sample=new SoundCipher(this);

int rectx,recty,rectw,recth;
int ypos=0;
int r,g,b;
int []notearray={80,40,30,90,60};
int note=0;


void setup()
{
  size(200,200);
  rectx=0;
  recty=height/2;
  rectw=width;
  recth=20;
  frameRate=60;
}

void draw()
{
  background(255,255,0);
  if(ypos==recty)
  {
    r=(int)random(255);
    g=(int)random(255);
    b=(int)random(255);
  }
  fill(r,g,b);
  rect(rectx,recty,rectw,recth);
  fill(255);
  rect(width/2,ypos,10,10);
  ypos++;
  if(ypos>height)
  {
    ypos=0;
  }

  if (frameCount0==0)
  {
    if (note<notearray.length)
    {
     sample.playNote(notearray[note],100,2.0);
     note++;
    }
    else 
    {
     note=0;
    }
  }

}
