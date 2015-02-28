
//Project: Popsound
//Assignment: a unique drawing tool
//class: AVSYS Spring 2013

import ddf.minim.*;

Minim minim;
AudioInput in;

void setup()
{
  size(800, 600);
  noStroke();
  smooth();

  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
}

void draw()
{
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {
    float yL = in.left.get(i)*50;
    float yR = in.right.get(i)*50;

    if (yL > 5) {
      fill(random(255), 60);
      ellipse(random(width), random(height), 50, 50);
    }
    if (yR > 5) {
      fill(255, 80);
      ellipse(random(width), random(height), 5, 5);
    }
  }
}

void stop()
{
  in.close();
  minim.stop();

  super.stop();
}


