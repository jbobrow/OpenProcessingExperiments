
import processing.video.*;

Droplet[] droplets = new Droplet[350];

//declare a variable of the Capture class
Capture cam;

void setup() 
{
  size(320,240);
  smooth();

  //initiate array of droplets
 
  for (int i=0; i<droplets.length; i++) {
    droplets[i] = new Droplet();
  }

  //create instance and start camera
  cam = new Capture(this,320,240);
  cam.start();
}

void draw()
{
  background(0);
  
  //fill in the pixel array
  loadPixels();
  
  //fill in the pixel array from the camera
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
  }

  //define p for pixel position
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      int p = x+y*width;
      //define c as the color at a particular pixel
      color c=color(cam.pixels[p]);

      for (int i=0; i<droplets.length; i++) {
        //float the distance from the center of a droplet
        float d = dist(x, y, droplets[i].x, droplets[i].y);
        //pixels inside the droplets are colored by the camera pixels
        if (d<droplets[i].r) {
          pixels[p]=c;
        }
      }
    }
  } 
  //update the camera's and canvas's pixels
  cam.updatePixels();
  updatePixels();

  //draw and update droplets
  for (int i=0; i<droplets.length; i++) droplets[i].draw();
  for (int i=0; i<droplets.length; i++) droplets[i].update();
}

class Droplet {
  float x, y;    //  position
  float vx, vy;  // velocity
  float timer;   // time left before estinguishing
  float dt;  // estinguishing speed
  float g = 0.04; // gravity
  float r = random(1,5);   // radius
  boolean on=false;

  Droplet() { }

  void initialize()
  {
    on = true;
    x = random(width); 
    y = random(-height, -5);
    //give random vertical velocity to make sure there are always droplets throughout the canvas
    vy = random(-2, 2);
    vx=0;
    timer = height*2;
  }



  void draw() {    
    if (!on) return;
  }

  void update()
  {
    // initialize if necessary 
    if (!on) {
      initialize(); 
      return;
    }

    //gravity
    vy += g;
    y += vy;

    dt = vy;    //decay depends on vertical velocity so that droplets don't disappear while on canvas
    timer -= dt;    // decay the transparency


    //turn of droplets after they reach the bottom and timer runs out
    if (timer < 0) {
      on = false;
    }
  }
}



