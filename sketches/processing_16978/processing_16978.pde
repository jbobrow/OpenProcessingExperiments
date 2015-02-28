
import shiffman.kinect.*;

// Graphics variables
PImage img;             // Captured color object
PImage dep;             // Captured depth object
color c;                // Color of the captured image 

// Particle variable
ArrayList a_p;          // Array of particles
float r;                // Radius of a particle

void setup()
{
  // Init Kinect
  NativeKinect.init();

  // Init graphics
  size(640,480,P3D);
  img = createImage(640,480,RGB);
  dep = createImage(640,480,RGB);

  // Init coordinates
  //perspective(PI/3,float(width)/float(height),-1000,1000);

  // Init particles
  a_p = new ArrayList();
}

void draw()
{
  // Clear display
  background(0);

  // Kinect date update
  NativeKinect.update();

  img.pixels = NativeKinect.getPixels();
  img.updatePixels();

  dep.pixels = NativeKinect.getDepthMap();
  dep.updatePixels();

  // Image rendering loop  
  for (int i=0; i<640*480; i+=65) //65
  {
    // Set grapics variables
    color c = img.pixels[i];
    float bri = brightness(dep.pixels[i]);
    
    // Render caputured image
    //strokeWeight(bri/32.0);
    stroke(c,128);
    rect(i%640,i/640,bri/32.0,bri/32.0);

    if( bri > 128.0 && (int)random(0,24)%24 == 0)
    {
      PVector pos = new PVector();
      pos.x = i%640;
      pos.y = i/640;
      a_p.add(new Particle(pos, bri/4, c));
    }
  }

  // Loop rendering particle
  for(int i =0; i < a_p.size(); i++)
  {
    Particle p = (Particle) a_p.get(i);
    if (p.life < 0.0)
    {
      a_p.remove(i);
      i--;
    }
    p.render();
    p.update(); 
  }

  // Debug Rendering
  //image(img,0,0,320,240);
  //image(dep,320,0,320,240);

}


