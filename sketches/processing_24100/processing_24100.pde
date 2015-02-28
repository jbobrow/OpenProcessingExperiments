
import gifAnimation.*;
import ddf.minim.*;

float x=0;

Minim minim;
AudioSample kick;
PImage[] animation;
Gif nonLoopingGif;



void setup() {
  cursor(CROSS);
  size(603, 600);
  frameRate(30);
  minim = new Minim(this);
  animation = Gif.getPImages(this, "train600.gif");
  kick = minim.loadSample("train-2.wav", 2048);
}

void draw() {
 
  image(animation[(int) (animation.length / (float) (width) * mouseX)], width - 10 - animation[0].width, height / 2 - animation[0].height / 2);
  if (mouseX > 199 && x == 0 ) { kick.trigger(); x++;}
  if (x > 5) {x=0;}
  
  noStroke();
  fill (128,6,2, mouseX/2);
  rect(mouseX, 0, 25, height);
  
  fill (128,6,2, mouseX/3);
  rect(mouseX-25, 0, 25, height);
  
  fill (128,6,2, mouseX/4);
  rect(mouseX-50, 0, 25, height);
  
  fill (128,6,2, mouseX/5);
  rect(mouseX-75, 0, 25, height);
  
  
  fill (128,6,2, mouseX/3);
  rect(mouseX+25, 0, 25, height);
  
  fill (128,6,2, mouseX/4);
  rect(mouseX+50, 0, 25, height);
  
  fill (128,6,2, mouseX/5);
  rect(mouseX+75, 0, 25, height);

}


void stop()
{
   kick.close();
  minim.stop();
  
  super.stop();
}



