
/* 
 * Random Flowers 3D by Algirdas Rascius.
 * 
 * This is a autostereogram. If you view it correctly, you will be able to see 3D scene. 
 * For more info see http://en.wikipedia.org/wiki/Autostereogram
 */
/**
 * Click for a new set of random flowers.
 */ 

ArrayList flowers; 
ArrayList zOscillators; 

void setup() {
  size(900, 500);
  smooth();
  noStroke();
  colorMode(HSB, TWO_PI, 1, 1, 1);
  initFlowers();
}

void draw() {
  background(0);
  for(Iterator i=flowers.iterator(); i.hasNext();) {
    Flower flower = (Flower)i.next();
    flower.drawFlower();
  }

  for(Iterator i=flowers.iterator(); i.hasNext();) {
    Flower flower = (Flower)i.next();
    flower.next();
  }

  for(Iterator i=zOscillators.iterator(); i.hasNext();) {
    RandomOscillator oscillator = (RandomOscillator)i.next();
    oscillator.next();
  }
}

void mouseClicked() {
  initFlowers();
}

void keyPressed() {
  initFlowers();
}

void initFlowers() {
  flowers = new ArrayList();
  zOscillators = new ArrayList();
  float hueValue = random(TWO_PI);
  addConcentricFlowers(width/2, height/2, width/10, hueValue);
  addConcentricFlowers(width/2+75, height/2+140, width/10, (hueValue+TWO_PI/3)%TWO_PI);
  addConcentricFlowers(width/2-75, height/2-140, width/10, (hueValue+TWO_PI/3*2)%TWO_PI);
}

void addConcentricFlowers(float x, float y, float maxRadius, float colorHue) {
  RandomOscillator zOscillator = new RandomOscillator(3.5, 2.5, 0);
  zOscillators.add(zOscillator);
  for (int i=1; i<6; i++) {
    flowers.add(new Flower(x, y, i, zOscillator, maxRadius/8*(6-i), (int)(3+random(3)), (int)(3+random(2)), color(colorHue, 1, ((float)i)/5)));
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
    this.multiplier = startValue / mean;
    next();
  }
  
  float getValue() {
    return value;
  }
  
  void next(){
    angle = (angle+random(PI/20)) % TWO_PI;
    value = multiplier*(mean + amplitude*sin(angle));
    multiplier += (1-multiplier) * 0.03;
   }
}

class Flower {
  float x;
  float y;
  float zIndex;
  RandomOscillator zOscillator;
  int petalCount;
  int pointsPerPetal;
  color clr;
  RandomOscillator oscillators[];
  
  Flower(float x, float y, float zIndex, RandomOscillator zOscillator, float meanRadius, int petalCount, int pointsPerPetal, color clr) {
    this.x = x;
    this.y = y;
    this.zIndex = zIndex;
    this.zOscillator = zOscillator;
    this.petalCount = petalCount;  
    this.pointsPerPetal = pointsPerPetal;
    this.clr = clr;
    this.oscillators =  new RandomOscillator[pointsPerPetal];
    for (int i=0; i<pointsPerPetal; i++) {
      this.oscillators[i] = new RandomOscillator(meanRadius, meanRadius*0.3, 0);
    }
  }
  
  void drawFlower() {
    fill(clr);
    float delta = 150 - zOscillator.getValue()*zIndex;
    float radiusMultiplier = 150/delta;
    for (float x0=x%delta-delta; x0<width+delta; x0+=delta) {
      beginShape();
      float angle = TWO_PI / petalCount / pointsPerPetal;
      for (int i=0; i<petalCount*pointsPerPetal+3; i++) {
        float alfa = angle*i;
        float radius = oscillators[i%pointsPerPetal].getValue() * radiusMultiplier;
        curveVertex(radius*sin(alfa)+x0, radius*cos(alfa)+y); 
      }
      endShape();
    }
  }
  
  void next() {
    for(int i=0; i<pointsPerPetal; i++) {
      oscillators[i].next();
    }  
  }
  
}

