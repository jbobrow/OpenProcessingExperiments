


import processing.video.*;
 
// Define some variables so we can tweek them easily
int w = 400;  // width of sketch
int h = 400;  // height of sketch
int fps = 40;  // frame rate of sketch
Capture cam;  // the web cam
 
void setup()
{
  size(w, h, P3D);   // use the width and height defined above to tell Pd the sketch size we want
   
  frameRate(fps);    // same for frame rate
   
  cam = new Capture(this, 800,800);  // and get hold of the webcam, telling it the image size we want
}
 
void draw()
{
  

//background(5);

  if (cam.available() == true) {  // does the user have a webcam?
      cam.read();                   // yes they do, so grab an image from it.
     
 int largeurcam =25;
 int longeurcam =25;
 int rouge=255;
 int bleue=255;
 int vert=255;
 
 if (mouseButton == LEFT){ 
   rouge=mouseX;  
bleue=mouseY;
}

if(keyPressed) {
    if (key == '1') {
   largeurcam =abs(mouseX);
    longeurcam =abs(mouseY);
    }}
  // if (mouseButton == RIGHT){ 
    //largeurcam =mouseX;
     //longeurcam =mouseY; }
 for ( int x = 0 ; x < width ; x=x+largeurcam ) {
    for ( int y = 0 ; y < height ; y=y+longeurcam ) {

      tint(rouge, bleue, vert, 126); 
image(cam, x, y, largeurcam,longeurcam) ;
 }


     
 }
  } 

  }
   

  
   
 
                                        




