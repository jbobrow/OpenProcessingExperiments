
PImage aqueduct;
PImage runner;
PImage lion;
PImage lionmouth;
PImage olympicrings;
int b = 5;
int f = 120;
int w = 555;
int z = 100;
int q = 495;


void setup() {
  size(600, 300);
  smooth();
  aqueduct = loadImage("aqueduct.jpg");
  frameRate(2);
  imageMode(CENTER);
  runner = loadImage("runner.png");
  lion = loadImage("lion.png");
  lionmouth = loadImage("lionmouth.png");
  olympicrings = loadImage("olympicrings.png");
}
 
void draw() {
  background(0);
  float x = b+=15;
  float y = f-=0.5;
  float a = w-=15;
  float r = z+=5;
  float l = q-=15;
  float d = random(50, 375);
  float j = random(67, 500);
  //float w = random(width);
  //float z = random(height);
  image(aqueduct, 300, 150);
  image(olympicrings, 260, 120, d, j);
  image(runner, x, y);
  image(lion, a, r); 
  image(lionmouth, q, r);
 
  
}

