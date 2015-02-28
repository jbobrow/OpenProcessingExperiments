
/* A program created by Oscar Hazelaar and Kayla Clark, using the JMyron LIbrary and its movement tracking capabilities.
  It uses footage from an attached webcam to allow the user to move around a sphere on the screen using gestures. Also, depending on
  its location the sphere will change color, and the background tone will change according to the ball's posistions.
  although the program does work, it relies heavy on ideal lighting and what the user is wearing. Further work wil be needed to make this
  program more adaptable*/


//call the JMyron Library and minim library
import JMyron.*;
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

JMyron m;//a camera object
PImage img;
//variables to maintain the floating circle
int objx = 160;
int objy = 120;
int objdestx = 160;
int objdesty = 120;
int loc;

void setup() {
  //part of the program that sets-up the SINE Oscillator
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
  // add the oscillator to the line out
  out.addSignal(sine);
  
  //loads the image used for the color
  loadPixels();
  img = loadImage("spectrum.jpg");
  //set size, and 3d mode
  size(700, 700, P3D);
  frameRate(20);
  m = new JMyron();//make a new instance of the object
  m.start(width,height);//start a capture at 700x700
  m.trackColor(255,255,255,256*3-100);//track white
  m.update();
  m.adaptivity(10);
  m.adapt();// immediately take a snapshot of the background for differencing
  println("Myron " + m.version());
  rectMode(CENTER);
  
  //remove the strokes and the cursor
  noStroke();
  noCursor();
}


void draw() {
  m.update();//update the camera view
  drawCamera();
  background(0);


  int[][] centers = m.globCenters();//get the center points
  //draw all the dots while calculating the average.
  int avX=0;
  int avY=0;
  for(int i=0;i<centers.length;i++) {
    avX += centers[i][0];
    avY += centers[i][1];
  }
  if(centers.length-1>0) {
    avX/=centers.length-1;
    avY/=centers.length-1;
  }

  //update the location of the sphere on the screen.
  if(!(avX==0&&avY==0)&&centers.length>0) {
    objdestx = avX;
    objdesty = avY;
  }
  objx += (objdestx-objx)/10.0f;
  objy += (objdesty-objy)/10.0f;
  
  //using the output from the tracker, call 2 new variables for the location of the shere
  //in the pixel array. Also, the objx and y are constrained to the size of the sketch to prevent 
  // null point exeption errors
  int ballx = objx % width;
  int bally = objy % height;
  loc = ballx + bally * width;
  
  //set the r,g,b values to that of the pixel and objx and objy
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  fill(0,0,0);
  //rectangle to serve as a background
  rect(0,0,700,700);
  //image(img,0,0); // can be uncommmented to view the image, for the purpose of bug fixing
  
  //using the ballx and ball y change the frequency and pan of the tone
  float freq = map(ballx, 0, height, 1500, 60);
  sine.setFreq(freq);
  float pan = map(bally, 0, width, -1, 1);
  sine.setPan(pan);
  
  //set the color for the sphere, then create a simple sight source to make the sphere
  //more interesting
  fill(color(r,g,b));
  //ellipseMode(CENTER);
  //ellipse(objx,objy,200,200);
  lights();
  pushMatrix();
  translate(objx+10, objy+10);
  directionalLight(255,255, 255, -1, 0, 0);
  popMatrix();
  translate(objx+10, objy+10);
  sphere(100);
}

void drawCamera() {
  float R,G,B;
  int[] img = m.differenceImage(); //get the normal image of the camera
  loadPixels();
  for(int i=0;i<width*height;i++) { //loop through all the pixels

    //in order to invert a color value, subtract it from the maximum.
    R = 255-red(img[i]); 
    G = 255-green(img[i]);
    B = 255-blue(img[i]);

    pixels[i] = color(R,G,B); //draw each pixel to the screen
  }
  updatePixels();
}

void mousePressed() {
  m.settings();//click the window to get the settings
}
void keyPressed() {
  m.settings();//click the window to get the settings
}

public void stop() {
  m.stop();//stop the object
  super.stop();
}


