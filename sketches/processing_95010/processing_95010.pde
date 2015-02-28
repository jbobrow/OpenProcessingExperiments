
import gifAnimation.*;


PImage[] animation;
Gif loopingGif;
Gif nonLoopingGif;

public void setup() {
  
  size(1204, 768);

  println("gifAnimation " + Gif.version());
  // create the GifAnimation object for playback
  loopingGif = new Gif(this, "545.gif");
  loopingGif.loop();
    animation = Gif.getPImages(this, "545.gif");

}

void draw() {
 
  background(255);
 image(loopingGif, 0, 0);

 
 
 
 
 }
 
 


