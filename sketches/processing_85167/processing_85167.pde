
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/25784*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
import processing.video.*;
Capture camera; 

float MIN_MASS = 0.4;      // the minimum mass of a particle
float MAX_MASS = 0.8;      // the maximum mass of a particle
int NTHPIXEL = 8;          // to speed things up multiply this with 2, 
                           // only each nth pixel will get into the particle system
int ELLIPSE_W = (int)(NTHPIXEL*0.7);  // ellipse diameter
int MIN_ELLIPSE_W = (int)(NTHPIXEL*0.3);
int MAX_ELLIPSE_W = (int)(NTHPIXEL*1.3);

Particle mouse;            // particle on mouse position
Particle[] particles;      // the moving particle
Particle[] orgParticles;   // original particles - fixed
color[] colors;            // color values from the image
ParticleSystem physics;    // the particle system

PImage reference;                // the original image
int numPixels;             // the number of pixels in the original image
int numPixelsSmall;        // the number of pixels in the scaled-down-version of the image
int widthSmall;            // width of the scaled-down-version of the image
int heightSmall;           // height of the scaled-down-version of the image

void setup() {
  size(640, 480);  
  camera = new Capture(this,640,480,12);
  // Image
  //img = loadImage("5cent.jpg");
  //if(width > 500 || height > 500) resize(400, 0);
  numPixels = camera.width * camera.height;
  widthSmall = camera.width/NTHPIXEL;
  heightSmall = camera.height/NTHPIXEL;
  numPixelsSmall = widthSmall * heightSmall; 
  
  // Processing Setup
  //size(img.width, img.height);
  noStroke();
  ellipseMode(CENTER);
  smooth();

  // Particle System + Detect Colors
  physics = new ParticleSystem(0, 0.05);
  mouse = physics.makeParticle();            // create a particle for the mouse
  mouse.makeFixed();                         // don't let forces move it
  particles = new Particle[numPixelsSmall];
  orgParticles = new Particle[numPixelsSmall];  
  colors = new color[numPixelsSmall];
  camera.loadPixels();
  int a;
  for(int x=0; x<widthSmall; x++) {           // go through all rows
    for(int y=0; y<heightSmall; y++) {        // go through all columns
      a = y*widthSmall+x;
      colors[a] = camera.pixels[y*NTHPIXEL*camera.width+x*NTHPIXEL];
      particles[a] = physics.makeParticle(random(MIN_MASS, MAX_MASS), x*NTHPIXEL, y*NTHPIXEL, 0);
      orgParticles[a] = physics.makeParticle(random(MIN_MASS, MAX_MASS), x*NTHPIXEL, y*NTHPIXEL, 0);
      orgParticles[a].makeFixed();
      // make the moving particles go to their former positions
      physics.makeSpring(particles[a], orgParticles[a], 0.2, 0.1, 0 );
      // make the moving particles get away from the mouse
      physics.makeAttraction(particles[a], mouse, -10000, 0.1);
    }
  }
}

void draw() {
  background(0);
  noStroke();
  println("framerate: " + frameRate);
  
  mouse.position().set(mouseX, mouseY, 0 );
  physics.tick(); 
  int a;
  PVector repelfoece = new PVector();
  float w;
  float posx, posy;
  for (int x=0; x<widthSmall; x++) {
    for(int y=0; y<heightSmall; y++) {
      a = y*widthSmall+x;
      posx = particles[a].position().x();
      posy = particles[a].position().y();
      w = map(dist(posx, posy, mouseX, mouseY), 0, sqrt(width*width + height*height), MIN_ELLIPSE_W, MAX_ELLIPSE_W);
      fill(camera.pixels[y*NTHPIXEL*camera.width+x*NTHPIXEL]);  // fill with the colour on this position from the image
      ellipse(posx, posy, w, w*1.2);
    }
  }
}

void captureEvent(Capture camera){
  camera.read();
}

