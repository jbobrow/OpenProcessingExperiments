
/*
Explode was created by Jared "BlueThen" C.
Made on October 27, 2009, revised and commented on November 2, 2009; November 6, 2009; December 1, 2009; December 2, 2009; December 4, 2009.
www.bluethen.com
*/
/* particle count is set here. */
int particleCount = 10000;
/* A global particle array is made using the particle count. */
Particle[] particles = new Particle[particleCount+1];
/* Initialization */
void setup() 
{
  /* Window/App size */
  size(500,500);
  
  /* 
  The color is judged by the x position of the particles.
  Since the particles range in between roughly -300 and 300, we can set the max color to 600, and only need to add 300 to the particles to make them positive.
  */
  colorMode(RGB, 600);
  
  /* Frame Rate */
  frameRate(30);
  
  /* Create the particles */
  for (int x = particleCount; x >= 0; x--) { 
    particles[x] = new Particle();
  }
}

void draw()
{
  /* Move the point of origin to (0,0) for rendering ease */
  translate(width/2, height/2);
  
  /* Clear the background */
  background(0);
  
  /* Loop through the particles and update them. */
  for (int i = particleCount; i >= 0; i--) { 
    Particle particle = (Particle) particles[i];
    particle.update();
  }  
}

class Particle {
  /* Global class variables used for each particle. */
  
  /* 
  Normally, (x,y,z) are all determined in the Particle() class function, but since they'll have the same parameter for every particle,
  it is unnecessary and inefficient to set them for each particle individually.
  (px,py,pz) stand for the previous coordinates. They're used for drawing tails.
  */
  PVector current = new PVector(0, height/4, 0);
  PVector previous = current.get();
  
  /* 
  The particles movements are done in spherical coordinates.
  This pretty much means that they're calculated in angles and distances rather than cartesian coordinates. 
  They're converted to cartesian coordinates in the end, so Java can render it.

  Spherical coordinates are measured by rho, phi, and theta.
  Here I substitute rho with speed, but they're essentially the same thing. Rho is the distance away from the center a spherical coordinate is.
  The phi is pretty much the latitude, the coordinate position along the vertical axis (y)
  Theta is the longitude, it's the coordinate along the side of the sphere. (x,z) 
  */
  float speed;
  float phi;
  float theta;
  
  /* Gravity, or y velocity downwards */
  float gravity = 0;
  /* Here is our particle function. We call this every time we want to create a particle. */
  Particle() {
    /* 
    Our rho (speed), phi, and theta are completely random.
    Theta is 360 degrees because all the circle all the way around the side is measured,
    however, phi is only 180 because we only need to move particles between the top and bottom of our sphere 
    */
    theta = random(0,628) * 0.01;
    phi = random(0,314) * 0.01;
    speed = random(1,40);
    PVector current = new PVector(0,0,0);
  }
  
  /* We call this function every time we want to update the particle coordinates and draw them. */
  void update() {
    /* previous coordinates are updated before we update the current coordinates */
    previous = current.get();
    
    /* A variable for the cosine of theta multiplied by the speed is set because it is used more than once in the main formula. */
    float sctheta = speed * cos(theta);
    
    /*
    This is the main formula for our particles.
    
    x += speed * cos(theta) * cos(phi) - 0.035 * z
    y += speed * sin(theta) - gravity
    z += speed * cos(theta) * sin(phi) + 0.035 * x
    
    There are 2 parts of these formulas, but combined. First is the spherical calculation:
      remember that speed is used for the rho of a sphere (distance or radius), phi is the latitude, and theta is the longitude
      Since we're calculating our particles movements as opposed to simply x velocity, y velocity, etc, the particles are spread
      in even directions. If we were to base this on decreasing (x,y,z) velocity, the particles would start out in the shape of a
      cube.
    Then the rotational formula:
      Here is where the particles do their slight rotation around the center.
      It is based on the formula for polygon rotation 
        x = cos(angle) * x - sin(angle) * z
        z = sin(angle) * x + cos(angle) * z
      Our angle of rotation roughly 0.0349 radians (or about 2 degrees). So when we plug in our values, we get
        x = cos(0.0349) * x - sin(0.0349) * z
        z = sin(0.0349) * x + cos(0.0349) * z
      cos(0.0349) is about 0.999391, which can be rounded to 1
      sin(0.0349) is about 0.034893, which can be rounded to 0.035
      now our formula is simplified to  
        x = x - 0.035 * z
        z = 0.035 * x + z (or z + 0.035 * x reordered)
      Since x is simply 0.035 * z subtracted from x, and z is 0.035 * x added to z, we can add these within the formula
    */
    PVector next = new PVector(sctheta * cos(phi) - 0.035 * current.z, speed * sin(theta) - gravity, sctheta * sin(phi) + 0.035 * current.x);
    current.add(next);


    /* Add to the downwards y velocity of the particle, and decrease the speed by about 2%. This simulates gravity and friction */
    gravity += 0.3;
    speed *= 0.98;
    
    /* The particle is rendered in isometric, and drawn */
    isoLine(current,previous);
  }
}  
void isoLine(PVector begin, PVector end) {
  /* 
  Isoline Function (begin coordinate, end coordinate,angle)
  both begin coordinates and end coordinates are calculated using the same isometric formula.
  these formulas have been simplified though
  they were formerly ((x - z) * cos(radians(30)) + width/2, (x + z) * sin(radians(30)) - y + height/2)
  The function pretty much adjusts each x and z coordinate to be 30 degrees from the x axis, giving the illusion of 3D
  
  The cosine and sine are constant, so they could be precalculated. Cosine of 30 degrees returns roughly 0.866, which is rounded to 1
  Leaving it out would be seemless, unless placed side-by-side to more accurate renderings, where everything would appear wider in this version
  */
  PVector newBegin = new PVector(int(begin.x - begin.z), int((begin.x + begin.z)/2 - begin.y));
  PVector newEnd = new PVector(int(end.x - end.z), int((end.x + end.z)/2 - end.y));
  
  /* 
  The angle is only used to calculate the shade of each particle 
  Since the RGB mode is set so that the color values are in between 0 and 2, and since the cosine + 1 is between 1 and 2, no multiplying is necessary.
  */
  stroke(begin.x + 300);
  
  /* The line is drawn using the newly calculated (x1,y1) and (x2,y2) coordinates */
  line (newBegin.x, newBegin.y, newEnd.x, newEnd.y);
}

/* Restart the animation after keypress */
void keyPressed() {
  /* We run through the particle loop and replace each particle with a new one. */
  for (int x = particleCount; x >= 0; x--) { 
    particles[x] = new Particle();
  }
}

