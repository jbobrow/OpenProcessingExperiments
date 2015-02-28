
// Code adapted from http://www.neilwallis.com/java/water.html and http://freespace.virgin.net/hugo.elias/graphics/x_water.htm
// Photo retrieved from http://good-wallpapers.com/pictures/1486/3D_Water_1920x1440.jpg

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer water; 


int [] ripple;
int index;
int lastIndex;
boolean showRipples = false;
PImage img;
 
void setup()
{
  size(700,400);
  img = loadImage("water.jpg");
  ripple = new int[width*height*2];
  background(0);
   
  index = 0;
  lastIndex = width*height;
  for(int i = 0; i < width*height*2; i++)
    ripple[i] = 0;
    
    m = new Minim (this) ;
 water = m. loadFile("Water Splash-SoundBible.com-800223477.mp3");
}
 
void draw()
{
  int i = index;
  index = lastIndex;
  lastIndex = i;
  updateRipples(lastIndex, index);
   
  if(showRipples) drawRipples();
  else drawImage();
}
 
void drawRipples()
{
  loadPixels();
  for(int i = 0; i < width*height; i++)
    pixels[i] = color(ripple[i+index]);
  updatePixels();
}
 
void drawImage()
{
  loadPixels();
  for(int x = 1; x < width-1; x++) {
    for(int y = 1; y < height-1; y++) {
      int i = y*width + x;
      int s = i + index;
      int dx = (ripple[s-1] - ripple[s+1]);
      int dy = (ripple[s-width] - ripple[s+width]);
      int px = constrain(x + dx, 0, width - 1);
      int py = constrain(y + dy, 0, height - 1);
      pixels[i] = img.pixels[py*width + px];
    }
  }
  updatePixels();
}
 
 
void mousePressed()
{
  createRipple(mouseX, mouseY);
  water.loop(0);
}

void mouseReleased()
{
  createRipple(mouseX, mouseY);
   water.loop(0);
}
 
void mouseDragged()
{
  createRipple(mouseX, mouseY);
   water.loop(0);
}
 
void createRipple(int mx, int my)
{
  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      if(x > mx-3 && x < mx+3 && y > my-3 && y < my+3)
        ripple[y*width + x + index] = 512;
    }
  }
}
 
void updateRipples(int src, int dest)
{
  for(int x = 1; x < width-1; x++) {
    for(int y = 1; y < height-1; y++) {
      int i = y*width + x;
      int s = i + src;
      int d = i + dest;
      ripple[d] = ((ripple[s-1] + ripple[s+1] + ripple[s-width] + ripple[s+width]) >> 1) - ripple[d];
      ripple[d] -= ripple[d] >> 5;
    }
  }
}

