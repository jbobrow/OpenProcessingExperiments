
int STAR_COUNT = 15;
float t;
float[] xs = new float[STAR_COUNT];
float[] ys = new float[STAR_COUNT];

void setup() {
  size(250, 250);
  noStroke();
  newPositions();
  frameRate(24);
}

void draw() {

  background(random(200, 250), random(180, 215), random(180, 230));

  t += 0.25;
  if(t >= 2) {
    t = 0;
    newPositions();
  }

  for(int i = STAR_COUNT - 1; i >= 0; i--) {
    float tt = t + (i / 5);
    if(tt >= 2) tt -= 2;
    explosion(tt, xs[i], ys[i]);
  }  
}

void explosion(float t, float posX, float posY) {
  for(int i = 0; i < 50; i++) {
    fill(random(240, 255));
    float r = random(TWO_PI);
    triangle(
    posX + (cos(r - HALF_PI) * i * .50),
    posY + (sin(r - HALF_PI) * i * .50),
    posX + (cos(r + HALF_PI) * i * .50),
    posY + (sin(r + HALF_PI) * i * .50),
    posX + (cos(r) * i * t),
    posY + (sin(r) * i * t));           
  }
}

void newPositions() {
  for(int i = 0; i < STAR_COUNT; i++) {
    xs[i] = random(width);
    ys[i] = random(height); 
  }
}



