
import gifAnimation.*;
PImage[] animation;

public void setup() {
  size(500,384);
  noStroke();
  animation = Gif.getPImages(this, "deal.gif");
}
void draw() {
  imageMode(CORNERS);
  image(animation[(int) (animation.length / (float) (width) * mouseX)], width - animation[0].width, height / 2 - animation[0].height / 2);
}



