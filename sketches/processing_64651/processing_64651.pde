
import ddf.minim.*;

Minim minim;
AudioInput in;

void setup()
{
  size(1200, 800, P3D);

  minim = new Minim(this);
  minim.debugOn();
  
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 1512);
}

void draw()
{
  //background(in.mix.level()*1550);
  background(0);
  smooth();
  stroke(255);
  // draw the waveforms
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    line(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
       
                line(i, 60 + in.left.get(i)*60, i+1, 60 + in.left.get(i+1)*60);
 line(i, 64 + in.left.get(i)*64, i+1, 64 + in.left.get(i+1)*64);
 line(i, 70 + in.left.get(i)*70, i+1, 70 + in.left.get(i+1)*70);
 line(i, 128 + in.left.get(i)*128, i+1, 128 + in.left.get(i+1)*128);
 line(i, 267 + in.left.get(i)*67, i+1, 267 + in.left.get(i+1)*67);
    line(i, 150 + in.right.get(i)*500, i+1, 150 + in.right.get(i+1)*500);
line(i, 450 + in.right.get(i)*800, i+1, 450 + in.right.get(i+1)*400);
    line(i, 750 + in.right.get(i)*50, i+1, 750 + in.right.get(i+1)*50);
        line(i, 350 + in.right.get(i)*15, i+1, 350 + in.right.get(i+1)*15);
  }
}


void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
  
  super.stop();
}


