
int number = 15;
float[] x = new float[number];
float[] y = new float[number];
float[] r = new float[number];
float[] theta = new float[number];
float[] offset = new float[number];
int minRadius = 30;
int maxRadius = 60;

void setup(){
  size(700, 500);
  stroke(200, 180, 220);
  background(0);
  for (int i = 0; i < number; i++){
    x[i] = width/2 + random(-width/3, width/3);
    y[i] = height/2 + random(-height/3, height/3);
    r[i] = random(minRadius, maxRadius);
    offset[i] = radians(random(360)); // so they aren't all swimming entirely in sync
    theta[i] = radians(random(360)); // basic angle they're swimming towards
  }
}

void draw(){
  fill(0.0, 0.0, 0.0, 5);
  rect(0,0,width, height);
  noFill();
  for (int i = 0; i < number; i++){
    ellipse(x[i],y[i],r[i],r[i]);
    x[i] += cos(theta[i]);
    y[i] += sin(theta[i]);
    theta[i] += radians(sin(radians(frameCount) + offset[i]));
    if (x[i] < -maxRadius) x[i] = width + maxRadius;
    if (x[i] > width + maxRadius) x[i] = -maxRadius;
    if (y[i] < -maxRadius) y[i] = height + maxRadius;
    if (y[i] > height + maxRadius) y[i] = -60;
  }

}
