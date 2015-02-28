
//import processing.opengl.*;

static final int SLICES = 10; 

float rotationY = 0.0;
float rotationX = 0.0;


PImage[] noises = new PImage[SLICES];

float increment = 0.03;
// The noise function's 3rd argument, a global variable that increments once per cycle
float zoff = 0.05;  
// We will increment zoff differently than xoff and yoff
float zincrement = 0.08; 

float depthIncrement = 5.0;

float camDepth = 0.0;


void setup() {
  size(256,256,P3D);
  noLoop();
  hint(DISABLE_DEPTH_TEST);
  colorMode(RGB,1.0);
  
  // Optional: adjust noise detail here
  // noiseDetail(8,0.65f); 
  
  // create images objects
  for (int i=0; i < SLICES; i++)
  {
    noises[i] = createImage(height/2,height/2,ARGB);
    loadNoiseImage(noises[i]);
    
    zoff += zincrement; // Increment zoff
  }
  
  
}

void draw() {
  background(0);
  smooth();
  imageMode(CENTER);
  
  pushMatrix();

  translate(width/2, height/2);
  rotateY(rotationY);
//  rotateX(rotationX);
  translate(-width/2, -height/2);
  
  translate(0,0,camDepth);
  
  translate(0,0,SLICES*depthIncrement);
  
   // create images objects
  for (int i=0; i < SLICES; i++)
  {
    translate(0,0,-depthIncrement);
    image(noises[i], width/2, height/2, width, height); 
  }

  popMatrix();

}


void mouseDragged()
{
  if (mousePressed)
  {
    rotationX = 0.5*HALF_PI*(height/2 - mouseY)/height;
    rotationY = 0.5*HALF_PI*(width/2 - mouseX)/width;
    
    camDepth = constrain(2*(SLICES-1)*depthIncrement*mouseY/(float)height, 0.0, 2*(SLICES-1)*depthIncrement);
    
    redraw();
  }
}


void loadNoiseImage(PImage img)
{
  float xoff = 0.0; // Start xoff at 0
  img.loadPixels();
  
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < img.width; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < img.height; y++) {
      yoff += increment; // Increment yoff
      
      // Calculate noise
      float bright = noise(xoff,yoff,zoff);

      // Try using this line instead
      //float bright = random(0,255);
      
      // Set each pixel onscreen to a grayscale value
      img.pixels[x+y*img.width] = color(bright,bright,bright,bright*bright*bright);
    }
  }
  img.updatePixels();
}    


