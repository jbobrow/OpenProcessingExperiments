
/* Credit to http://www.openprocessing.org/sketch/5582 for amazing particle reference 
 Credit to Golan Levin for the recording option
 */

int nFramesInLoop = 160;
int nElapsedFrames;
int particleCount = 80;
Particle[] particles = new Particle[particleCount];
boolean bRecording;

void setup() 
{
  noStroke();
  size(500, 600);

  //initializing particles
  for (int i = 0; i < particleCount; i++) { 
    particles[i] = new Particle();
  }
}

void keyPressed() {
  bRecording = true;
  nElapsedFrames = 0;
}

void draw() {

  // Compute a percentage (0...1) representing where we are in the loop.
  float percentCompleteFraction = 0; 
  if (bRecording) {
    percentCompleteFraction = (float) nElapsedFrames / (float)nFramesInLoop;
  } 
  else {
    percentCompleteFraction = (float) (frameCount % nFramesInLoop) / (float)nFramesInLoop;
  }

  // Render the design, based on that percentage. 
  renderMyDesign (percentCompleteFraction);

  fill(255);
  textSize(20);
  text("#c0ffee", -45, 220);

  // If we're recording the output, save the frame to a file. 
  if (bRecording) {
    saveFrame("output/myname-loop-" + nf(nElapsedFrames, 4) + ".png");
    nElapsedFrames++; 
    if (nElapsedFrames >= nFramesInLoop) {
      bRecording = false;
    }
  }
}

void renderMyDesign(float percent)
{
  translate(width/2, height/2); 

  background(#ffac0a);

  /* Loop through the particles */
  for (int i = 0; i < particleCount; i++) { 
    Particle particle = (Particle) particles[i];
    particle.display();
  }
  
}

class Particle {
  float rad;
  float angle;
  float dec;

  int size;

  //particle constructor
  Particle() {
    angle = random(-10, 10);
    rad = random(0, 100);
    dec = (200 - rad) * 0.00004; 

    size = (int) random(2, 4);
  }

  void display () {
    pushMatrix();
    rotate(radians(90));
    fill(#c0ffee, 30);
    
    quad(rad*sin(angle), sin(angle), 180 * cos(angle), cos(angle), 
    120*cos(angle), 180*sin(angle), -rad*cos(angle), 30*sin(angle));
    
    angle+=dec;
    popMatrix();
  }
}



