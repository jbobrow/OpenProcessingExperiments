
/**
 * Linear Image.
 *   Horizontal line modification.  Albert Schueller 
 * 
 * Click and drag mouse up and down to control the signal. 
 * Press and hold any key to watch the scanning. 
 */

/* @pjs preload="J.jpg"; */
PImage img;
int direction = 1;

float signal;
        
void setup()
{
 
  size(638, 475);
  img = loadImage("J.jpg");
  //stroke(255);
  img.loadPixels();
 
}

void draw()
{
   
  loadPixels();
if (signal > img.width-1 || signal < 0) { 
    direction = direction * -1;
  }
  if (mousePressed == true) {
    signal = abs(mouseX % img.width);
  } 
  else {
    signal += (0.3*direction);
  }

  if (keyPressed == true) {
    set(0, 0, img);
    line(signal, 0, signal, img.height);
  } 
  else {
    for (int y = 0; y < img.height; y++) {
      for (int i = 0; i < img.width; i++) {
        pixels[y*img.width + i] = img.pixels[y*img.width + int(signal)];
      }
    }
    updatePixels();
  }
}



