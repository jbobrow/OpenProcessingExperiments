
/**
 * Take the webcam output and mirror it horizontally down the middle. 
 * Hilarity ensues.
 * 
 * By Oli
 */
import processing.video.*;

// Define some variables so we can tweek them easily
int w = 640;  // width of sketch
int h = 480;  // height of sketch
int fps = 1;  // frame rate of sketch
Capture cam;  // the web cam

void setup() 
{
  size(w, h, P3D);   // use the width and height defined above to tell Pd the sketch size we want
  
  frameRate(fps);    // same for frame rate
  
  cam = new Capture(this, w, h);  // and get hold of the webcam, telling it the image size we want 
} 

void draw()
{ 
  if (cam.available() == true) {  // does the user have a webcam?
      cam.read();                   // yes they do, so grab an image from it.
  }
  
  image(cam, 0, 0, w, h); // draw the image from the webcam
  
  PImage slice = get(0,0, width/2, height);  // create a copy image of just the left hand side

  rotateY(PI);            // rotate the canvas 180 around the y axis 
  translate(-width,0);    // shift the canvas back to where we can see it.
  
  // the 2 steps above rotate and shift the drawing surface, 
  // so when we later draw the left hand side image,
  // it will appear mirrored.
  
  tint(150);              // tell Pd to tint any future pixels a grey colour
  
  image(slice, 0, 0);     // draw the copy of the left hand side image 
  
  noTint();               // turn off tinting to make the bed 
                          // for next time round the draw() loop                                          
}

