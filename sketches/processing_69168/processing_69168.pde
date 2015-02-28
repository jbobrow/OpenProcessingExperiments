
// OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/2298*@* */
// !do not delete the line above, required for linking your tweak if you re-upload */
// ColorSmoker
// modified Compex Flower Outline by Algirdas Rascius (http://mydigiverse.com).  
// Click for a new color smoker.

ArrayList flowers; 

void setup() {
  size(500, 500, JAVA2D);
  smooth();
  noFill();
  colorMode(HSB, TWO_PI, 1, 1, 1);
  createFlowers();
  background(0);
  strokeWeight(3);
}

color bgColor = color(0);
void draw() {
  copy(1, 2, width-2, height-4, 0, 0, width, height);
  if (frameCount % 2 == 0 ) {
    noStroke();
    fill(bgColor,0.01);
    rect(0,0,width,height);
    noFill();
  }
  for (Iterator i=flowers.iterator(); i.hasNext();) {
    Flower flower = (Flower)i.next();
    flower.drawFlower();
  }
  if (frameCount % 200 == 0)
    createFlowers();
}

void mousePressed() {
  createFlowers();
}

void keyPressed() {
  createFlowers();
}

void createFlowers() {
  flowers = new ArrayList();
  addConcentricFlowers(width/2, height*0.9, width/2, random(TWO_PI));
}

void addConcentricFlowers(float x, float y, float maxRadius, float colorHue) {
  int petalCount = (int)random(2, 8);
  int pointsPerPetal = (int)random(20, 100) / petalCount;
  println ("pental: c="+petalCount+"  p="+pointsPerPetal);
  for (int i=1; i<5; i++) {
    flowers.add(new Flower(x, y, maxRadius/8*(6-i), petalCount, pointsPerPetal, color(colorHue, 1, i*0.2)));
  }
}

class RandomOscillator {
  float mean;
  float amplitude;
  float value;
  float angle;
  float multiplier;

  RandomOscillator(float mean, float amplitude, float startValue) {
    this.mean = mean;
    this.amplitude = amplitude; 
    this.angle = random(TWO_PI);
    this.multiplier = mean !=0 ? startValue / mean : 1;
    next();
  }

  float getValue() {
    return value;
  }

  void next() {
    angle = (angle+random(PI/50)) % TWO_PI;
    value = multiplier*(mean + amplitude*sin(angle));
    multiplier += (1-multiplier) * 0.03;
  }
}

class Flower {
  float x;
  float y;
  int petalCount;
  int pointsPerPetal;
  color fcolor;
  RandomOscillator radiusOscillators[];
  RandomOscillator angleOscillators[];

  Flower(float x, float y, float meanRadius, int petalCount, int pointsPerPetal, color fcolor) {
    this.x = x;
    this.y = y;
    this.petalCount = petalCount;  
    this.pointsPerPetal = pointsPerPetal;
    this.fcolor = fcolor;
    this.radiusOscillators =  new RandomOscillator[pointsPerPetal];
    this.angleOscillators = new RandomOscillator[pointsPerPetal];
    for (int i=0; i<pointsPerPetal; i++) {
      this.radiusOscillators[i] = new RandomOscillator(meanRadius, meanRadius*0.3, 0);
      this.angleOscillators[i] = new RandomOscillator(0, TWO_PI/petalCount/pointsPerPetal*3, 0);
    }
  }

  void drawFlower() {
    stroke(fcolor, 250);
    translate(0, -50);
    fcolor = color(hue(fcolor)+0.006, 1, saturation(fcolor));    
    
    beginShape();
    float angle = TWO_PI / petalCount / pointsPerPetal;
    for (int i=0; i<petalCount*pointsPerPetal+3; i++) {
      float alfa = angle*i + angleOscillators[i%pointsPerPetal].getValue();
      float radius = radiusOscillators[i%pointsPerPetal].getValue();
      curveVertex(radius*sin(alfa)+x, radius*cos(alfa)+y);
    }
    endShape();
    for (int i=0; i<pointsPerPetal; i++) {
      radiusOscillators[i].next();
      angleOscillators[i].next();
    }
  }
}


