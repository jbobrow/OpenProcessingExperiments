
// "The Arkitekt" BETA (r1): March 8th, 2011
// by William A. Clark | Math, Programming, and Art | Instructor: Nick Lally | CCA 2011
// MIDTERM PROJECT

// Generative columns respond to sound, as particles fall from the sky, generating tones
// Can be a bit slow right now due to all the stuff going on! Hope to optimize eventually.

// TO DO:
// Interactive generation of chords (rather than randomized notes)
// more dense background, more 'organic' look overall
// slight 'drift' physics applied to particles and columns

// Import libraries
import traer.physics.*;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;
import ddf.minim.ugens.*;


/////////   IMPORTANT VARIABLES  /////////////////////////////////////////////////////////////////////////////////
int colNum = 30;                 //// Number of columns to generate
int particles = 4;               //// Particle multiplier
float decayTime = .1;            //// Particle decay time: the larger this number, the faster they fade...
float particleOpacity = 15.0;    //// Starting opacity of particles
float particleMin = 10;          //// Minimum particle size
float particleMax = 20;          //// Maximum particle size

int density = 25;                //// Density of columns
float fadeTime = 55;             //// Fade time: the higher this number, the quicker elements in general fade away
int framerate = 15;              //// Frame rate (duh)
///////// END IMPORTANT VARIABLES ///////////////////////////////////////////////////////////////////////////////

// initialize particle systems
ParticleSystem ps;
ParticleSystem snow;


// init audio, input and output
Minim minim;
AudioInput in;
AudioOutput out;

int frame = 1;                        // frame counter
int[][] col = new int[150][4];        // 2-dimensional column array, where the first dimension refers to column #, the 2nd to its translation
float[] rand = new float[particles];  // an array of random numbers, pure n' simple 
int colWidth; 
float audioAvg;                       // this will hold the average audio level between L and R channels (range: 0-1)
float lvl;                            // audioAvg mapped to make it more usable (range: 1-100... in theory. In practice, more like 1-3)
color crayon;
float opacityMod;

/////////////// SETUP ///////////////
void setup() {
  size(1000, 300);
  frameRate(framerate);
  background(10);
  //smooth();
  cursor(CROSS);

  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 512);  // get a mono line-in
  out = minim.getLineOut();               // get a stereo line out 

    // create some particle systems with their own gravity, etc
  ps = new ParticleSystem(1, new PVector(width/2,height/2,0));
  snow = new ParticleSystem(1, new PVector(width/2,height/2,0));

  // call a function to generate numbers for the arrays
  arrayGenAll();
}

/////////////// DRAW LOOP /////////////
void draw() {
  audioAvg = ((in.left.level()+in.right.level())/2);   // get average audio levels of L and R channels
  lvl = map(audioAvg,0,1,1,100);                       // map those levels to make them more usable

  if(frame%15 == 0) { 
    arrayGenAll();     // rebuild columns every few frames
  }

  // draw a big black rectangle with a low opacity to 'fade' elements over time
  fill(0, fadeTime);
  rect(0,0,width,height);

  // Background layer
  stroke(250, 5);
  strokeWeight(.25);
  for (int i = 0; i < density*3; i++) {
    //filter(BLUR, random(1,5));
    line(random(-20,width+20), random(-5, height+5), random(-20,width+20), random(-5, height+5));
  }
  
  
  // iteratively draw columns
  for(int i = 1; i < colNum; i++) { 
   
   // every so often, play a random note, modulated by the position of the mouse 
    if(int(random(2,555)) <= 5) {
      out.playNote( 0.0, random(.5,2)+map(mouseY, 0, height, .1, 2), random(15,250)+map(mouseX, 0, width, -10, 100));
      // when a note is played, turn things red and make things blurry
      lvl = 2;
      filter(BLUR, random(2,6)+map(mouseX,0,width,0,5));
    }
    //filter(BLUR, random(0,1));   // TOO SLOW!  
    
    // let the drawing begin!
    pushMatrix();
    translate(col[i][1],col[i][2]);
    strokeWeight(map(col[i][3],-100,100,.2,1.2)*lvl);  // When something is operated on by lvl, it becomes responsive to sound
    colWidth = int(random(10,70)*lvl);
    density = int(map(col[i][3],-100,100,40,150)*lvl);
    for(int j = 0; j < density; j++) {
      drawLine(i);
    }
    popMatrix();
  }

  pushMatrix();
  filter(BLUR, .75);
  popMatrix();

  // change frame rate and opacity of elements based on mouse position
  frameRate(map(mouseY, 0, height, 5, 30));
  opacityMod = map(mouseX, 0, width, 10, 30);

  // Physics stuff! Start both systems and add particles
  ps.run(); 
  snow.run();
  ps.addParticle(mouseX,mouseY);
  for(int i = 0; i < particles; i++) {
    snow.addParticle(random(0,width), random(-3,3));
  }

  frame++;

  //drawing the waveforms slows things down! :(
  //drawIn(); drawOut();
}

void arrayGen(int c) {
  // 1, 2, 3 = x, y, z
  col[c][1] = int(random(-5,width+5));
  //col[c][2] = int(random(-5,height+5));
  col[c][2] = 0;
  col[c][3] = int(random(-100,100));
}

void arrayGenAll() {
  // for every column, generate numbers for the array
  for(int i = 1; i < colNum; i++) {
    arrayGen(i);
  }
  
  // for every particle, generate a random number for.. something
  for(int i = 1; i < particles; i++) {
    rand[i] = int(random(5,50));
  }
}

void drawLine(int num) {
  // if the z-index is low (far back), then make it more transparent!
  if(col[num][3] >= 0) { 
    // turn red when sound reaches a certain level
    if (lvl >=1.5) { 
      stroke(random(180,225), 0, 0, (random(20,40)-opacityMod));
    }
    if (lvl < 1.5) { 
      stroke(250, (random(20,55)-opacityMod));
    }
  }

  else { 
    stroke(250, (map(col[num][3],-100,100,5,20)-opacityMod));
  }

  line(random(0,colWidth), random(-5, height+5), random(0,colWidth), random(-5, height+5));
}

void drawIn() {
  strokeWeight(5);
  stroke(255, 50);
  // draw the waveforms
  for ( int i = 0; i < in.bufferSize() - 1; i++ ) {
    float x1 = map(i, 0, in.bufferSize(), 0, width);
    float x2 = map(i+1, 0, in.bufferSize(), 0, width);
    line(x1, (height/2) - ((in.left.get(i)+in.right.get(i))/2)*1500, x2, (height/2) - ((in.left.get(i+1)+in.right.get(i+1))/2)*1500);
  }
}

void drawOut() {
  strokeWeight(3);
  stroke(150,100,0,30);
  // draw the waveforms
  for ( int i = 0; i < out.bufferSize() - 1; i++ ) {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, (height/2) - out.left.get(i)*200, x2, (height/2) - out.left.get(i+1)*200);
  }
}

void mouseClicked() {
  background(0);
  arrayGenAll();
}

void keyPressed() {
  if(key == '=') {
    colNum++;
    arrayGenAll();
  }

  if(key == '-') {
    colNum = colNum - 1;
    arrayGenAll();
  }

  if(key == 'm') {
    out.mute();
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();

  super.stop();
}

///// CODE BELOW MODIFIED/BORROWED FROM http://processing.org/learning/topics/simpleparticlesystem.html /////

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {

  ArrayList particles;    // An arraylist for all the particles
  PVector origin;        // An origin point for where particles are born

    ParticleSystem(int num, PVector v) {
    particles = new ArrayList();              // Initialize the arraylist
    origin = v.get();                        // Store the origin point
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin));    // Add "num" amount of particles to the arraylist
    }
  }

  void run() {
    // Cycle through the ArrayList backwards b/c we are deleting
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = (Particle) particles.get(i);
      p.run(decayTime);
      if (p.dead()) {
        particles.remove(i);
      }
    }
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void addParticle(float x, float y) {
    particles.add(new Particle(new PVector(x,y)));
  }

  void addParticle(Particle p) {
    particles.add(p);
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } 
    else {
      return false;
    }
  }
}




// A simple Particle class

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;

  // Another constructor (the one we are using here)
  Particle(PVector l) {
    acc = new PVector(0,0.5,0);
    vel = new PVector(random(-1,1),random(-2,0),0);
    loc = l.get();
    r = random(particleMin,particleMax);
    timer = particleOpacity;
  }

  void run(float life) {
    update(life);
    render();
  }

  // Method to update location
  void update(float decay) {
    vel.add(acc);
    loc.add(vel);
    timer -= decay;
  }

  // Method to display
  void render() {
    ellipseMode(CENTER);
    noStroke();
    if (lvl >=1.5) { 
      fill(200, 0, 0, timer);
    }
    if (lvl < 1.5) { 
      fill (250, timer);
    }
    //fill(250,timer);
    ellipse(loc.x,loc.y,r,r);
  }

  // Is the particle still useful?
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}
///// END TEH BORROWING /////


