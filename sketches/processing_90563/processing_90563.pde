
import gifAnimation.*;
PImage[] animation;
 
public void setup() {
  size(500,280);
  noStroke();
  animation = Gif.getPImages(this, "dlsm.gif");
}
void draw() {
  imageMode(CORNERS);
  image(animation[(int) (animation.length / (float) (width) * mouseX)], width - animation[0].width, height / 2 - animation[0].height / 2);
}

