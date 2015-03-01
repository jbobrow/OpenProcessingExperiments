
int numBox = 20;
float g = 0.1; //gravity
float [] v = new float [numBox]; //velocity-speed
color [] c = new color [numBox];
float [] x = new float [numBox];
float [] y = new float [numBox]; 
float [] a = new float [numBox];

void setup() {
  size(600, 600);
  for (int i = 0; i < c.length; i++) {
    c[i] = randomColor();
    a[i] = randomSize();
    v[i] = 0.0;
    x[i] = (i+1)*a[i] + 10.0;
    y[i] = a[i]/2;
  }
}

void draw() {

  gravity();

  background(255);
  for (int i = 0; i < c.length; i++) {
    noStroke();
    fill(c[i]);

    rectMode(CENTER);
    rect(x[i], y[i], a[i], a[i]);
  }
}

void gravity() {
  for (int i = 0; i < c.length; i++) {
    v[i] = v[i] + g;
    y[i] = y[i] + v[i];

    if (y[i] > height - a[i]/2) {
      v[i] = v[i] * (-0.95);
    }
    if (v[i] == 0){
     y[i] = height - a[i]/2;}
  }
}

color randomColor() {
  return color(random(255), random(255), random(255));
}

float randomSize() {
  return random(20, 100);
}

