


// vars
// img size
int WIDTH   = 972, 
HEIGHT  = 1184, 
// controls how many particles will be drawn in each stroke
MAX_AGE = 1000, 
// controls how much it turns
STEPS = 1000, 
// various particle vars
STROKE = -1, 
OPACITY = 75;
color FILL = #FFFFFF, 
BACKGROUND = #000000;
float SMOOTHNESS = .0005;

PVector[] DIRECTIONS;
int[][] INDICES;
// particle arrays
ArrayList<Particle> particles, 
blackParticles;
// max number of particles
int numOfParticles = 318;
// boolean for when particles are maxed
boolean particlesDone = false;

// image1
PImage base;
// image2
PImage colorSource;
// image names
String img1 = "GeorgeWashington.jpg", 
img2 = "Hercules.jpg";
// number of cycles the animation has gone through
int cycles = 1;

void setup() {
  // setup
  randomSeed(0);
  frameRate(30);
  size(800, 800);
  // set our fill
  fill(FILL, OPACITY);
  // no stroke
  noStroke();
  // set our background color
  background(BACKGROUND);

  //Lookup table to store the indices associated with the vector field, INDICES is as big as our canvas
  INDICES = new int[WIDTH][HEIGHT];
  // nested for loop go through canvas and set INDICES to be an int that is our noise
  for (int y = 0; y < HEIGHT; y++) for (int x = 0; x < WIDTH; x++) INDICES[x][y] = int(noise(x*SMOOTHNESS, y*SMOOTHNESS)*STEPS); 

  //Lookup table to store the directions associated with the vector field
  DIRECTIONS = new PVector[STEPS];
  // adjust pvector values to adjust particle flow
  for (int i = 0; i < STEPS; i++) DIRECTIONS[i] = new PVector(cos(i*.5)*.5, sin(i*.5)*.5);  

  //Particles
  particles = new ArrayList<Particle>();
  blackParticles = new ArrayList<Particle>();

  //Base picture
  base= loadImage(img1);
  //Color source picture
  colorSource = loadImage(img2);
}

void draw() {
  // set fill for bg
  fill(0, 0, 0, 0);
  // draw a background rect, to make it animate essentially
  rect(0, 0, width, height);
  //Draw when dragging
  //if (mousePressed) particles.add(new Particle(mouseX, mouseY));
  println(particles.size());

  // if not done, draw particles until max number
  if (!particlesDone && particles.size() < numOfParticles)
  {
    particles.add(new Particle(int(random(width)), int(random(height)), false));
  }

  // if there are enough particles, then set particlesDone to true
  if (particles.size() >= numOfParticles)
  {
    particlesDone = true;
  }

  // if it's done and particles still exist (they are dying), add black particles
  if (particlesDone && particles.size() > 0)
  {
    blackParticles.add(new Particle(int(random(width)), int(random(height)), true));

    for (int j=0; j<blackParticles.size(); j++)
    {
      Particle b = blackParticles.get(j);
      if (b.isDead() == false)
      {
        b.update();
        b.draw();
      }
    }
  }

  // if it's done and particles are all dead, then switch images and start over
  if (particlesDone && particles.size() <= 0)
  {
    // switches images depending on which one is active
    if (cycles == 1)
    {
      println("Image is 1");
      // swap images
      base = loadImage(img2);
      colorSource = loadImage(img1);
      cycles = 2;
      particlesDone = false;
    }
    else if (cycles == 2)
    {
      println("Image is 2");
      // swap images
      base = loadImage(img1);
      colorSource = loadImage(img2);
      cycles = 1;
      particlesDone = false;
    }
  }

  //Update the particles
  for (int i = 0; i < particles.size(); i++) 
  {
    Particle p = particles.get(i);
    if (p.isDead() == false) {
      p.update();
      p.draw();
    }
    else particles.remove(i);
  }
} 

//Clean canvas
void keyPressed() {
  background(BACKGROUND);
}


// partcle class
class Particle
{   
  PVector pos, vel;
  int x, y, age;
  float s, r, g, b;
  color c;
  boolean isBlack = false;

  Particle(int _x_, int _y_, boolean shouldBeBlack)
  {
    // set x and y
    if (x<0 || x> base.width) x = 0;
    if (y<0 || y>base.height) y = 0;
    x = _x_;
    y = _y_;
    isBlack = shouldBeBlack;
    // position vector is the x and y
    pos = new PVector(x, y);
    // velocity vector
    vel = new PVector();
    // age is the max age we'll set in the main sketch
    age = MAX_AGE;
  }

  // boolean that tells us when this particle is dead 
  boolean isDead() { 
    return age==0;
  } 

  // draw an ellipse each frame based on the position vector, size based on s variable (brightness)  
  void draw() { 
    //color c = color(colorSource.pixels[x+y*colorSource.width]);
    //color c = colorSource.get(25,25);

    // if boolean isBlack is true, make this particle black
    if (isBlack == true)
    {
      //println("adding black particles");
      c = BACKGROUND;
      s = 2.5;
    }
    fill(c);
    ellipse(pos.x, pos.y, s, s);
  }  

  void update() 
  { 
    vel.add(DIRECTIONS[abs(INDICES[abs((x+WIDTH)%WIDTH)][abs((y+HEIGHT)%HEIGHT)])]);
    pos.add(vel);
    x = int(pos.x);
    y = int(pos.y);
    //s = brightness(base.get(x, y)) >> 6;
    colorSource.loadPixels();
    if (x<0 || y<0 || x>=width || y>height) {
      s = 0;
      c = color(0, 0, 0);
    }
    else
    {
      // s (particle size) is based on img's brightness
      //s = (brightness(colorSource.pixels[x+y*base.width])) * .01;

      s = 2.5;

      int loc = x+y*colorSource.width;
      r = red   (colorSource.pixels[loc]);
      g = green (colorSource.pixels[loc]);
      b = blue  (colorSource.pixels[loc]);
      r *= 1;
      g *= 1;
      b *= 1;
      c = color(r, g, b);
      //c = color(colorSource.pixels[x+y*colorSource.width]);
      //tint(200,200,0);
    }
    age--;
  }    

  // brightness
  /*int brightness(int c) { 
   int r = c >> 16 & 0xFF, g = c >> 8 & 0xFF, b = c & 0xFF; 
   return c = (c = r > g ? r : g) < b ? b : c;
   }
   */
}



