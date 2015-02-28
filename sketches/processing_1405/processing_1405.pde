
/** 
 * Random Flower
 * by Algirdas Rascius.
 *  
 * Press any key for a new random flower.
 */ 

ArrayList flowers; 

void setup() {
  size(500, 500);
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
}

void mouseClicked() {
  initFlowers();
}

void keyPressed() {
  initFlowers();
}

void initFlowers() {
  flowers = new ArrayList();
  addConcentricFlowers(width/2, height/2, width/2, random(TWO_PI));
}

void addConcentricFlowers(float x, float y, float maxRadius, float colorHue) {
  for (int i=1; i<6; i++) {
    flowers.add(new Flower(x, y, maxRadius/8*(6-i), (int)(3+random(20)), (int)(3+random(6)), color(colorHue, 1, ((float)i)/6)));
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
  int petalCount;
  int pointsPerPetal;
  color clr;
  RandomOscillator oscillators[];
  
  Flower(float x, float y, float meanRadius, int petalCount, int pointsPerPetal, color clr) {
    this.x = x;
    this.y = y;
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
    beginShape();
    float angle = TWO_PI / petalCount / pointsPerPetal;
    for (int i=0; i<petalCount*pointsPerPetal+3; i++) {
      float alfa = angle*i;
      float radius = oscillators[i%pointsPerPetal].getValue();
      curveVertex(radius*sin(alfa)+x, radius*cos(alfa)+y); 
    }
    endShape();
    for(int i=0; i<pointsPerPetal; i++) {
      oscillators[i].next();
    }  
  }
  
}

