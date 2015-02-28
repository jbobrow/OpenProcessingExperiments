
boolean gameStart = true;


int nPoints = 25096; // points to draw
float complexity = 10; // wind complexity
float maxMass = .5; // max pollen mass
float timeSpeed = .02; // wind variation speed
float phase = TWO_PI; // separate u-noise from v-noise
 
float windSpeed = 30; // wind vector magnitude for debug
int step = 10; // spatial sampling rate for debug
 
float[] pollenMass;
float[][] points;




float x = 150;
float y = 150;
float speedX = random(10, 20);
float speedY = random(10, 20);
int leftColor = 0;
int rightColor = 0;
int diam;
int rectSize = 150;
float diamHit;




 
boolean debugMode = false;

PImage bg;
PImage b;
PImage c;
PImage d;
PImage e;
int a; 



 
void setup() {
  size(1280, 750, P2D);
bg = loadImage("rsz_microscopestrata_size_strip1.png");
b = loadImage("rsz_microscopestrata_size_strip4.png");
c = loadImage("microfit.png");
d = loadImage("rsz_microscopestrata_size_strip2.png");
e = loadImage("rsz_microscopestrata_size_strip3.png");
noStroke();
   ellipseMode(CENTER);


  points = new float[nPoints][2];
  pollenMass = new float[nPoints];
  for(int i = 0; i < nPoints; i++) {
    points[i] = new float[]{random(0, width), random(0, height)};
    pollenMass[i] = random(0, maxMass);
  }
  noiseDetail(20);
;
}
 
void draw() { {
  image(bg,0,0);
  
  tint(255,255,255,17);
    fill(0,0,0,50);
     noCursor();
 diam = 20;
 fill(230,230,230,50);
 ellipse(x, y, diam, diam);
 
 
   noStroke();
  fill(leftColor,leftColor,leftColor,50);
  rect(0, 0, 20, height);
  fill(250,250,250,90);
  rect(width-30, mouseY-rectSize/2, 10, rectSize);

   
 {

  float t = frameCount * timeSpeed;
  if(debugMode) {
   
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
    stroke(255, 255, 0);
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

 
 
 if (gameStart) {
   
      image(b, 0,0);
  image(c,0,0);
  image(d,0,0);
 image(e,0,0);} 
    x = x + speedX;
    y = y + speedY;
 
    // if ball hits movable bar, invert X direction and apply effects
    if ( x > width-30 && x < width -20 && y > mouseY-rectSize/2 && y < mouseY+rectSize/2 ) {
      speedX = speedX * -1;
      x = x + speedX;
      rightColor = 0;
      fill(random(0),random(0),random(0));
      rectSize = rectSize-10;
      rectSize = constrain(rectSize, 10,150);     
    }
 
    // if ball hits wall, change direction of X
    else if (x < 25) {
      speedX = speedX * -1.1;
      x = x + speedX;
      leftColor = 0;
    }
 
    else {    
      leftColor = 128;
      rightColor = 128;
    }
    // resets things if you lose
    if (x > width) {
      gameStart = true;
      x = 150;
      y = 150;
      speedX = random(10, 20);
      speedY = random(10, 20);
      rectSize = 150;
    }
 
 
    // if ball hits up or down, change direction of Y  
    if ( y > height || y < 0 ) {
      speedY = speedY * -1;
      y = y + speedY;
    }
  }
}}


void keyPressed() {
  debugMode = !debugMode;
  background(bg);
  
}


