
PImage img;
int maxCount = 5000;
int currentCount = 1;
float[] newx = new float[maxCount];
float[] newy = new float[maxCount];
float[] x = new float[maxCount];
float[] y = new float[maxCount];
float[] r = new float[maxCount];

boolean drawGhosts = false;

void setup() {
  size(800, 519);
  img = loadImage("fireworks.jpg");
  smooth();

  // first circle
  x[0] = width/2;
  y[0] = height/2;
  r[0] = 5;
}


void draw() {
  
  background(img);
  noStroke();

  float newR = random(1, 10);
  float newX = random(0+newR, width-newR);
  float newY = random(0+newR, height-newR);

  float closestDist = 1000;
  int closestIndex = 10;
  // which circle is the closest?
  for(int i=0; i < currentCount; i++) {
    float newDist = dist(newX,newY, x[i],y[i]);
    if (newDist < closestDist) {
      closestDist = newDist;
      closestIndex = i; 
    } 
  }

  // aline it to the closest circle outline
  float angle = atan2(newY-y[closestIndex], newX-x[closestIndex]);

  x[currentCount] = x[closestIndex] + cos(angle) * (r[closestIndex]+newR);
  y[currentCount] = y[closestIndex] + sin(angle) * (r[closestIndex]+newR);
  r[currentCount] = newR;
  currentCount++;

  if (drawGhosts) {
  for (int i=0 ; i < currentCount; i++) {
    fill(random(255));
  }
  }

 for (int i=0 ; i < currentCount; i++) {
    if (i == 0) noFill();
    else fill(random(255), random(255));
    ellipse(x[i],y[i], r[i]*0.5,r[i]*0.5); 
  }

  if (currentCount >= maxCount) noLoop();
}


