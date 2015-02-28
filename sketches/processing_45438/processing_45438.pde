

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer audio;

float SMOOTHING = 0.15;
float vol = 0, y;

void setup()
{
  size(600, 500);
  background(200);
  smooth();

  minim = new Minim(this);  
  audio = minim.loadFile("1.mp3");
  audio.loop();
}

void draw()
{
  noStroke();
  fill(255,5);
  rect(0, 0, width, height); 

  vol = lerp(vol, audio.mix.level()*100, SMOOTHING);

  if (vol>7) {
    stroke(70,200-vol*10,200-vol*7,vol*100);
    strokeWeight(vol*vol*vol/200);
    line(0, random(height), width, random(height));

    if (vol>30) {
      stroke(200);
      strokeWeight(1);
      y = random( height);
      line(0, y, width, y);
    }
  }

  println(vol);
}

void stop()
{
  audio.close();
  minim.stop();
  super.stop();
}


