
import ddf.minim.*;
 
Minim minim;
AudioInput in;
 
void setup()
{
  size(530, 530, JAVA2D);
 
  minim = new Minim(this);
  minim.debugOn();
 
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 500); 
}
 
void draw()
{
  background(0);
  stroke(255);
  for(int i = 25; i < in.bufferSize() - 15; i++)
  {
    
    line(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
    line(i, 100 + in.right.get(i)*50, i+10, 100 + in.right.get(i+1)*50);
    line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
    line(i, 200 + in.right.get(i)*50, i+10, 200 + in.right.get(i+1)*50);
    line(i, 250 + in.right.get(i)*50, i+1, 250 + in.right.get(i+1)*50);
    line(i, 300 + in.right.get(i)*50, i+10, 300 + in.right.get(i+1)*50);   
    line(i, 350 + in.right.get(i)*50, i+1, 350 + in.right.get(i+1)*50);   
    line(i, 400 + in.right.get(i)*50, i+10, 400 + in.right.get(i+1)*50);    
    line(i, 450 + in.right.get(i)*50, i+1, 450 + in.right.get(i+1)*50);
   
 
    
    line(50 + in.right.get(i)*50, i, 50 + in.right.get(i+1)*50, i+1);
    line(150 + in.left.get(i)*50, i, 150 + in.left.get(i+1)*50, i+10);
    line(250 + in.left.get(i)*50, i, 250 + in.left.get(i+1)*50, i+1);
    line(350 + in.left.get(i)*50, i, 350 + in.left.get(i+1)*50, i+10);
    line(450 + in.left.get(i)*50, i, 450 + in.left.get(i+1)*50, i+1);
    
  }
}
 
 
void stop()
{
  in.close();
  minim.stop();
 
  super.stop();
}

