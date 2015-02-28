
/**
 Harmonic oscillations are everywhere. In this example, we take
 the simple sine wave and turn it into something a bit more...
 organic. 
 
 Each tentacle is just a sine wave that has had its amplitude adjusted
 based on distance from the base, and a slightly different drawing style
 applied.
 
 Throwing the code into a class allows us to create an arbitrary number
 of eldritch horrors.
 
 C. Andrews
 2014-01-27
 **/

// an array of tentacles
Tentacle[] tentacles;

void setup() {
  size(600, 600); 
  noFill();

  // create the tentacle array and fill it up
  tentacles = new Tentacle[10];

  for (int i = 0; i < tentacles.length; i++) {
    tentacles[i] = new Tentacle();
  }
}


void draw() {
  background(0);
  stroke(255);

  // iterate through the tentacles and draw them
  for (Tentacle tentacle: tentacles) {
    tentacle.paint();
  }
}

/**
 The tentacle class is bundling up all of the actual hard work.
 
 Each one has a characteristic position, frequency and base amplitude
 (all randomly determined). By varying the phase shift of the angle,
 the tentacle appears to writhe.
 */


class Tentacle {
  float phi;
  int numPoints;
  PVector position;
  float frequency;
  float amplitude;

  /**
   Randomly initialize the initial phase shift, the frequency, 
   base amplitude, length and position.
   **/
  Tentacle() {
    phi = random(TWO_PI);
    frequency =random(30, 100);
    amplitude = random(.1, .9);
    numPoints = (int)random(50, 125);
    position = new PVector(random(200, width-200), 0);
  }

  /**
   Draw the tentacle. 
   **/
  void paint() {

    // using push and pop allows us to move the tentacle into place
    // and not worry about offset from the origin
    pushMatrix();
    translate(position.x, position.y);

    float x, y;
    // draw the segments of the tentacle
    for (int i = -10; i < numPoints; i++) {
      y = 4*i;
      // note how i is multiplied into the amplitude so that
      //the motion becomes greater the farther we get from the base
      x = sin(y/frequency + phi)*i*amplitude;

      // rather than draw a line, we put a circle at each point,
      // with the diameter determined by location
      float diameter = map(i, 0, numPoints, 30, 4);
      ellipse(x, y, diameter, diameter);
    }
    // increment the phase shift
    phi -= .05;
    popMatrix();
  }
}



