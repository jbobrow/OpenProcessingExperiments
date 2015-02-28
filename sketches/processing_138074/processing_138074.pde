

/**
 * image feedback process.
 * 
 * KEYS
 * del, backspace      : reset screen
 * s                   : save png
 * MOUSE
 * drag                : to view the rain begins to fall
 */

//Import 'Minim' library files
import ddf.minim.*;

//Declare global variables
PImage img;
Minim minim;
AudioPlayer rain;

//Load canvas, image, audio file
void setup() {
  size(1280, 720);
  background(255);
  img = loadImage("cwb_chuva.jpg");
  image(img,0,0);
  minim = new Minim(this);
  rain = minim.loadFile("rain.mp3");
  rain.play();
  rain.loop();
}

//Draw the rain
void draw() {
  int x1 = (int) random(0, width);
  int y1 = 0;

  int x2 = round(x1 + random(0,0));
  int y2 = round(random(-100, 100));

  int w = (int) random(20, 20);
  int h = height;

  copy(x1,y1, w,h, x2,y2, w,h);
}

//Drag the mouse to view the rain starting
void mouseDragged(){
  image (img, 0,0);
  rain.loop();
}
  
//Reset the screen
void keyReleased() {
  if(keyCode == DELETE || keyCode == BACKSPACE) {
    background(255);
    image(img,0,0);
    rain.rewind();
  }
  if(key=='s' || key=='S') saveFrame("cwb_rain.png");
}

