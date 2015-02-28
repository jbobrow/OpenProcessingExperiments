
/**
 Also known as the Windchime from Hell.<br><br>
 The rings move with the mouse, and the mouse button scatters the drones.<br><br>
 The drones attract each other within their rings.<br>
 Drones form synapses when they're near other drones.<br>
 Synapses are green when a drone is making more of them; red when less. Otherwise they're blue.<br>
 Drones play sounds when they have enough synapses. The synapse is white when firing.<br>
 The sound's volume is proportional to the drone's velocity.<br>
 The sound's pitch is determined by the drone's ring.<br>
 */

Maxim maxim;
AudioPlayer[] gamelan;

int stageWidth = 720;
int stageHeight = 720;
int centerX = stageWidth / 2;
int centerY = stageHeight / 2;
int frame = 0;
float fps = 0;
float displayFps = 0;

/* ring constants */
int ringCount = 7;
int minRing = 4; /* ordinal of smallest ring */
int ringSep = 32; /* separation between rings */

/* drone constants */
int droneCount = 60;
float forceMax = .000002; /* value to which cForce is normalized */
float drag = .003; /* drag coefficient */
float connectLimit = 2.5 * ringSep; /* maximum distance at which drones will connect */
float startVel = 0.02; /* maximum initial angular velocity */
float connectionThreshold = 0.15; /* connected proportion of all drones required to play a note */
int recoveryPeriod = 60; /* number of fram a drone must wait between playing notes */

/* gamelan constants */
int redundantChannels = 6; /* extra copies of gamelan keys so the samples don't restart as often */
int[] channelBuffer = new int[ringCount];

Drone[] drones;
Ring[] rings;

void setup () {
  size(720, 720);
  frameRate(60);
  noSmooth();
  noFill();
  textSize(18);
  
  /* audio file array setup */
  maxim = new Maxim(this);
  gamelan = new AudioPlayer[ringCount * redundantChannels];
  for (int f=0; f<gamelan.length; f++) {
    String fileName = "gam" + str(f % ringCount + 1) + ".wav";
    gamelan[f] = maxim.loadFile(fileName);
    gamelan[f].setLooping(false);
    gamelan[f].volume(.1);
    gamelan[f].speed(0.25); /* corrects for file's sampling rate */
    /* gamelan[f].setAnalysing(true); */
  }
  
  for (int b=0; b<ringCount; b++) {
    channelBuffer[b] = 0;
  }
  
  
  /* make rings and drones */
  rings = new Ring[ringCount];
  for (int r=0; r<rings.length; r++) {
    rings[r] = new Ring(r + minRing);
  }
  
  drones = new Drone[droneCount];
  for (int d=0; d<drones.length; d++) {
    drones[d] = new Drone(weightRings(minRing, ringCount), random(TWO_PI), random(-1 * startVel, startVel), d);
  }
  
}

void draw() {
  background(0);
  
  /* mouse radial coordinates */
  float mouseDx = centerX - mouseX;
  float mouseDy = centerY - mouseY;
  float mouseDist = sqrt(mouseDx * mouseDx + mouseDy * mouseDy);
  float mouseTheta = atan2(mouseDy, mouseDx);
  
  /* draw rings */
  for (int i=0; i<rings.length; i++) {
    rings[i].update(0);
  }
  
  /* iterate through drones */
  for (int j=0; j<drones.length; j++) {
    int[] connectedBuffer = new int[0];
    float sigma = 0;  
      for (int k=j+1; k<drones.length; k++) {
        
        /* integrate cForce */
        sigma += cForce(sep(drones[j], drones[k]));
        
        /* connect nearby drones */
        if (drones[j].ring != drones[k].ring && dDist(drones[j], drones[k]) < connectLimit) {
          int c = drones[j].connections;
          int pC = drones[j].pConnections;
          
          /* light up connection and play note if drone is ready, and the connection count is above the threshold */
          if ((c > droneCount * connectionThreshold) && (drones[j].ready < 1)) {
            
            /* note pitch from drone ring, volume from drone velocity */
            int gamelanChannel = drones[j].ring - minRing;
            channelBuffer[gamelanChannel] = (channelBuffer[gamelanChannel] + 1) % redundantChannels;
            int bufferedChannler =  gamelanChannel + ringCount * channelBuffer[gamelanChannel];
            gamelan[gamelanChannel].stop();
            gamelan[gamelanChannel].cue(0);
            gamelan[gamelanChannel].volume(sqrt(abs(drones[k].phaseVel)) * 2);
            gamelan[gamelanChannel].play();
            drones[j].ready = recoveryPeriod;
            
            stroke(255, 255, 255);
            strokeWeight(3);
            line(drones[j].x, drones[j].y, drones[k].x, drones[k].y);
            strokeWeight(1);
            
          /* red line if number of connections has decreased, red if increased, else blue */
          } else {
            stroke(c < pC ? 230 : 50, c > pC ? 230 : 50, c == pC ? 230 : 50);
            line(drones[j].x, drones[j].y, drones[k].x, drones[k].y);
          }
          
          /* update the drones connection list */
          connectedBuffer = append(connectedBuffer, k);
        }
      }
 
    /* exert force towards the mouse pointer */
    float mForce = cForce(mouseTheta % TWO_PI - drones[j].phase % TWO_PI) * mouseDist;
    
    /* apply sum of cForce, mForce, and drag */
    drones[j].phaseVel = drones[j].phaseVel * (1 - drag) + mForce + sigma;
    drones[j].connectedTo = connectedBuffer;
    drones[j].update();
  }
  
  snitch();
}

/* break up clumps */
void mouseReleased() {
  for (int z=0; z<drones.length; z++) {
    drones[z].phaseVel = random(-2 * startVel, 2 * startVel);
  }
}

/* HELPER FUNCTIONS */

/* Pythagorean distance */
float dDist(Drone a, Drone b) {
  float dx = a.x - b.x;
  float dy = a.y - b.y;
  return sqrt(dx * dx + dy * dy);
}

/* angular distance */
float sep(Drone a, Drone b) {
  return a.phase % TWO_PI - b.phase % TWO_PI;
}

/* force acting on drones: bell curve * sine of angular distance */
float cForce(float s) {
  return map(-1 * sin(s) * exp(s * s / -2), -.5236, .5236, -1 * forceMax, forceMax);
}

/* weights drone distribution inproportion to ring circumferences */
int weightRings(int min, int num) {
  int sumRings = 0;
  int[] thresholds = new int[0];
  
  /* build encounter table */
  for (int a = min; a<min + num; a++) {
    sumRings += a;
    thresholds = append(thresholds, sumRings);
  }
  
  /* roll and resolve */
  float dieRoll = random(sumRings);
  int resultRing = min;
  for (int b=0; b<thresholds.length; b++) {
    if (dieRoll > thresholds[b]) {
      resultRing++;
    }
  }
  return resultRing;
}

void snitch() {
  /* report state of the channel buffer   */
  text(join(channelBuffer, ", "), 10, 690);

  
  /* report average frames per second once per second */
  frame++;
  fps += frameRate;
  if (frame % 60 == 0) {
    displayFps = round(fps / 60);
    fps = 0;
  }
  text(str(displayFps) + " fps", 10, 710);
}

/* DRONE CLASS */

class Drone {
  float x, y, angle, phase, phaseVel, radius, mouseScale, thickness;
  int ring, id;
  int connections = 0;
  int pConnections = 0;
  int ready = 0;
  int[] connectedTo = new int[0];

  
  Drone(int ringIn, float phaseIn, float phaseVelIn, int idIn) {
    ring = ringIn;
    phase = phaseIn;
    phaseVel = phaseVelIn;
    id = idIn;
    radius = ring * ringSep;
    mouseScale = (ringCount + minRing - float(ring)) / 12;
  }
  
  void update() {
    phase += phaseVel;
    angle = phase;
    pConnections = connections;
    connections = connectedTo.length;
    thickness = max(sqrt(connections)/2, 1);
    x = centerX + (mouseX - centerX) * mouseScale + cos(phase) * radius;
    y = centerY + (mouseY - centerY) * mouseScale + sin(phase) * radius;
    ready = max(ready - 1, 0);

    stroke(60, 140, 255);
    strokeWeight(thickness);
    
    pushMatrix(); 
    translate(x, y);
    rotate(angle);
    scale(2 * thickness);
    quad(-1, 0, 0, 1 + phaseVel * 20, 1, 0, 0, -1 + phaseVel * 20);
    popMatrix();
    
    strokeWeight(1);
  }
}

/* RING CLASS */

class Ring {
  float x, y, diameter, mouseScale;
  float oscilliation = 1;
  int ring;
  
  Ring(int ringIn) {
    x = centerX;
    y = centerY;
    ring = ringIn;
    diameter = ring * ringSep * 2;
    mouseScale = (ringCount + minRing - float(ring)) / 12;
  }
  
  void update(float oscIn) {
    oscillation = oscIn;
    x = centerX + (mouseX - centerX) * mouseScale;
    y = centerY + (mouseY - centerY) * mouseScale;
    stroke(40 + abs(x - centerX), 40 + abs(y - centerY), 100);
    ellipse(x, y, diameter + 10 * oscillation, diameter + 10 * oscillation);
  }
}
