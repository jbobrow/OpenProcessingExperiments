
/*z3220465 Johanna Loch-Allen. 
This is my Project2 for Interactive Media. I based my code around:

'network test v2'
uploaded by:
claus rytter bruun de neergaard
url: http://openprocessing.org/visuals/?visualID=6008 

I also used the 'Track_Color' code by Monica Monin from the week 7 class 
& located in the "Monica WK 7" examples in the classwork folder.

Many many thanks to Monica Monin, my tutor, who broke it down for me & helped me get a much better
understanding of Processing functions, And for helping me figure out how to get the code to do what
I wanted it to! 

INSTRUCTIONS FOR USE!:
You can can set the colour you care tracking to whatever you want it to be..
I personaly like to try tracking the red in my lips. but the colour will show up in the circle once
you have selected a bolour by using your mouse to click. 
You will need a webcam for this code to work.

*/


import processing.video.*;
Capture myCapture;

int boids = 10;                           // amount of boids
int canvasX = 700;                        // canvas size x-direction
int canvasY = 700;                         // canvas size y-direction
float inc = 0.002;                         // move increasement every loop
 
float[] ptsX = new float[boids];           // declare + create array X
float[] ptsY = new float[boids];           // declare + create array Y
float[] posX = new float[boids];           // declare + create array X
float[] posY = new float[boids];           // declare + create array Y


Capture video;
color trackColor;

void setup() 
{
  size(canvasX, canvasY);

  // The name of the capture device is dependent those
  // plugged into the computer. To get a list of the 
  // choices, uncomment the following line 
  // println(Capture.list());
  // And to specify the camera, replace "Camera Name" 
  // in the next line with one from Capture.list()
  // myCapture = new Capture(this, width, height, "Camera Name", 30);
  
  // This code will try to use the last device used
  // by a QuickTime program
  myCapture = new Capture(this, canvasX,canvasY, 30);
  
  
  //video = new Capture(this,canvasX,canvasY,15);
  trackColor = color(255,0,0);
  smooth();
  myCapture.settings();

  smooth();
  stroke(0, 170, 250);
  strokeWeight(1);
  background(255);
  ellipseMode(CENTER);
 
  for (int i = 0; i < boids; i++) {
    ptsX[i] = random(0, canvasX);          // write start pts to arrayX
    ptsY[i] = random(0, canvasY);          // write start pts to arrayY
    posX[i] = ptsX[i];                     // write update positions to arrayX
    posY[i] = ptsY[i];                     // write update positions to arrayY
  }

  
}

void captureEvent(Capture myCapture) {
  myCapture.read();
}

void draw() {
  //image(myCapture, 10, 10);
  
  if (myCapture.available()) {
    myCapture.read();
  } 
  myCapture.loadPixels();
  image(myCapture,0,0);
  //this could be any number it just needs to be height
  float worldRecord = 500;
  int closestX = 0;
  int closestY = 0;

  for (int x= 0; x < myCapture.width; x++) {
    for (int y=0; y < myCapture.height; y++) {
      int loc = x + y*myCapture.width;
      color currentColor = myCapture.pixels[loc];
      float r1,g1,b1,r2,g2,b2;
      r1 = red(currentColor);
      g1 = green(currentColor); 
      b1 = blue(currentColor); 
      r2 = red(trackColor);
      g2 = green(trackColor); 
      b2 = blue(trackColor);
      float d = dist(r1,g1,b1,r2,g2,b2);
      //so if we have a closer colour
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y; 
      }
    }
  } 

  if (worldRecord < 5) {
     background(0);
    fill(trackColor);
    strokeWeight(1);
    stroke(255, 100);
    ellipse(closestX, closestY, 16,16);
    
    // Update the boids' positions
  for (int i = 0; i < boids; i++) {
   
    posX[i] = noise(ptsX[i]) * canvasX;    // update the screen position
    posY[i] = noise(ptsY[i]) * canvasY;    // update the screen position
    ptsX[i] = ptsX[i] + inc;               // update position in perlin noise space
    ptsY[i] = ptsY[i] + inc;               // update position in perlin noise space
  }
  
  // draw the connecting lines
  for (int i = 0; i < boids-1; i++) {
    for (int j = i; j < boids; j++) {
      if (dist(posX[j], posY[j], posX[i], posY[i]) < 50) {
        line(posX[j], posY[j], posX[i], posY[i]);
      }
    }
  }
   
  // draw the boids (draw them last, so they are not masked by lines)
  for (int i = 0; i < boids; i++) {
     int loc = int(posX[i]) + int(posY[i])*myCapture.width;
    color myCol = myCapture.pixels[loc];
    fill(myCol);
    copy(myCapture, int(posX[i]), int(posY[i]), 10, 10,int(posX[i]),int(posY[i]),10,10);
  //  ellipse(posX[i], posY[i], closestX/7, closestY/8);       // insert ellipse or pts
    /*This is where i need to put in the part where the points follow the white
    colour on the screen..and thus the movement...but how!!*/
  }
    
  }
  
  if (worldRecord > 5) {
     background(0);
  fill(255);
  stroke(255, 100);
  strokeWeight(1); 
 
  // Update the boids' positions
  for (int i = 0; i < boids; i++) {
    posX[i] = noise(ptsX[i]) * canvasX;    // update the screen position
    posY[i] = noise(ptsY[i]) * canvasY;    // update the screen position
    ptsX[i] = ptsX[i] + inc;               // update position in perlin noise space
    ptsY[i] = ptsY[i] + inc;               // update position in perlin noise space
  }
 
  // draw the connecting lines
  for (int i = 0; i < boids-1; i++) {
    for (int j = i; j < boids; j++) {
      if (dist(posX[j], posY[j], posX[i], posY[i]) < 50) {
        line(posX[j], posY[j], posX[i], posY[i]);
      }
    }
  }
   
  // draw the boids (draw them last, so they are not masked by lines)
  for (int i = 0; i < boids; i++) {
    ellipse(posX[i], posY[i], 4, 4);       // insert ellipse or pts
  }
  }
  
}

void mousePressed () {
  int loc = mouseX + mouseY*myCapture.width;
  trackColor = myCapture.pixels[loc];
}






