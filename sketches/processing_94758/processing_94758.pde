


import gifAnimation.*;

PImage[] animation;
Gif loopingGif;
Gif nonLoopingGif;


public void setup() {
  
  size(1680, 1000);
  frameRate(100);
  background(255);

  
  println("gifAnimation " + Gif.version());
  // create the GifAnimation object for playback
  loopingGif = new Gif(this, "giftri4.gif");
  loopingGif.loop();
  // create the PImage array for the interactive display
  animation = Gif.getPImages(this, "giftri4.gif");
}

void draw() {
  
  for(int i = 0; i< width; i= i+50){
  for(int j = 0; j< height; j= j+50){  

  image(loopingGif, i, j);
  

  }
  }

 

}





