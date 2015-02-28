
int howMany = 800;
float[] x = new float[howMany];
float[] y = new float[howMany];
float[] speed = new float[howMany];

void setup() {
  size(800, 400);
  background(0);
  noStroke();
  smooth();

  int i = 0;
  while (i<howMany) {
    x[i] = random(0, width);
    y[i] =random(0, height);
    speed[i] = random(1,5);
    i +=1;
  }
}

void draw() {
  //background(0);
  fill(0,15);
  rect(0,0,width, height);

  int i = 0;
  while (i < howMany) {
    fill(50*speed[i]);
    ellipse(x[i], y[i],speed[i],speed[i]);
    y[i] += speed[i]/2;
    if (y[i] > height) {
      y[i] = 0;
    }
    i +=1;
  }
}
