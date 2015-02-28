
import ddf.minim.*;
 
Minim minim;
AudioPlayer song;

int x = 0;

void setup()
{
  size(1024, 200);
 
  minim = new Minim(this);
 
  // specify 512 for the length of the sample buffers
  // the default buffer size is 1024
  song = minim.loadFile("train_sight+sound_10172011_001_1-2.aif", 1024);
  song.play();
}
 
void draw()
{
  x++;
  if (x>width){x=0;}
  
//  background(0);
  stroke(255);
  // we draw the waveform by connecting neighbor values with a line
  // we multiply each of the values by 50 
  // because the values in the buffers are normalized
  // this means that they have values between -1 and 1. 
  // If we don't scale them up our waveform 
  // will look more or less like a straight line.
  for(int i = 0; i < 2; i++)
  {
    line(x, 50 + song.left.get(i)*50, x, 50 + song.left.get(i+1)*500);
    line(x, 150 + song.right.get(i)*50, x, 150 + song.right.get(i+1)*500);
  }
}
 
void stop()
{
  song.close();
  minim.stop();
 
  super.stop();
}

