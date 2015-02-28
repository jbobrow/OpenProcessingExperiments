
PImage cubeimg;
float s = 1;

void setup() {

  background(0);
  size(800, 800);
  frameRate(20);
  cubeimg = loadImage("cube.png");
  tint(50);
}

void draw() {

  float a = noise(10)*random(40);
  float b = noise(10)*random(40);

  translate(400, 400);
  rotate(random(0,360));

  tint(random(10, 200), random(10, 200), random(10, 200), 50);
  image(cubeimg, a, b, 100, 100);

  tint(random(10, 200), random(10, 200), random(10, 200), 100);
  image(cubeimg, a, b, s, s);

  s++;
}



