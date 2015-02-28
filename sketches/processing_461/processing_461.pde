
import gifAnimation.*;

Gif loopingGif;


void setup() {
  size(600, 600);
  background (0);
  frameRate(12);
  loopingGif  = new Gif(this, "hite.gif"); 
     
}

  
void draw () {
 
if (mousePressed== true ) {
 frameRate(120);
 image(loopingGif, mouseX-loopingGif.width/2, mouseY-loopingGif.height/2);  
 loopingGif.play();

  }
   else {
 loopingGif.pause();
 }
   
 
   
}

