
import ddf.minim.signals.*;
import ddf.minim.*;

AudioInput in;
Minim minim;

void setup()
{
  
  size(600,400);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO,1024);

  
  
}

void draw()
{
 
    PImage img = loadImage("g.jpg");
    noTint(); // ノーマル
image(img, 0,0, 600, 400);
  
  
  stroke(255);
  int range = 100;
  
translate(0,280);
rotate(radians(-25));

  pushMatrix();
  for(int i = 130; i < in.left.size()-500; i++)
  {
    line(i,0 + in.left.get(i)*range, i+1, 0 + in.left.get(i+1)*range);
    line(i,10 + in.left.get(i)*range, i+1, 10 + in.left.get(i+1)*range);
    line(i,20 + in.left.get(i)*range, i+1, 20 + in.left.get(i+1)*range);
    line(i,30 + in.left.get(i)*range, i+1, 30 + in.left.get(i+1)*range);
    line(i,40 + in.left.get(i)*range, i+1, 40 + in.left.get(i+1)*range);
  }
  popMatrix();  
}

void stop()
{
  in.close();
  minim.stop();
}

