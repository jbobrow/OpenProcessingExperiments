
/**
 * Bounce. 
 * 
 * When the shape hits the edge of the window, it reverses its direction. 
 */
 
import netscape.javascript.*;
import ddf.minim.*;

AudioPlayer player;
Minim minim;
 
 
int size = 60;       // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

PImage imge;
PImage img;


void setup() 
{
  size(800, 576);
  
   minim = new Minim(this);
   
    player = minim.loadFile("FullOperaMix.mp3", 2048);
    player.play();
  
  noStroke();
  frameRate(100);
  smooth();
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
  
  imge=loadImage("colonia2.jpg");
  img=loadImage("Alex20 copia.gif");
}

void draw() 
{
  background(imge);
  
  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-size || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height-size || ypos < 0) {
    ydirection *= -1;
  }

  // Draw the shape
 
  image (img,xpos+size/7,ypos+size/7);
  
}

