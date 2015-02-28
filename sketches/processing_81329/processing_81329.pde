
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/596*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
import gifAnimation.*;

Gif loopingGif;
PImage bg;
PImage quit;
int value = 0;
int c = 1;

void setup() {
  size(800, 583);
  background (255);
  bg = loadImage("bg.jpg");
  quit = loadImage("quit.jpg");
  loopingGif  = new Gif(this, "cursor2.gif"); 
    
    String [] animas = {};
}

void draw () {
    image(bg,0,0);
 if (mousePressed == true) {
  c = c + 1;
 }
  
  if(c > 1) { 
      cursor(loopingGif);
      loopingGif.play();
    } 
    
      if(c > 30) { 
      image(quit,0,0);
    } 
 
 //int  = int (random (3);
  }



