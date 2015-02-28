
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer audio;
float SMOOTHING = 0.15;
float vol = 0;
float trans;
PImage littlePeople;

void setup()
{
  size(600, 600);
  ellipseMode (CENTER);
  imageMode (CENTER);
  noStroke();
  smooth();

  minim = new Minim(this);
  audio = minim.loadFile("mum.mp3");
  audio.loop(); 
  trans= 230; 
  littlePeople = loadImage ("lp.png");
}

void draw()
{
  background(250);
   
    fill( random (250,255),random (250,255),0);
  ellipse(width/2, height, 1.2*width,1.2*height);
  
  fill(165,42,42, trans);


  vol = lerp(vol, audio.mix.level(), SMOOTHING);

  
  ellipse(width/2, height, width, height-vol*500);
  
  image(littlePeople,width/2,(height-vol*500)-height/2-30,100,100);
}



