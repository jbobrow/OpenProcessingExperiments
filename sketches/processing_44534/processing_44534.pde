
import gifAnimation.*;
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer mysound;
AudioMetaData meta;

PImage[] animation;
Gif loopingGif;

public void setup() {
  size(395, 305);
  frameRate(10);
   minim = new Minim(this);                        // cerate a new Minim object
  mysound = minim.loadFile("Dead or Alive - You spin me Right Round Chorus Loop.mp3", 512);        // load the MP3 // set a buffersize
  meta = mysound.getMetaData();
  mysound.loop();                
  
  // create the GifAnimation object for playback
  loopingGif = new Gif(this, "171-infinite.gif");
  loopingGif.loop();
  
}

void draw() {
image(loopingGif,10,10);

}

void stop()
{

  mysound.close();
  minim.stop();

  super.stop();
}

