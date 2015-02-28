
PImage bg;
PImage cursor;
import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup() {
  size(700, 350);
   bg = loadImage("doge.jpg");
   cursor = loadImage("cursor.png");
image(cursor, 0, 0);
 minim = new Minim(this);
  player = minim.loadFile("jingle bells.mp3");
  player.loop();

 
  
}


void draw() {
  background(bg);
  imageMode(CENTER);
 image(cursor, mouseX,mouseY);

  
  
     if (mousePressed) {
    bg = loadImage("doge2.jpg");
    noCursor();
    } else {
    bg = loadImage("doge.jpg");
    noCursor();  
    frameRate(100);
 
  
  }
  }




