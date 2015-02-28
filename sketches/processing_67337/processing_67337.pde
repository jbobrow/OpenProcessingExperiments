
import ddf.minim.*;

Minim minim;
AudioInput in;

void setup()
{
  size(512, 400, P3D);

  minim = new Minim(this);
  minim.debugOn();
  
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);
}

void draw()
{
  background(#FFE200);
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    fill(#711686);
    stroke(#711686);
    strokeWeight(4);
    line(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
    line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
   
  if(in.left.get(i) > .996 && in.right.get(i) > .996){
    textSize(40);
  text((hour() + ":" + minute() + ":" + second()), (width/2)-80, 3*(height/4));
}
}
}

void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
  
  super.stop();
}

