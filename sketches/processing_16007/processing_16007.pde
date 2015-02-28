
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import integralhistogram.*;
Minim minim;
AudioSample groove;
AudioSample equivocado;
PImage imgSource;

void setup()
{ 
  
  minim = new Minim(this);
  
  frameRate(12);

 groove = minim.loadSample("groove.mp3", 2048);
equivocado = minim.loadSample("equivocado.mp3", 2048);


  
  int bit = 2;
  
  imgSource       = loadImage("cats.jpg");
  PImage imgTarg  = loadImage("waldo1.jpg");
  
  TargetUser targetImg = new MyTargetUser(imgTarg,bit,1,0.022);
  targetImg.setOutputImage(imgSource);
  
  size(imgSource.width*2+10+imgTarg.width,imgSource.height+10);
  image(imgSource, 0, 0);

  IntHistUser test = new MyIntHistUser(imgSource,bit);
  
  maskResult();
  
  test.imageSearch(targetImg);
  
  imgSource.updatePixels();
  
  image(imgTarg, imgSource.width+4, 0);
  image(imgSource, imgSource.width+4 + imgTarg.width+4,0);
  equivocado.trigger();
}



 

void maskResult()
{
  for(int i=0;i<imgSource.width*imgSource.height;i++)
    imgSource.pixels[i] = 0|0|(imgSource.pixels[i])&0xFF;
}



