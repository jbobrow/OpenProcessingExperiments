
import ddf.minim.*;

Minim minim;
AudioPlayer in;

void setup()
{
  size(512, 200, P2D);

  minim = new Minim(this);


  // get a line in from Minim, default bit depth is 16
  in = minim.loadFile("dafunk.wav");
  in.play();
  in.loop();
}

void draw()
{
  background(0);
  stroke(255);

  // draw the waveforms
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {
    line(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
    line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
    noFill();
    ellipse(width/2, height/2, 50 + in.left.get(i)*50, 50 + in.right.get(i)*50);
  }
}


void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();

}


