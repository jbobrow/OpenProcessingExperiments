
//This borrows code from minim and random walker from the class code (author- nick senske?).

import ddf.minim.*; 
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;


Dancer d1;
Dancer d2;

void setup(){
  
  
  minim = new Minim(this);
  song = minim.loadFile("eno.mp3", 2048);
  song.loop();
  size(1280,720,P3D);
  background(0);

  d1 = new Dancer();
  d2 = new Dancer();
}

void draw(){
  
 //float m = map(mouseX,0,400,-300,300);
//camera(m,50,200,width/2,height/2,0,0,1,0); //turning on the camera shows an interesting viewpoint.  
 smooth();
 translate(width/2,height/2,0);
  d1.move();
  d1.draw();
  d2.move();
  d2.draw();
} 

class Dancer {
  
  color c;
  float x;
  float y;
  float z;
  //float a = song.left.level() * 1000;
  //float b = song.right.level() * 1000;
  float k = song.mix.level();
 // float j = map(k,-1,1,0,255);
  
  Dancer(){
    float j = map(k,-1,1,0,10);
    c = color(int(random(0,255)),int(random(0,255)),int(random(0,255)));
    x = (0);
    y = (0);
    z = (0);
  }

  void move(){ 
    float a = song.left.level()*40;
    float b = song.right.level()*40;
    //float l = map(a,0,
    x = x +random(-a,a);//amount of movement of the objects determined by the music levels
    y = y + random(-b,b);
    z = z + random(-a,a);
  }

  void draw(){
    float j = map(k,-1,1,0,10);
  fill(c,j);
    stroke(c,10);
    float l = song.mix.level() * 1500;
    ellipse(x,y,l,l);//ellipse size determined by the level of music
  }
}

// here we provide a way to mute out
void keyPressed()
{
  if ( key == 'm' )
  {
    if ( song.isMuted() )
    {
      song.unmute();
    }
    else
    {
      song.mute();
    }
  }
}

void stop()
{
  // always close Minim audio classes when you are finished with them
  song.close();
  // always stop Minim before exiting
  minim.stop();
  // this closes the sketch
  super.stop();
}

