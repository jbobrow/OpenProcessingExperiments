
/**
 * Take the webcam output and mirror it horizontally down the middle.
 * Hilarity ensues.
 *
 * By Oli
 */
import processing.video.*;
 
// Define some variables so we can tweek them easily

int newx = 0; //my x
int newy = 0; //my y
int xjump = 18;
int yjump = 18;


int w = 640;  // width of sketch
int h = 480;  // height of sketch
int fps = 5;  // frame rate of sketch
Capture cam;  // the web cam
 
void setup()
{
  size(880, 660  , P3D);   // use the width and height defined above to tell Pd the sketch size we want
 
   
   
  frameRate(fps);    // same for frame rate
   
  cam = new Capture(this,w,h,fps);  // and get hold of the webcam, telling it the image size we want
}
 
void draw()
{
  if (cam.available() == true) {  // does the user have a webcam?
      cam.read();                   // yes they do, so grab an image from it.
  }
  
  
  image(cam, 0, 0, w, h); // draw the image from the webcam
   image(cam, 10, 10, w-10, h-10);
    image(cam, 20, 20, w-20, h-20);
     image(cam, 30, 30, w-30, h-30);
      image(cam, 40, 40, w-40, h-40);
       image(cam, 50, 50, w-50, h-50);
        image(cam, 60, 60, w-60, h-60);
         image(cam, 70, 70, w-70, h-70);
          image(cam, 80, 80, w-80, h-80);
           image(cam, 90, 90, w-90, h-90);
            image(cam, 100, 100, w-100, h-100);
             image(cam, 110, 110, w-110, h-110);
              image(cam, 120, 120, w-120, h-120);
               image(cam, 130, 130, w-130, h-130);
                image(cam, 140, 140, w-140, h-140);
                 image(cam, 150, 150, w-150, h-150);
                  image(cam, 160, 160, w-160, h-160);
                   image(cam, 170, 170, w-170, h-170);
  
  
     
  PImage slice = get(0,0, width/2, height);  // create a copy image of just the left hand side
 
  rotateY(PI);            // rotate the canvas 180 around the y axis
  translate(-width,0);    // shift the canvas back to where we can see it.
   
  // the 2 steps above rotate and shift the drawing surface,
  // so when we later draw the left hand side image,
  // it will appear mirrored.
   
  tint(100,200,255);              // tell Pd to tint any future pixels a grey colour
   
  image(slice, 0, 0);     // draw the copy of the left hand side image
   
  noTint();               // turn off tinting to make the bed
                          // for next time round the draw() loop    



}             // for next time round the draw() loop   

void Draw() {
  
  cam.loadPixels();
  
  for(int y = 0; y < cam.height; y++) {
    for(int x = 0; x < cam.width; x++) {
      int location = x + y * cam.width;
      color c = cam.pixels[location];
      
      strokeWeight(4);
      stroke(c);
      point(newx,newy);
      newx+=xjump;
      // same as newx = newx+xjump;
      
    }
    
    newy = 0;
    
    cam.updatePixels();
  }
  
}

void captureEvent(Capture v) {
  v.read();
}

