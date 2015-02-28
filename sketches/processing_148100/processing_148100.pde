
/** 
* Brightness Tracking 
* by Golan Levin. 
* 
* Tracks the brightest pixel in a live video signal. 
*/

import processing.video.*;

Capture cam; 
int threshold = 220 ; // sensibilità luce 
int pixelSize = 1 ; // spessore di linea

void setup() { 
size(640, 480); // Change size to 320 x 240 if too slow at 640 x 480 // Uses the default video input, see the reference if this causes an error 
cam = new Capture(this, 640, 480, 30); 
noStroke(); 
smooth(); 
cam.start(); 

fill(0, 0, 0, 255); 
rect(0, 0, 640, 480) ;
}

void draw() { 
if (cam.available()) { 
cam.read(); 
// image(video, 0, 0, width, height); // Draw the webcam video onto the screen 
cam.loadPixels();
 
int index = 0; 
for (int y = 0; y < cam.height; y++) { 
for (int x = 0; x < cam.width; x++) { //disegna tutto in linea orizzontali 

// Get the color stored in the pixel 
color currColor = cam.pixels[index]; 
int pixelValue = cam.pixels[index]; 
float pixelBrightness = brightness(pixelValue);
 
if( pixelBrightness > threshold ) { 
int currR = (currColor >> 16) & 0xFF; // Like red(), but faster 
int currG = (currColor >> 8) & 0xFF; 
int currB = currColor & 0xFF; // cambio la tonalità dei colori 

fill(currR, currG, currB, pixelBrightness); 
ellipse(x - (pixelSize/2) , y - (pixelSize/2), pixelSize, pixelSize); 
} 
index++; 
} 
} 
} 
}
