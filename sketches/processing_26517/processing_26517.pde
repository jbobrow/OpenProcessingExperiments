
import gifAnimation.*;
import ddf.minim.*;

float x=0;

Minim minim;
AudioSample kick;
PImage[] animation;
Gif nonLoopingGif;



void setup() {
  cursor(CROSS);
  size(1400, 600);
  frameRate(30);
  minim = new Minim(this);
  animation = Gif.getPImages(this, "broken.gif");
  kick = minim.loadSample("broken.wav", 2048);
}

void draw() {
 
  image(animation[(int) (animation.length / (float) (width) * mouseX)], width - 10 - animation[0].width, height / 2 - animation[0].height / 2);
  if (mouseX > 199 && x == 0 ) { kick.trigger(); x++;}
  if (x > 5) {x=0;}

}


void stop()
{
   kick.close();
  minim.stop();
  
  super.stop();
}



