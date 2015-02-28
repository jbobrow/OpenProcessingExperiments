
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim cat;
Minim dog;
int i=1, o;
int aumentax=0;

void setup()
{
  size(400,400);
}


void draw()
{
  smooth();
  background(255,255,0);
  fill(255,0,0);

ellipse(aumentax,200,20,20);

if(aumentax>=0 && aumentax<=380)
{
    aumentax+=5;
    if(aumentax==380)
      for(o=380;o>=0;--o)
      {
       aumentax-=5;
      }
}


if(aumentax==380)
{
AudioPlayer miReproductorcat;
cat=new Minim(this);
miReproductorcat=cat.loadFile("CATMEOW.mp3");
miReproductorcat.play();
cat.stop();
//aumentax -=5;
}
/*
else
{
  if(aumentax == 0)
  {
    AudioPlayer miReproductordog;
dog=new Minim(this);
miReproductordog=dog.loadFile("DOG3.mp3");
miReproductordog.play();
dog.stop();
  }
}*/


}

