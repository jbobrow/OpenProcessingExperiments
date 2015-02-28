
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/41028*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
// Code adapted from http://www.neilwallis.com/java/water.html and http://freespace.virgin.net/hugo.elias/graphics/x_water.htm

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;



int [] ripple;
int index;
int lastIndex;
boolean showRipples = false;
PImage img;


 
void setup()
{
      img = loadImage("water.jpg");

    image(img, 0, 0);
  size(700,400);
  img = loadImage("water.jpg");
  ripple = new int[width*height*2];
  background(0);
   
  index = 0;
  lastIndex = width*height;
  for(int i = 0; i < width*height*2; i++)
    ripple[i] = 0;
   

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
}

void mouseReleased()
{
  createRipple(mouseX, mouseY);
}
 
void mouseDragged()
{
  createRipple(mouseX, mouseY);
}
 
void createRipple(int mx, int my)
{
  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      if(x > mx-3 && x < mx+3 && y > my-3 && y < my+3)
        ripple[y*width + x + index] = 55; 
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


