
/**
 * Cameleopard 
 * by Matt Perkins. 
 * 
 * This sketch combines curve-cornered rectangles and ellipses along with a healthy dose
 * of randomness to create the look of a headless giraffe through tall grass.
 * It's the glitchy feeling of searching with the models we create try to express 
 * something online.
 * 
 */
 
int barWidth = 20;
int lastBar = -1;
int loopCount = 650;
int giraffeY = 240;
int giraffeX = 650;


void setup() {
  size(650, 370);
  colorMode(RGB);
  noStroke();
  background(255,255,255);
  smooth();
  frameRate(11);
}

void draw() {
  background(255,255,255);
  giraffeX = loopCount % width;

  for (int y=-15; y < 640; y=y+40) {
    for (int x=-50; x < 640; x=x+2) {
      if ((y <= giraffeY) && 
          ((y+40) >= giraffeY))
         {
           drawGiraffe(giraffeX,giraffeY);
         }
      drawRect(x,y, 50); 
    }
  }
  loopCount--;
  if (loopCount == 0) {
    loopCount = width;
  }
}

void drawGiraffe(int x, int y) {
  for(int j=0; j<3; j++) {
    float noise = random(-20,20);
    fill(240+noise,166+noise,29+noise);
    ellipse(x+noise,y+(noise*3),2+noise,110-random(110));
  }
}

void drawRect(int x, int y, int seed) {
  float r = random(-seed,seed);
  fill(0, 205+r, 0);
  rect(x+random(-13,13), y+random(-26,26), 65, 125, abs(seed), abs(seed)*3, abs(seed)*2, abs(seed)*2);
}
