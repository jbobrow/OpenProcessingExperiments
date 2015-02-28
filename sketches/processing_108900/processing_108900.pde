
//Processing Composition

static final int compositionSideLength = 400;
static final int sideDivisor = 10;

void setup() {
  size(400,400);
  smooth(); //anti-alias
  background(255);
  frameRate(10);
}

color randomColor() {
 
 int r = round((107.f + random(0xFF)) / 2.f);
 int g = round((188.f + random(0xFF)) / 2.f);
 int b = round((2.f + random(0xFF)) / 2.f);
 
 return color(r,g,b);
  
}

void draw() {
 
  int boxSize = compositionSideLength / sideDivisor;
  
  for (int i = 0; i < sideDivisor; ++i) {
    for (int j = 0; j < sideDivisor; ++j) {
       fill(randomColor());
       noStroke();
       rect(i * boxSize, j * boxSize, boxSize, boxSize);
    }
  }
  
}


