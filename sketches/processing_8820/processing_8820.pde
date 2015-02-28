
/*
  Straggle
  Made by Jared "BlueThen" C.
  Written April 2nd, 2010
  Refined, optimized, and commented little by little up to April 11th, 2010
  www.bluethen.com
*/
/* Global Variables and Objects */
/* Things that will be used throughout multiple functions will be set here */
int particleCount = 100; // How many different directions do we want the lines to be going (minus one)
Particle[] particles = new Particle[particleCount+1]; // Initializes a static array using the particleCount
int maxLines = 7000; // Maximum amount of lines, to keep the code from getting too laggy.
float angle = 1.57; // Our initial angle in radians. 2pi is a complete circle (roughly 6.28, or 360 degrees). 1.57 is 0.5pi, or 90 degrees
Canvas canvas = new Canvas(); // The canvas class is where the coords for our lines are stored, so they can be re-rendered each frame
int col = 30; // The initial hue for all the lines. All the lines that are created at a time have roughly the same hue (within 1%)
/* Setup */
/* All the stuff that needs to be set before the animation is started is set here */
void setup () {
  size(500,500); // The window size
  colorMode(HSB,100); // colorMode, either RGB (red, green, and blue) or HSB (hue, saturation, brightness). We choose HSB since it involves hue. 
                      // The second parameter is the range, and we use 100 since it's easier understood as a percentage
  for (int i = particleCount; i >= 0; i--) { // Loop through the particles to initialize each properly.
    particles[i] = new Particle();
  }
  frameRate(30); // The desired frameRate is 30
}
/* Draw */
/* This is the stuff that gets done every single frame.  */
void draw () {
  translate(width/2,height/2); // Move the center of origin towards the center of the window. This just makes it convenient for some of our formulas
  background(0); // The background is set to "0", or black. Using a single 0 is the same as (0,0,0), and with the hue, saturation, and brightness set to 0, it's black.
  angle -= 0.01; // The angle is decreased by 0.01, or 0.57... degrees. 
  if (canvas.lines.size() < maxLines) { // This if statement checks if the line count is lower than the maximum. We do this to prevent the program from adding too many lines, resulting in bad lag.
    col += 0.7; // col (that global variable we initialized in the beginning of the code), or the hue, increased
    if (col > 99) { col = 0; } // Since anything about 100% or above hue is red, we need to reset it every time it approaches 100%
    for (int i = particleCount; i >= 0; i--) { // Loop through all the particles for updating them
      Particle particle = (Particle) particles[i]; // This may look confusing since it's pretty much the word "Particle" 4 times in a row
                                                   // It's pretty much creating an object (named particle, case sensitive), that's using 
                                                   // the Particle class (also case sensitive). The particles[i] is the array that we used to store all of the objects
      particle.update(); // Call the update function from within the Particle class, which is done right after draw() ends
    }  
  }
  canvas.draw(); // Calls the draw function on our Canvas.
}
/* Particle Class */
/* This holds info and functions pertaining to each line's vectors */
class Particle {
  /* Variables and objects initialized here can be used throughout Particle's functions */
  PVector current = new PVector(); // The particle's current position
  float speed; // Speed of the particle
  float phi;   // Phi is angle up and down the particle is heading
  float theta; // Theta is the angle left and right the particle is moving
  boolean far = false; // far tells whether or not to update the particle when asked to. It's toggled when the particle wanders too far from the origin, and it's used to conserve resources
  /* Here is our particle constructor. We call this every time we want to create a particle. */
  Particle() {
    theta = random(0,6.28); // Theta is the latitude equivalent angle of the particle's direction
    phi = random(0,3.14);   // Phi is the longitude equivalent angle of the particle's direction
    speed = random(2,7);    // Speed is the radius equivalent 
      // If we graphed a point using theta, phi, and speed (as radius), we would have our next point for the particle in relation to it's current position
      // The position is calculated this way (using angles) to keep the directions a little more consistent
      // If you were to graph a million random points using random(-1000,1000) for x, y, and z separately, you'll get a cube.
      // However, if you use a spherical coordinate formula, you'll get a sphere, obviously.  
  }
  /* Particle's Update Function */
  /* Called from inside draw(), this finds the next point of the particle (using our phi, theta, and speed), and adds it to the canvas */
  void update() {
    if (!far) { // The far boolean tells whether or not the particle has crossed the outter-most boundary, and we stop drawing once the particle passes this.
      if (dist(current.x,current.y,current.z, 0,0,0) < 250) { // If the distance from the origin to the particle is under 250.
        phi += random(-0.05, 0.2);  // Phi is randomly increased/decreased. It's not equal in both directions to give the particle a tendency of following a spiral path.
        theta += random(-0.3, 0.3); // Theta is randomly increased/decreased
        PVector previous = current.get(); // Update the previous coordinate before updating the current.
        float sctheta = speed * cos(theta); // A temporary variable used to do a part of the calculating done in the next line. It's done this way to try and cut down on resources  
        current.add(new PVector(sctheta * cos(phi) - 0.035 * current.z, 
                                speed * sin(theta), 
                                sctheta * sin(phi) + 0.035 * current.x)); // The formula here is a combination of polygon rotation and spherical coordinates. 
                                                                          // It's described in depth in Explosion.
        canvas.addLine(new Line(current,previous)); // Adds a line using the 2 coordinates (current and previous) to the canvas. 
      }
      else {
        far = true; // If the particle goes beyond our boundary, we set this to true. This is to avoid having to reuse dist, since dist involves squaring and square-rooting, which is resource intensive.
      }
    }
  }
} 
/* The Line Class */
/* Line segment information is stored here. It keeps track of the line's hue,  */
class Line { 
  /* Previous XYZ points, these are the XYZ points set outside the script. */
  PVector preA  = new PVector();  
  PVector preB  = new PVector();
  /* Computed XYZ points, these are the XYZ points rotated and scaled for the set perspective */
  PVector postA = new PVector();  
  PVector postB = new PVector();
  float lineHue; // Line hue
  float lineBrightness; // Line brightness
  /* Constructor */
  /* When a new Line is created, we set all the line's info here. */
  Line (PVector point1, PVector point2) {
    /* Use the parameters to set the new points */
    preA.set(point1);
    preB.set(point2);
    lineHue = int(col + random(-3,3)); // Since each line hue is independent, we need to keep track of it here.
                                       // col is a global variable being increased each frame. We use col so other lines created on this frame has similar hue.
    lineBrightness = 125 - dist((preA.x + preB.x) / 2,(preA.y + preB.y) / 2,(preA.z + preB.z) / 2, 0,0,0) * 0.5; // We keep track of the line's brightness to save resources.
                                                                                                                 // Each line's brightness depends on its distance from the center
  }
  /* Line's Draw Function */
  /* Whenever we want to draw the line, we call this. */
  void draw () {
    /* Rotation Formula */
    /* We set the post variables so we can compute their new positions. */
    postA.set(preA);
    postB.set(preB);
    /* rotateVector function simply rotates the PVector around the origin. The function is right after Line Class ends. */
    rotateVector(postA, angle, angle * 0.7);
    rotateVector(postB, angle, angle * 0.7);
    /* We scale the coordinates, this zooms the camera in and out from the center. */
    postA.mult(1.8 + cos(angle * 2));
    postB.mult(1.8 + cos(angle * 2));
    /* New PVectors are created. This formula finds the final XY position to plot the points. */
    PVector temp1 = new PVector(int(postA.x - postA.z), int((postA.x + postA.z)/2 - postA.y));
    PVector temp2 = new PVector(int(postB.x - postB.z), int((postB.x + postB.z)/2 - postB.y));
    stroke(lineHue, 100, lineBrightness); // Set the stroke color using the lineHue and lineBrightness variable, and saturation is always 100.
    line(temp1.x, temp1.y, temp2.x, temp2.y); // Draw the line. onto the screen.
    lineHue -= 0.8; // Change the line's hue, for the next frame
    if (lineHue < 1) { // If the line's hue is approaching 0, we change it back to 100 so it can continue to change.
      lineHue = 100; 
    }
  }
  /* Added Function */
  /* This function adds up all the post x, y, and z coordinates of the line. Compared with other lines, this should show how each coordinate should be ordered in, 
      and used to keep lines in the back from overlapping lines in the front */
  float added () {
    return postA.x + postA.y + postA.z + postB.x + postB.y + postB.z;
  }
}
/* Vector Rotation Function */
/* Used in Line Class for rotating our coordinates around the origin. */
void rotateVector(PVector coord, float xzAngle, float yzAngle) { // xzAngle is angle around the y axis, and yzAngle is angle around the x axis. There is no z axis rotation.
  /* Calculate the cosine and sine stuff first, since they're used more than once (saving resources!) */
  float c = cos(xzAngle);
  float s = sin(xzAngle);
  coord.set(c * coord.x - s * coord.z, coord.y, s * coord.x + c * coord.z); // Rotate the coordinate
  /* Recalculate cosine and sine for the x-axis rotation. */
  c = cos(yzAngle);
  s = sin(yzAngle);
  coord.set(coord.x, c * coord.y - s * coord.z, s * coord.y + c * coord.z); // Rotate the coordinate
}
/* Canvas Class */
/* We keep track of the lines in here. The Canvas Class just holds all the coordinate data, and provides a function for drawing everything. */
class Canvas {
  Vector lines = new Vector(); // Collection of lines. 
  Canvas () { } // Canvas constructor. Canvas takes no parameters to create.
  /* Add Line */
  void addLine (Line a) { 
    lines.addElement(a); // Add the line to the Vector.
  }
  /* Draw Function */
  void draw () {
    if (frameCount%30 == 0) { // We re-sort the lines every 30 frames to conserve on space. Since it's not really rotating that fast, we don't need to re-sort every frame.
      lines = zBuffer(lines);  
    }
    for (int i = (lines.size() - 1); i >= 0; i--) { // Loop through the lines and draw them
      ((Line) lines.get(i)).draw(); 
    }
    // if (frameCount%60 == 0)
    //   println(lines.size() + " lines and " + frameRate + " fps"); // This prints in the console how many lines there are and what the Frame Rate is every 60 frames.
  }
}
/* zBuffer */
/* For zBuffering. This sorts the particle array so the particles in front are rendered last, and they can overlap particles in the back. */
Vector zBuffer (Vector lines) {
  Collections.sort(lines, new ZComparator()); // Sort using ZComparator Class
  return lines;
}
/* ZComparator */
/* This really compares each line's added x, y, and z values, rather than just z. */
class ZComparator implements Comparator {
  int compare(Object o1, Object o2) {
    /* Uses the added function in the Line Class for comparing. */
    Float item1 = ((Line) o1).added();
    Float item2 = ((Line) o2).added();
    return item1.compareTo(item2);
  }
}
/* keyPressed Function */
/* Triggers whenever the user presses a key. We clear the Canvas and reset all the Particles here. */
void keyPressed() {
  canvas = new Canvas(); // Reset the Canvas
  /* Run through the particle loop and replace each particle with a new one. */
  for (int x = particleCount; x >= 0; x--) { 
    particles[x] = new Particle();
  }
}

