
import arb.soundcipher.*;
import arb.soundcipher.constants.*;

SoundCipher mySample = new SoundCipher(this);
int rectX, rectY,rectW, rectH;
int yPos=0;
int c=0;
int [] noteArray = {80,40,30,90,60};

float r,g,b;
int note, velocity;

void setup()
{
  size(200,200);
  rectX=0;
  rectY=height/2;
  rectW=width;
  rectH=20;
  frameRate(60);
}

void draw()
{
  background(255,255,0);
  if (yPos==height/2)
  {
    
    r=random(255);
    g=random(255);
    b=random(255);
 
 
  
}
 if(frameCount60==0)
 {
   note=(int) random(127);
     
   mySample.playNote(noteArray[note],100,2);
 
 }
   fill(r,g,b);
  rect(rectX,rectY,rectW,rectH);
  fill(255);
  rect(width/2,yPos,10,10);
  yPos++;
  if(yPos>height)
   {
     yPos=0;
    
     
  
 
    

}

}
