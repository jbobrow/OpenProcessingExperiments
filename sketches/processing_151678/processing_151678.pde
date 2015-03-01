
void setup() {
  size(1200, 650);
  smooth();
  frameRate(1000);
  background(0);  
}
  
int radius = 10;
float xoff = 0.0;
boolean choice = true;
float deg = 0;

void draw() {
  fill(0 ,3);
  //rect(0, 0, width, height);
  
  int vel = (int) dist(mouseX, mouseY, pmouseX, pmouseY);
  deg+= 0.001;
  int radius = (int) map(vel, 1, 160, 5, 40);
  if (vel > 20) staggeredLine(mouseX, mouseY, radius, deg);
  
  xoff += (0.001 * radius);
}

void staggeredLine(int x, int y, int len, float deg) {
  translate(x, y);
  rotate(deg);
  
  stroke(returnColor(500, 50));
  for (int i = 0; i <= len; i++) {
    rotate(deg);
    point(i, 0);
  }
  for (int i = 0; i >= -len; i--) {
    rotate(deg);
    point(i, 0);
  }
}

void spanningEllipse(int x, int y, int radius) {
  for (int i = 1; i <= radius; i++) {
    int a = (int) map(i, 0, radius, 100, 0);
    stroke(returnColor(500, a));
    ellipse(x, y, i, i);
  } 
}

color returnColor(int velocity, int a) {
  int r = (int) map(velocity, 1, 500, 100, 255);
  int g = (int) map(velocity, 1, 500, 100, 255);
  int b = (int) map(velocity, 1, 500, 100, 255);
  
  if (choice) return color(r * random(0.6, 1), g * random(0.6, 1), b * random(0.6, 1));
  return color(r * random(0.6, 1), g * random(0.6, 1), b * random(0.6, 1), a);
}
void keyPressed() {
  if (key == 'R' || key == 'r') background(0); 
  if (key == 'c' || key == 'C') choice = !choice;
}


