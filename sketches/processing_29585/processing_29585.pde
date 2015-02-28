
//This was created with the help of Nagual by Rob Saunders http://www.openprocessing.org/visuals/?visualID=2339


ArrayList particles;
ArrayList bornParticles;
 
float background_brightness;
 
int OFFSCREEN_X = 2;
 
PGraphics offscreen;
int offscreen_type = OFFSCREEN_X;
 
float CURVATURE;
float IRRATIONALITY;
float MORTALITY;
float FECUNDITY;
float OFFSET;
 
void mousePressed() {
  if (mousePressed) {
    offscreen_type = OFFSCREEN_X;
  }
  reset();
}
 
void setup() {
  size(350, 350);
  smooth();
  randomSeed(171171);
  clearBackground();
  setupOffscreen();
  setupParticles();
}
 
 
void reset() {
  randomSeed(millis()/17);
  clearBackground();
  setupOffscreen();
  setupParticles();
}
 
void clearBackground() {
  background(255);
  background_brightness = brightness(get(0, 0));
}
 
void setupOffscreen() {
  offscreen = createGraphics(width, height, P2D);
  float dx = offscreen.width/2;
  float dy = offscreen.height/2;
  offscreen.beginDraw();
  offscreen.background(255);
if (offscreen_type == OFFSCREEN_X) {
    offscreen.noFill();
    offscreen.stroke(0);
    offscreen.strokeWeight(2);
    offscreen.rect(-10, -10, 125, 125);
    offscreen.rect(-10, -10, 250, 250);
  }
  offscreen.endDraw();
  int particleCount = 0;
  offscreen.loadPixels();
}
 
void setupParticles() {
  CURVATURE = -PI/6 + floor(random(12)) * PI/36;
  IRRATIONALITY = random(1);
  MORTALITY = random(0.001, 0.01);
  FECUNDITY = 20 * MORTALITY;
  OFFSET = random(PI/6, 5*PI/6);
 
  particles = new ArrayList();
  bornParticles = new ArrayList();
  for (int i = 0; i < offscreen.pixels.length; i++) {
    if (red(offscreen.pixels[i]) < 255) {
      int x = i % width;
      int y = (i - x) / width;
      particles.add(new Particle(x, y));
    }
  }
}
 
void update() {
  particles.addAll(bornParticles);
  bornParticles.clear();
  ListIterator i = particles.listIterator();
  while (i.hasNext()) {
    Particle p = (Particle) i.next();
    if (p.dead) {
      i.remove();
    } else {
      p.update();
    }
  }
}
 
void draw() {
  update();
  Iterator i = particles.iterator();
  while (i.hasNext()) {
    Particle p = (Particle) i.next();
    p.draw();
  }
}
 
class Particle {
  int steps;
  boolean dead;
   
  float x;
  float y;
  float heading;
 
  float color_hue;
  float color_saturation;
  float color_brightness;
 
  float stroke_weight;
 
  float px;
  float py;
 
  float curvature;
  float irrationality;
  float fecundity;
  float mortality;
  float offset;
   
  float irrational_offset;
   
  public Particle() {
    this(random(width), random(height));
  }
   
  public Particle(float _x, float _y) {
    this(_x, _y, random(TWO_PI));
  }
   
  public Particle(float _x, float _y, float _heading) {
    steps = 0;
    dead = false;
     
    x = _x;
    y = _y;
    heading = _heading;
 
    px = x;
    py = y;
 
    curvature = CURVATURE;
    irrationality = IRRATIONALITY;
    mortality = MORTALITY;
    fecundity = FECUNDITY;
    offset = OFFSET;
     
    irrational_offset = random(10000);
     
    color_hue = 0;
    color_saturation = 0;
    color_brightness = 0;
 
    stroke_weight = 1;
  }
   
  void update() {
    steps++;
    px = x;
    py = y;
    x += 1.5 * cos(heading);
    y += 1.5 * sin(heading);
    heading += random(curvature);
    curvature += PI/20 * (1 - 2*noise(irrational_offset + steps * irrationality));
 
    if (brightness(offscreen.get(int(round(x)), int(round(y)))) < 255) {
      fecundity = max(0, min(0.2, fecundity * 1.2));
      curvature = max(-1, min(1, curvature * 2));
      irrationality = max(0, min(0.4, irrationality * 2));
    }
 
    if ((brightness(get(int(round(x)), int(round(y)))) < background_brightness) || (random(1) < mortality)) {
      // Kill this particle
      dead = true;
    } else if (random(1) < fecundity) {
      // Create a new particle
      Particle p = new Particle(x, y);
      p.heading = this.heading + ((random(1) < 0.5) ? offset : -offset);
      p.curvature = constrain(this.curvature + random(-PI/6, PI/6), -PI, PI);
      p.irrationality = constrain(this.irrationality + random(-10, 10), -100, 100);
      p.mortality = constrain(this.mortality + random(-0.005, 0.005), 0.001, 0.5);
      p.fecundity = constrain(this.fecundity + random(-0.01, 0.01), 0, 0.2);
      p.offset = constrain(this.offset + random(-PI/30, PI/30), 0, PI);
 
      // p.color_hue = (this.color_hue + random(-32, 32) + 255) % 255;
      // p.color_saturation = constrain(this.color_saturation + random(32), 0, 64);
      // p.color_brightness = constrain(this.color_brightness + random(32), 0, 127);
 
      // p.stroke_weight = constrain(this.stroke_weight + random(-0.11, 0.09), 0.1, 4);
 
      bornParticles.add(p);
    }
  }
   
  void draw() {
    colorMode(RGB);
    stroke(color_hue, color_saturation, color_brightness);
    strokeWeight(stroke_weight);
    strokeCap(SQUARE);
    line(px, py, x, y);
  }
}

void keyPressed() {
  
  if (keyPressed == true){
    save("plan");
  }
}



