
PImage img1;    
PImage img2;  
PImage img3;    
PImage img4;  
PImage img5;

float xPos = 397;
float yPos = 247;
float dirX = 4;
float dirY = 6;

import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup() {
  noCursor();
  size(800, 600);

  img1 = loadImage("0.jpg");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.jpg");

  minim = new Minim(this);

  player = minim.loadFile("sound.mp3", 2048);
  player.loop(); 
}
void draw() {
  image(img1, 0, 0);
  image(img2, mouseX, mouseY);
  if (mousePressed) {
    image(img5, mouseX, mouseY);
    player.pause();
    player.rewind();
    
  }
  else {
    image(img3, 439, yPos); 
    if (yPos < 247 || yPos > 328) { //rechte oder likne Grenze
      dirY = dirY * -1;
    }
    yPos = yPos + dirY; 

player.play(); 

    image(img4, xPos, 380); 
    if (xPos > 402 || xPos < 274) { //rechte oder likne Grenze
      dirX = dirX * -1;
    }
    xPos = xPos + dirX;
  }
}
void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();

  super.stop();
}


