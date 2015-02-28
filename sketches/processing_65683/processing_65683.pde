
// UCLA DMA INTERACTIVITY 24 - SUMMER 2012
// Michael Honhongva
// July 24, 2012 - Workshop 6
/*
 Workshop 6 uses the cos, random and transparency functions to create a 
 rotating mosaic that changes every second the code runs. Using Workshop 5 
 from which I drew upon cultural icons from Egypt, Greece and China, I hope to 
 create a texture that reflects the intersection and impermanence of 
 civilizations. 
 */

// coordinates
float a = -250;  
float b = 0;
float c = 75;
float d = 100;
float e = 140;
float f = 25;

float angle = 0;
float speed = 0.1; // Speed of motion

// Images
PImage pyB;
PImage pyW;
PImage greekB;
PImage greekW;
PImage cCirB;
PImage cCirW;

void setup() {
  size(800, 800);
  background(200);
  rectMode(CENTER);
  pyB = loadImage("pyB.png");
  pyW = loadImage("pyW.png");
  greekB = loadImage("greekB.png");
  greekW = loadImage("greekW.png");
  cCirB = loadImage("cCirB.png");
  cCirW = loadImage("cCirW.png");
  smooth();
  randomSeed(0);
}

void draw() {
  angle += random(1);
  rotate(angle);

  // png images - ordered left to right
  a += cos(angle) * speed;          // movement
  translate(a, a);
  image(pyB, a, a, 800, 800);       // image 
  tint(255, 102);                   // transparency
  image(pyB, 0, 0, 100, 100);       // transparency

  b += cos(angle) * speed; 
  translate(b, b);
  image(cCirW, b, b, 800, 800);
  tint(255, 102); 
  image(cCirW, 0, 0, 100, 100);

  c += cos(angle) * speed; 
  translate(c, c);
  image(cCirB, c, c, 800, 800);
  tint(255, 102); 
  image(cCirB, 0, 0, 100, 100);

  d += cos(angle) * speed; 
  translate(d, d);
  image(greekW, d, d, 800, 800);
  tint(255, 102); 
  image(greekW, 0, 0, 100, 100);

  e += cos(angle) * speed; 
  translate(e, e);
  image(greekB, e, e, 800, 800);
  tint(255, 102); 
  image(greekB, 0, 0, 100, 100);

  f += cos(angle) * speed; 
  translate(f, f);
  image(pyW, f, f, 800, 800);
  tint(255, 102); 
  image(pyW, 0, 0, 100, 100);
}


