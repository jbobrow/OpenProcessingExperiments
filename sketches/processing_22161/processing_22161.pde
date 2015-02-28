
import gifAnimation.*;

PImage[] animation;
Gif nonLoopingGif;


public void setup() {
  size(580, 600);
  frameRate(30);
  
  animation = Gif.getPImages(this, "train.gif");
}

void draw() {
  image(animation[(int) (animation.length / (float) (width) * mouseX)], width - 10 - animation[0].width, height / 2 - animation[0].height / 2);
}

void mousePressed() {
  nonLoopingGif.play();
}





