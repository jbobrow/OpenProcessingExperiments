
import gifAnimation.*;
 
Gif loopingGif;
 
 
void setup() {
  size(400, 200);
  background (0);
  frameRate(100);
    loopingGif  = new Gif(this, "http://img3.wikia.nocookie.net/__cb20100621220542/digimon/images/e/ec/Gabumon_vg.gif");
     
    String [] animas = {};
}
 
void draw () {
 image (loopingGif, 0 , 50);
 //int  = int (random (3);
  }
 
void keyPressed () {
  if (key == 'x') {
    loopingGif.play();
 
     
  }
   
  else {
  loopingGif.pause ();
 
  }
}
