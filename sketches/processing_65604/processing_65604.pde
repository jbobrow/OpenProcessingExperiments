
// UCLA DMA INTERACTIVITY - SUMMER 2012
// Michael Honhongva
// July 21, 2012 - Workshop 5 Revised

PImage pyB;
PImage pyW;
PImage greekB; 
PImage greekW;
PImage cCirB;
PImage cCirW;

void setup() {
  size(800, 800);
  smooth();
  frameRate(0.75);
  imageMode(CENTER);
  background(200);
  
  pyB = loadImage("pyB.png");
  pyW = loadImage ("pyW.png");
  greekB = loadImage("greekB.png");
  greekW = loadImage("greekW.png");  
  cCirB = loadImage("cCirB.png");
  cCirW = loadImage("cCirW.png");
}
 
void draw() {
  
  float a = random(width);
  float b = random(height);
  image(pyB, a, b, 500, 500);

  float e = random(width);
  float f = random(height);
  image(greekB, e, f, 500, 500);

  float c = random(width);
  float d = random(height);
  image(pyW, c, d, 500, 500);
    
  float g = random(width);
  float h = random(height);
  image(greekW, g, h, 500, 500);

  float i = random(width);
  float j = random(height);
  image(cCirB, i, j, 500, 500);
  
  float k = random(width);
  float l = random(height);
  image(cCirW, k, l, 500, 500);
}

