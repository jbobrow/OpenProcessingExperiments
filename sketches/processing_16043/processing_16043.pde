
/*
Orb
original code made by BlueThen
www.bluethen.com

edited by Garrett Baumgartner
gogogarrett.com

*/

boolean colored = false; // whether or not the orb is colored. Press 'z' to toggle this.
int bg = 0; // The color of the background. We start out with 100 (white), but it can be changed to 0 (black) by pressing 'x'.
int particleCount = 200; // Particle count.


Particle[] particles = new Particle[particleCount+1]; // Array of particles
PImage img; // Used for blurring.


void setup () { // Setup, everything is set up before the code actually runs.
  size (1024, 768); // Size of the window.
  colorMode(HSB, 100); // Color mode. We use HSB for if colored == true. This makes it easier to do a rainbow-like orb.
  for (int x = particleCount; x >= 0; x--) { // Loop through the particle array and create a new Particle
    particles[x] = new Particle();
  }
}

void draw () {

  translate(width/2, height/2); // Move the point of origin to the center of the window.
  background(bg); // The screen is cleared, and the background is colored bg (white or black).

  /* Particle rendering */
  zBuffer(particles); // Sort the particles in order so that ones in the back are drawn first, and ones in front overlap them.
  for (int i = particleCount; i >= 0; i--) { // Loop through the particles to draw them.
    Particle particle = (Particle) particles[i];
    if (i == 200) { // We blur the screen at the 200th particle, that way, particles in the back are blurred.
       img = g.get();
       img.loadPixels();
      // fastBlur(img, 2); // Use Mario Klingemann's fastBlur(), because filter(BLUR, n) is way too slow.
       image(img, -width/2,-height/2);
    }
    particle.update(i); // Run update() function found in the Particle class. This recalculates and draws the particle.
  }

}
class Particle { // The particle class, holds all the data and formulas for each particle.
  PVector location; // XYZ coordinates of the particle.
  float distance; // Distance from (0,0,0)
  float theta;    // Angle sideways
  float phi;      // Angle longways

  Particle () { // Particle constructor. This runs every time a new particle is created
    distance = random(width/15,width/5); // The distance is set randomly between 100 and 200
    theta = random(6.28); // The longways angle is randomly set
    phi = random(3.14); // The sideways angle is randomly set

    float DISTANCE_COS_THETA = distance * cos(theta); // Use a variable to hold data for distance * cos(theta), since it's used twice in the algorithm. This is just for sake of speed.
    location = new PVector(DISTANCE_COS_THETA * cos(phi),   // The formula used for calculating the particle's location.
                           distance * sin(theta),           // This simply acts as if the particle is a spot along the sphere, and uses
                           DISTANCE_COS_THETA * sin(phi));  // a formula for converting Spherical Coordinates (rho, phi, theta) to Cartesian Coordinates (x, y, z)
  }
  void update (int number) { // Update the particle. Its number is used as a parameter to tell how far it is from the camera in relation to the other particles.
    phi += (250 - distance) * 0.00009; // Increase the phi (sideways angle) according to its distance from the center. Particles farther out are faster.
    theta += (250 - distance) * 0.000035;

    float DISTANCE_COS_THETA = distance * cos(theta);
    location = new PVector(DISTANCE_COS_THETA * cos(phi),
                           distance * sin(theta),
                           DISTANCE_COS_THETA * sin(phi)); // Same as in the Particle constructor

    if (colored) { // If boolean colored is true, we color the particles different hues, according to their angle from the center.
      float angle = atan2(location.z, location.x); // Calculate the particle's angle from the center.
      stroke(50 * (1 + cos(angle)), 100, (550 - number) * 0.2); // The stroke and fill colors are determined by the angle, and the brightness is determined by their distance from the camera
      fill(50 * (1 + cos(angle)), 100, (550 - number) * 0.2);
    }
    else { // boolean colored is false
      //stroke((550 - number) * 0.08); // The particle is gray, so we use its distance from the center for all values (hue, saturation, and brightness)
      float orbHue = map(mouseX, 0, width, 0, 100);
      float orbSaturation = map(mouseY, height, 0, 50, 550);

      float angle = atan2(location.z, location.x);
      stroke(50 * (1 + sin(angle)));
      strokeWeight(1);
      fill(orbHue, (orbSaturation - number) * 0.25, 50 * (1 + sin(angle)));
    }
    ellipse (location.x/2, location.y/2, (1600- (this.added() + 1000)) * 0.07, (1600- (this.added() + 1000)) * 0.07); // Draw the particle.
 ellipse (location.x*2, location.y*2, (1600- (this.added() + 1000)) * 0.07, (1600- (this.added() + 1000)) * 0.07); 

    // Display colored rect at cursor coords
    fill(map(mouseX, 0, width, 0, 100), map(mouseY, height, 0, 0, 100), 60);                                                                                                            // It takes into account the distance of the particle from the camera
    rect((mouseX - width/2)-12, (mouseY - height/2)-12, 25, 25);                                                                                                              // So particles farther are smaller.
                                                                                                                  // This, along with the spherical calculation and xyz sorting, creates the 3D effect
  }
  float added () {
    return location.y + location.z + location.x; // Calculate their distance from the camera by adding all the coordinate values.
  }
}

// For zBuffering. This sorts the particle array so the particles in front are rendered last, and they can overlap particles in the back.
Particle[] zBuffer (Particle[] particles) {
  Arrays.sort(particles, new ZComparator());
  return particles;
}
//Comparator for sorting objects
class ZComparator implements Comparator {
  int compare(Object o1, Object o2) {
    Float item1 = ((Particle) o1).added();
    Float item2 = ((Particle) o2).added();
    return item1.compareTo(item2);
  }
}

