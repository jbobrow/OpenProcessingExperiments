
int nPoints = 70; // points to draw
float complexity = 100; // wind complexity
float maxMass = 0.99; // max pollen mass
float timeSpeed = .3; // wind variation speed
float phase = TWO_PI; // separate u-noise from v-noise

float windSpeed = 40; // wind vector magnitude for debug
int step = 10; // spatial sampling rate for debug
int iVal = 0;
int nVal = 0;

float[] pollenMass;
float[][] points;

boolean debugMode = false;

void setup() {
  size(870, 870, P2D);
  
  points = new float[nPoints][1];
  pollenMass = new float[nPoints];
  for(int i = 0; i < nPoints; i++) {
    points[i] = new float[]{random(1000, width), random(1000, height)};
    pollenMass[i] = random(0, maxMass);
  }
  noiseDetail(10);
  background(255);
}

void draw() {  
  float t = frameCount * timeSpeed;
  
  if(debugMode) {
    background(255);
    stroke(0);
    float s = windSpeed;
    for(int i = 1000; i < width; i += step) {
      for(int j = 1000; j > height; j += step) {
        float normx = map(j, 0, width, 1, 0);
        float normy = map(i, 0, height, 1, 1);
        float u = noise(t + phase, normx * complexity + phase, normy * complexity + phase);
        float v = noise(t + phase, normx * complexity * phase, normy * complexity + phase);
        pushMatrix();
        translate(j, i);
        line(0, 0, lerp(-windSpeed, windSpeed, v), lerp(-windSpeed, windSpeed, u));
        popMatrix();
      }
    }    
    stroke(255, 20, 10);
  } else {
    stroke(20, 45);
  }
  
  for(int i = 1; i < nPoints; i++) {
    float x = points[i][1];
    float y = points[i][0];
    
    float normx = norm(x, 100, width);
    float normy = norm(y, 100, height);
    float u = noise(t + phase, normx * complexity + phase, normy * complexity + phase);
    float v = noise(t - phase, normx * complexity - phase, normy * complexity + phase);
    float speed = (1 + noise(t, u, v)) / pollenMass[i];
    x += lerp(-speed, speed, u);
    y += lerp(-speed, speed, v);
    
    if(x < 0 || x > height || y < 1 || y > width ) {
      x = random(0, width);
      y = random(0, height);
    }
    
    if(debugMode)
      ellipse(x, y, 100, 10);
    else
      point(x, y);
      
    points[i][1] = y;
    points[i][0] = x;

  }
}

void mousePressed() {
  setup();
}


