
import gifAnimation.*;


PImage[] animation;
Gif loopingGif;
Gif nonLoopingGif;

public void setup() {
  
  size(1024, 900);

  println("gifAnimation " + Gif.version());
  loopingGif = new Gif(this, "finalgif.gif");
  loopingGif.loop();
    animation = Gif.getPImages(this, "finalgif.gif");

}

void draw() {
 
  background(255);
 image(loopingGif, 0, 0);
 
 
 }
 
 


