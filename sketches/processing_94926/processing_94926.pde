


import gifAnimation.*;

PImage[] animation;
Gif loopingGif;
Gif nonLoopingGif;

  int ROW_NB = 50; // Adjust as needed
  int COL_NB = 100; 
  int GIF_SIZE = 50;
  int FRAME_NB = 3;
  int currentCol = -1;




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

   for(int i = 0; i< currentCol; i++) {
   for(int j = 0; j<= ROW_NB; j++) {   
     
   image(loopingGif, i * GIF_SIZE, j * GIF_SIZE);  }

   
 }

if (frameCount % FRAME_NB == 0) {
  currentCol++; 
  
 }

}





