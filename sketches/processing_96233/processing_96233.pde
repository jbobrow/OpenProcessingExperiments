
import processing.video.*;
 

Ring[] rings; // Declare the array
int numRings = 50;
int currentRing = 0;
int w = 400;  // width of sketch
int h = 400;  // height of sketch
int fr = 10;  // frame rate of sketch
Capture video;  // the web cam
 
void setup()
{
  size(w, h, P3D);  
   
  frameRate(fr);    
   
  video = new Capture(this, w, h);  // and get hold of the webcam, telling it the image size we want
  video.start();
  rings = new Ring[numRings]; // Create the array
for (int i = 0; i < numRings; i++) {
rings[i] = new Ring(); // Create each object
}
}
 
void draw()
{
  if (video.available() == true) {  
      video.read();                  
      for (int i = 0; i < numRings; i++) {
rings[i].grow();
rings[i].display();
  }
   
  image(video, 0, 0, w, h); // draw the image from the webcam
   
  PImage split = get(0,0, width, height/2);  // create a copy image.
 
  rotateX(PI);            // rotate the video 180 around the x axis
  translate(0,-height);    
   
  
   
  tint(199,223,234);             
   
  image(split, 0, 0);     
   
  noTint();
                                                                 
}
}
void mousePressed() {
rings[currentRing].start(mouseX, mouseY);
currentRing++;
if (currentRing >= numRings) {
currentRing = 0;
}
}
class Ring {
float x, y; // X-coordinate, y-coordinate
float diameter; // Diameter of the ring
boolean on = false; // Turns the display on and off
void start(float xpos, float ypos) {
x = xpos;
y = ypos;
on = true;
diameter = 1;
}
void grow() {
if (on == true) {
diameter += 0.5;
if (diameter > 400) {
on = false;
}
}
}
void display() {
if (on == true) {
noFill();
strokeWeight(10);
stroke(200,200,200,40);
ellipse(x, y, diameter, diameter);
}
}
}




