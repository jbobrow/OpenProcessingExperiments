
import processing.video.*;
 
//MovieMaker mm;


class Agent {
  PVector p, pOld;
  float stepSize, angle;
  color col;

  Agent() {
    p = new PVector(random(0, width), random(0, height));
    pOld = new PVector(p.x, p.y);
    stepSize = 1;
    col = color(p.x*150/height, 0, p.y*150/height);
  }

  void update() {
    if (nbTours % 100 == 50) {
      p.x = random(0, width);
      p.y = random(0, height);
      col = color(p.x*150/height, 0, p.y*150/height);

      return;
    }
    angle = noise(p.x/noiseScale, p.y/noiseScale)*noiseAmp; 
    p.x += cos(angle) * stepSize;
    p.y += sin(angle) * stepSize;
    if (p.x<0 || p.x>width) {
      p.x = random(0, width);
    }
    if (p.y<0 || p.y>height) {
      p.y = random(0, height);
    }
  }
}


// VARS
float noiseAmp = 15;
float noiseScale = 100;
int nbAgents = 1000;
Agent agents[] = new Agent[nbAgents];
int nbTours = 0;


void setup() {
  // Or, set specific compression and frame rate options
 // mm = new MovieMaker(this, 480, 360, "draw.mov", 25,MovieMaker.ANIMATION, MovieMaker.HIGH);

  size(480, 360);
  randomSeed(millis());
  background(255);
  strokeWeight(2);
  for (int i = 0;i<nbAgents;i++) {
    agents[i] = new Agent();
  }
}

void draw() {
  noiseAmp = ((noiseAmp + 0.5) % 300) + 5;
  for (int i = 0;i<nbAgents;i++) {
    agents[i].update();
    stroke(agents[i].col, 50);
    point((int)agents[i].p.x, (int)agents[i].p.y);
  }
  nbTours++;
 // mm.addFrame();
}


