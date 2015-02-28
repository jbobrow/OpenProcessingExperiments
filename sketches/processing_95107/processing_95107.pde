
import gifAnimation.*;


PImage[] animation;
Gif loopingGif;
Gif nonLoopingGif;

public void setup() {
  
  size(1680, 1050);

  println("gifAnimation " + Gif.version());
  loopingGif = new Gif(this, "11.gif");
  loopingGif.loop();
    animation = Gif.getPImages(this, "11.gif");

}

void draw() {
 
  background(255);
 image(loopingGif, 0, 0);
 
 
 }
 
 


