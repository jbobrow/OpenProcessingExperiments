
import gifAnimation.*;


PImage[] animation;
Gif loopingGif;
Gif nonLoopingGif;

public void setup() {
  
  size(1680, 1000);

  println("gifAnimation " + Gif.version());
  loopingGif = new Gif(this, "F.gif");
  loopingGif.loop();
    animation = Gif.getPImages(this, "F.gif");

}

void draw() {
 
  background(255);
 image(loopingGif, 0, 0);
 
 
 }
 
 


