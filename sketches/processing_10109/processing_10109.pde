
/*  
Vortex 
Made by BlueThen on May 28, 2010, and further refined on May 31, 2010.
Click and drag to interact.
www.bluethen.com
*/

/* Global variables */
int particleCount = 10000;
float halfWidth; // we can't set the halfWidth or halfHeight here since the size isn't set
float halfHeight;
float angle = 0; // The perspective the canvas is being viewed at
Particle [] dust = new Particle[particleCount+1]; // Our array of particles

/* Setup */
// Called only once, before anything else is called
void setup () {
  size(550,450,P3D); // P3D is actually really fast, but with some visual artifacts.
  halfWidth = width/2;
  halfHeight = height/2;
  colorMode(HSB,100); // Color will be set by hue, saturation, and brightness, and it will be set by 0-100.
  for (int i = particleCount; i >= 0; i--) { // Loop through every particle so we can initialize them.
     float tempAngle = random(2 * PI); // Decide the angle the particle is placed here
     float tempDist = random(150); // The distance from the center the particle is placed at
     dust[i] = new Particle(
         new PVector(
             tempDist * cos(tempAngle), // position on x axis
             -70, // how high
             tempDist * sin(tempAngle) // position on z axis
             )
         );
 
  }
}

/* Draw */
// This is called every frame.
void draw () {
  translate(halfWidth, halfHeight); // Move the origin to the middle, this makes it pretty convenient in some of our calculating.
  background(0); // color the background black.
  angle = mouseX * 0.005; // the angle of perspective, set by mouseX.
  
  PVector p1 = new PVector(-151,-70,-151); // The coordinate of each corner of our box.
  PVector p2 = new PVector(-151,-70,151);
  PVector p3 = new PVector(151,-70,151);
  PVector p4 = new PVector(151,-70,-151);
  p1.set(render(p1)); // find the 2D coordinates from each 3D coordinate.
  p2.set(render(p2));
  p3.set(render(p3));
  p4.set(render(p4));
  stroke(100); // Set the stroke color to white (the following lines will be drawn white)
  line(p1.x,p1.y,p2.x,p2.y); // Display our box
  line(p2.x,p2.y,p3.x,p3.y);
  line(p3.x,p3.y,p4.x,p4.y);
  line(p4.x,p4.y,p1.x,p1.y);
  
  for (int i = particleCount; i >= 0; i--) { // Loop through each particle and update it.
     dust[i].update();
  }
}

/* Particle Class */
// All of our particle calculating, formulas, and variables are stored and done here.
// This class is for one particle, but used particleCount times in an array.
class Particle {
  /* Particle Variables */
  // All of these need to be kept track of for every iteration.
  PVector position = new PVector(); // 3D coordinate of the particle's position.
  PVector velocity = new PVector(0,0,0); // Not the coordinate, but the speed and direction the particle is traveling along each axis.
  PVector last = new PVector(); // The paritcle's last position, used for drawing the other end of the line.
  
  /* Particle Constructor */
  Particle (PVector positionP) {
    position.set(positionP);
    last.set(position); 
  }
  
  /* Particle Updating */
  // Where all the calculating and what-nots are done for each particle.
  void update () {
    if (mousePressed) { // Check to see if the user is clicking
      PVector reversed = new PVector((mouseX - halfWidth)/2 + mouseY-70 - halfHeight,  
                                     0,
                                     (halfWidth - mouseX)/2 + mouseY-70 - halfHeight); // A 'special' formula used for reverse rendering the cursor position.
      reversed = rotateVector(reversed, -1 * angle); // Rotate the reversed cursor coordinate to match our perspective.
      float distance = dist(reversed.x, reversed.y-70, reversed.z, position.x, position.y, position.z); // The distance between the cursor and the particle.
      if (distance < 65) { // 65 is the radius of particles affected by the user clicking.
        float angleXZ = atan2(reversed.z-position.z, reversed.x-position.x); // The angle between the cursor and the particle
        velocity.add(0.014 * (65 - distance + 25 * noise(angleXZ * 3, distance * 0.1)) * cos(angleXZ + (0.7 + 0.0005 * (65 - distance))),
                     0.03 * (65 - distance + 25 * noise(angleXZ * 3, distance * 0.1)),      
                     0.014 * (65 - distance + 25 * noise(angleXZ * 3, distance * 0.1)) * sin(angleXZ + (0.7 + 0.0005 * (65 - distance)))); // Increase the velocity, according to how far the particle is from the cursor.
        }
    }
    velocity.y -= 0.3; // Gravity
    
    // All these check to see if the particle is outside our boundaries, and if so, change accordingly.
    if (velocity.y < -0.1 && velocity.y > -1 && position.y < -68) velocity.y = 0;
    if (position.y < -70) {
      position.y = -70;
     velocity.y *= -0.7;
    }
    if (position.x > 150) {
      velocity.x *= -1; 
      position.x = 149;
    }
    if (position.x < -150) {
      velocity.x *= -1; 
      position.x = -149;
    }
    if (position.z > 150) {
      velocity.z *= -1; 
      position.z = 149;
    }
    if (position.z < -150) {
      velocity.z *= -1; 
      position.z = -149;
    }
    position.add(velocity); // Add the velocity to the particle's position.
    velocity.mult(0.97); // Simulate friction by multiplying velocity by 0.97.
 
    PVector rendered = render(position); // Render the particle, as in, find the 2D position from the 3D position. Render is actually a function in this script, right after the Particle Class.
    float pDist = dist(100 * cos(2*PI - angle),-70,100 * sin(2*PI - angle), position.x, position.y, position.z); // Distance from our light source. The 2*PI - angle part is us reversing the perspective, so the light source stays in the same place.
    stroke(60 + (velocity.x+velocity.y+velocity.z)*6, 
           40 + pDist * 0.7, 
           130 - pDist * 0.5); // The color of the particle. Determined by it's velocity and your perspective (angle)
    last.set(render(last)); // Render the last coordinate for the tail.
    line(int(rendered.x),int(rendered.y),int(last.x),int(last.y)); // Use integers, because Processing can't draw a pixel accurately at (0.7,0.3)
    last.set(position); // Reset last to the current position, for the next frame.
  }
}

/* Render */
// Takes our 3D coordinate and makes it 2D for displaying!
PVector render (PVector initial) {
  PVector rotated = rotateVector(initial, angle); // Rotate the coordinate so it fits our perspective.
  PVector finalPoint = new PVector(rotated.x - rotated.z,
                                   (rotated.x + rotated.z)/2 - rotated.y); // A watered down version of an isometric tile coordinate formula.
  return finalPoint;
}

/* Vector Rotation */
// For rotating things to the correct position
PVector rotateVector(PVector coord, float xzAngle) { // Position around the Y axis. Imagine a merry-go-round and the center is the Y axis
  float c = cos(xzAngle); // use temporary variables for calculating cosine and sine, since these are used more than once and it's a good idea to save resources
  float s = sin(xzAngle);
  PVector tempCoord = new PVector(c * coord.x - s * coord.z, coord.y, s * coord.x + c * coord.z); // Rotate the coordinate
  return tempCoord; // Return the coordinate.
}

