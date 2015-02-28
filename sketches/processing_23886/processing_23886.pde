
//james thompson
//02.22.2011
//
//inspired by / stolen from:
//frequency energy
//damien di fede
PImage backimg;
import ddf.minim.*;
import processing.opengl.*;

AudioPlayer track;
Minim minim;

void setup()
{
  size(800, 300);
 background ( random(255), random(255), random(255), random(255));
  stroke( random(255), random(255), random(255), 60);
  smooth();
backimg= loadImage ("city.png") ;
image (backimg, 0,60);

  minim = new Minim(this);

  track = minim.loadFile("jelly.mp3", 2048);
  track.loop();
}

float bpm = 120.2;
float mspb = 60000/bpm;

float x = 0;
float y = 0;

float vertical_scaling = 160;
float column_width = 100;

int time = 0;

void draw()
{
  int lapse = millis() - time;
  
  for(int i = 0; i < track.left.size()-1; i++)
  {
    float column_norm = column_width/2*(1+2*x);
    
    float x1 = track.left.get(i)*column_width/2 + (column_norm);
    float x2 = track.left.get(i+1)*column_width/2 + (column_norm);
    float y1 = height - y/vertical_scaling;
    float y2 = height - (y+1)/vertical_scaling;
    
    line(x1, y1, x2, y2);
    
    y++;
  }

  if (lapse > mspb) 
  {
    time = millis();
    x++;
    y = 0;
    
    if ((x+1)*column_width > width)
    {
      x = 0;
      background( random(255), random(255), random(255), random(255));
      stroke( random(255), random(255), random(255), random(255));
      backimg= loadImage ("city.png") ;
image (backimg, random(200),random(200));
    }
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  track.close();
  minim.stop();

  super.stop();
}


