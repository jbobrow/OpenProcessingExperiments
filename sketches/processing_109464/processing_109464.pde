
//Processing Composition

static final int compositionSideLength = 400;
static final int sideDivisor = 10;

static final int stepsToClear = 30;

static color colorToAverage;

void setup() {
  colorToAverage = color(0x6BBCDC);
  size(400,400);
  smooth(); //anti-alias
  background(255);
  noStroke();
  frameRate(10);
}

color randomColor() {
 int r = round((red(colorToAverage) + random(0xFF)) / 2.f);
 int g = round((green(colorToAverage) + random(0xFF)) / 2.f);
 int b = round((blue(colorToAverage) + random(0xFF)) / 2.f);
 
 return color(r,g,b);
}

void incrementAveragingColor()
{
   float r = (red(colorToAverage) + 1) % 256;
   float g = (green(colorToAverage) + 1) % 256;
   float b = (blue(colorToAverage) + 1) % 256;
   
   colorToAverage = color(r,g,b);
}

void draw() {
 
  int boxSize = compositionSideLength / sideDivisor;
  
  fill(0xFF, 120);
  rect(0, 0, compositionSideLength, compositionSideLength);
 
  for (int i = 0; i < sideDivisor; ++i) {
    for (int j = 0; j < sideDivisor; ++j) {
       fill(randomColor());
       int randomInset = round(random(0.f,boxSize/2.f));
       float randomAngle = random(0, PI/2.f);
       rotate(randomAngle);
       
       int cornerRadius = round(random(0.f,boxSize/2.f));
       
       rect( (i * boxSize) + randomInset, (j * boxSize)+randomInset, boxSize - (2*randomInset), boxSize - (2*randomInset), cornerRadius);
    }
  }
  
  rotate(0);
  
  incrementAveragingColor();
  
}


