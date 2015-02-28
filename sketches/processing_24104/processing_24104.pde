
import de.looksgood.ani.*;

PImage b;

import ddf.minim.*;
Minim minim;
AudioSample kick;

float x = random(width);
float y = 0;
float ya = 0;
float yb = 0;
	

int[] numbers = new int[8];

void setup()
{
  size(600, 478, P2D);
  // always start Minim before you do anything with it
  minim = new Minim(this);
  // load BD.mp3 from the data folder with a 1024 sample buffer
  // kick = Minim.loadSample("BD.mp3");
  // load BD.mp3 from the data folder, with a 512 sample buffer
  kick = minim.loadSample("breath.aif", 2048);
  Ani.init(this);
}


void draw()
{
background(0);
  b = loadImage("darkgrate.jpg");
  image(b, 0, 0);
  fill(255,50);
  stroke(0,0);
  smooth();
  
  
  // use the mix buffer to draw the waveforms.
  // because these are MONO files, we could have used the left or right buffers and got the same data
  for (int i = 0; i < kick.bufferSize() - 1; i+=50)
  {
   
    ellipse(30, y, 30 - kick.left.get(i)*500, 30 - kick.left.get(i+1)*500);
    ellipse(50, ya, 22 - kick.left.get(i)*500, 22 - kick.left.get(i+1)*500);
    ellipse(100, yb, 30 - kick.left.get(i)*500, 30 - kick.left.get(i+1)*500);
    ellipse(150, y, 15 - kick.left.get(i)*500, 15 - kick.left.get(i+1)*500);
    ellipse(300, ya, 25 - kick.left.get(i)*500, 25 - kick.left.get(i+1)*500);
    ellipse(400, ya, 20 - kick.left.get(i)*500, 20 - kick.left.get(i+1)*500);
    ellipse(450, yb, 30 - kick.left.get(i)*500, 30 - kick.left.get(i+1)*500);
    ellipse(550, y, 30 - kick.left.get(i)*500, 30 - kick.left.get(i+1)*500);
}


 


Ani.to(this, 2, "y", height + 50);
Ani.to(this, 3.5, "ya", height + 50);
Ani.to(this, 4, "yb", height + 50);


if ( y > 478) { y = 0;}
if ( ya > 478) { ya = 0;}
if ( yb > 478) { yb = 0;}
println( y);

 }


void stop()
{
  // always close Minim audio classes when you are done with them
  kick.close();
  minim.stop();
  
  super.stop();
}



