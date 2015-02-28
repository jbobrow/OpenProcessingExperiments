
int nPoints = 4096; // points to draw
float complexity = 8; // wind complexity
float maxMass = .8; // max pollen mass
float timeSpeed = .02; // wind variation speed
float phase = TWO_PI; // separate u-noise from v-noise

float windSpeed = 40; // wind vector magnitude for debug
int step = 10; // spatial sampling rate for debug

float[] pollenMass;
float[][] points;

boolean debugMode = false;

void setup() {
  size(512, 512, P2D);
  
  points = new float[nPoints][2];
  pollenMass = new float[nPoints];
  for(int i = 0; i < nPoints; i++) {
    points[i] = new float[]{random(0, width), random(0, height)};
    pollenMass[i] = random(0, maxMass);
  }
  noiseDetail(14);
  background(255);
}

void draw() {  
  float t = frameCount * timeSpeed;
  
  if(debugMode) {
    background(255);
    stroke(0);
    float s = windSpeed;
    for(int i = 0; i < width; i += step) {
      for(int j = 0; j < height; j += step) {
        float normx = map(i, 0, width, 0, 1);
        float normy = map(j, 0, height, 0, 1);
        float u = noise(t + phase, normx * complexity + phase, normy * complexity + phase);
        float v = noise(t - phase, normx * complexity - phase, normy * complexity + phase);
        pushMatrix();
        translate(i, j);
        line(0, 0, lerp(-windSpeed, windSpeed, u), lerp(-windSpeed, windSpeed, v));
        popMatrix();
      }
    }    
    stroke(255, 0, 0);
  } else {
    stroke(0, 10);
  }
  
  for(int i = 0; i < nPoints; i++) {
    float x = points[i][0];
    float y = points[i][1];
    
    float normx = norm(x, 0, width);
    float normy = norm(y, 0, height);
    float u = noise(t + phase, normx * complexity + phase, normy * complexity + phase);
    float v = noise(t - phase, normx * complexity - phase, normy * complexity + phase);
    float speed = (1 + noise(t, u, v)) / pollenMass[i];
    x += lerp(-speed, speed, u);
    y += lerp(-speed, speed, v);
    
    if(x < 0 || x > width || y < 0 || y > height) {
      x = random(0, width);
      y = random(0, height);
    }
    
    if(debugMode)
      ellipse(x, y, 10, 10);
    else
      point(x, y);
      
    points[i][0] = x;
    points[i][1] = y;
  }
}

void mousePressed() {
  setup();
}

void keyPressed() {
  debugMode = !debugMode;
  background(255);
}

