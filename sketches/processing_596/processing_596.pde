
import gifAnimation.*;

Gif loopingGif;


void setup() {
  size(400, 200);
  background (0);
  frameRate(100);
    loopingGif  = new Gif(this, "bocca.gif"); 
    
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

