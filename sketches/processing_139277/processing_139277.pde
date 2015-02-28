

int numPoints = 5000;
int num = 60;

int[] x;
int[] y;

float mx[] = new float[num];
float my[] = new float[num];

int index = 0;

void setup() {

  size(600, 600);
  x = new int[numPoints];
  y = new int[numPoints];
}

void draw() {

  background(255);
  noStroke();
  fill(255);

  if ( mousePressed ) {
    x[index] = mouseX;
    y[index] = mouseY;
    index = index + 1;
    if ( index >= numPoints ) {
      index = 0;
    }
  }

  if ( keyPressed ) {
    float r = random(0, 200);
    float g = random(0, 150);
    float b = random(50, 200);
    fill (r, g, b);
   
  } else {
    fill (240, 150);
  }

  int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;

  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    ellipse(mx[index], my[index], i, i);
  }
}



