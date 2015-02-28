
import gifAnimation.*;


PImage[] animation;
Gif loopingGif;
Gif nonLoopingGif;

public void setup() {
  
  size(1280, 800);

  println("gifAnimation " + Gif.version());
  // create the GifAnimation object for playback
  loopingGif = new Gif(this, "looper.gif");
  loopingGif.loop();
    animation = Gif.getPImages(this, "looper.gif");

}

void draw() {
 
  background(255);
 image(loopingGif, 0, 0);

 
 
 
 
 }
 
 


