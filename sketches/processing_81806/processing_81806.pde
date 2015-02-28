
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/5582*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/*
This animation was made by Jared "BlueThen" C.
 Made on October 29, 2009, optimized and 'cleaned up' on November 1, 2009; November 6, 2009; December 2, 2009; December 3, 2009.
 www.bluethen.com
 
 press mouse button and drag left or right to spin.
 */

/* Particle Count */
int particleCount = 5000;
/* A particle array is made using our particle count. */
Particle[] particles = new Particle[particleCount+1];
PImage tea;
void setup() 
{
  /* The app is 500 pixels by 500 pixels */
  size(600,600);
  tea = loadImage("tea.png");
  /* 
   The colormode is set to RGB and is within 2 because all the dots are colored according to their angle.
   The angle is passed through cosine, and 1 is added (to make the value positive)
   */
  colorMode(RGB, 2);

  /* frame rate is 30 */
  frameRate(30);
  /* We loop through all of our particles and initialize them */
  for (int x = particleCount; x >= 0; x--) { 
    particles[x] = new Particle();
  }
 
}

void draw()
{

translate(200,400);
  /* Clear the screen for redrawing */
  background(0);
 
  float turn = 0;
  
   
  /* 
   check to see if the user is clicking 
   if the user is, then the turnVelocity is calculated. It's determined by the x (horizontal) distance between the previous and current mouse position
   It's multiplied by 0.00001 to tone down the speed, and in the class itself it's later multiplied by (201 - radius), to have particles closer to center move faster than ones on outside.
   It's done this way to avoid having to recalculate (mouseX - pmouseX) * 0.00001 for every particle.
   */
    
  if (mousePressed) 
    turn = (mouseX - pmouseX) * 0.00001;

  /* Loop through the particles, and update them */
  for (int i = particleCount; i >= 0; i--) { 
    Particle particle = (Particle) particles[i];
    particle.update(turn);
  } 
 translate(-200,-400); 
  image(tea,0,0);
}

class Particle {
  /* 
   Global class variables
   Angle is measured in radians, Radius is the distance each particle is from center, previous is the previous points of the particles for tail drawing, 
   dec is the constant rate of rotation (determined by radius), while turnVelocity is the rate of rotation determined by the user's cursor
   tilt is the tilt of the particle's rotation
   */
  
  float angle;
  float radius;
  PVector previous = new PVector();
  float dec;
  float tilt;
  float turnVelocity;
  Particle() {
    /* 
     This function creates the particle
     Our angle is measured in radians, and because of this, we have a random number between 0.00 and 6.28.
     Note that 6.28, or 2*Pi is about a full circle in radians
     radius is between 70 and 200 pixels from the center, 
     and the tilt is between 60 below to 60 above.  Dec is propotional to the distance from the center  
     */
    angle = random(0,628) * 0.01;
    radius = random(80,200);
    tilt = random(-90,60);
    dec = (200 - radius) * 0.00014;
  }
  void update (float turn) {
    /* 
     This function updates the particle. It is the ultimate formula the particle abides to
     the coordinate uses traditional trigonometric formulas to rotate the particle around the origin.
     Remember that y is up and down.
     */
    PVector current = new PVector(radius * cos(angle), tilt + 20 * cos(angle + 3.5), radius * sin(angle));

    /* 
     Checks to see if turn is done. we make sure it doesn't equal zero because by default it's zero, and so that the turning won't stop suddenly 
     (0 * anything = 0, so it'd instantly stop the turning if the cursor has stopped. we don't want that) 
     */
    if (turn != 0)
      turnVelocity = turn * (201-radius);

    /* The angle is decreased by its regular rotation, and the turnVelocity determined by the user */
    angle -= dec + turnVelocity;
    /* Simulate friction in the turn velocity. */
    turnVelocity *= 0.95;

    /* 
     This sets previous coordinates just for the first frame, to allow the animation to start off a little more cleanly */
    if (previous.x == 0) {
      previous.set(current);
    }

    /* 
     The isoline function is called  
     Isoline takes our (x,y,z) coordinates and renders them as (x,y) coordinates.
     */
    isoLine(current,previous,angle);

    /* Previous coordinates are updated. They're for the next frame, so a trail can be drawn behind each particle. */
    previous.set(current);
  }
}  
void isoLine(PVector begin, PVector end, float angle) {
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
  stroke(1 + cos(angle));

  /* The line is drawn using the newly calculated (x1,y1) and (x2,y2) coordinates */
  line (newBegin.x, newBegin.y, newEnd.x, newEnd.y);
}



