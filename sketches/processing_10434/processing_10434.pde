
import ddf.minim.*;

Minim minim;
AudioPlayer gggg;

PImage[] bs;
void setup()
{
  size(639,231);
  bs = new PImage[7];
  bs[0]=loadImage("1.jpg");
  bs[1]=loadImage("2.jpg");
  bs[2]=loadImage("3.jpg");
  bs[3]=loadImage("4.jpg");
  bs[4]=loadImage("5.jpg");
  bs[5]=loadImage("6.jpg");
  bs[6]=loadImage("7.jpg");
    
  minim = new Minim(this);
  gggg = minim.loadFile("gggg.wav");
  gggg.loop();
}
void draw()
{
  int index = frameCount % 7;
    image(bs[index],0,0);
}



