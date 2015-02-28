
import gifAnimation.*;

int y;
int num =14;
PImage[] animation;
Gif loopingGif;
Gif nonLoopingGif;

public void setup() {
  size(1680, 1000);
  frameRate(100);
  
  println("gifAnimation " + Gif.version());
  // create the GifAnimation object for playback
  loopingGif = new Gif(this, "giftrianglerow2.gif");
  loopingGif.loop();

}

void draw() {

 
  background(255);
 image(loopingGif, -5,0);

 
 }

