
//nagual 2 by andrew prioli, licensed under Creative Commons Attribution-Share Alike 3.0 license.
//Work: http://openprocessing.org/visuals/?visualID=5623
//License: http://creativecommons.org/licenses/by-sa/3.0

//originally made by Rob Saunders

ArrayList particles; 
ArrayList bornParticles; 
 
float background_brightness; 
 
int OFFSCREEN_CIRCLE = 0; 
int OFFSCREEN_DOT = 1; 
int OFFSCREEN_X = 2; 
 
PGraphics offscreen; 
int offscreen_type = OFFSCREEN_DOT; 
 
float CURVATURE; 
float IRRATIONALITY; 
float MORTALITY; 
float FECUNDITY; 
float OFFSET; 
 
void keyPressed() { 
  if (key == '1') { 
    offscreen_type = OFFSCREEN_CIRCLE; 
  } else if (key == '2') { 
    offscreen_type = OFFSCREEN_DOT; 
  } else if (key == '3') { 
    offscreen_type = OFFSCREEN_X; 
  } 
  reset(); 
} 
 
void setup() { 
  size(500, 500); 
  smooth(); 
  randomSeed(171171); 
  clearBackground(); 
  setupOffscreen(); 
  setupParticles(); 
  
} 
 
void mouseReleased() { 
  reset(); 
} 
 
void reset() { 
  randomSeed(millis()/100); 
  clearBackground(); 
  setupOffscreen(); 
  setupParticles(); 
} 
 
void clearBackground() { 
  background(random(75,150),random(255),random(75,150)); 
  background_brightness = brightness(get(10, 10)); 
} 
 
void setupOffscreen() { 
  offscreen = createGraphics(width, height, P2D); 
  float dx = offscreen.width/16; 
  float dy = offscreen.height/16; 
  offscreen.beginDraw(); 
  offscreen.background(255); 
  if (offscreen_type == OFFSCREEN_CIRCLE) { 
    offscreen.noFill(); 
    offscreen.stroke(0); 
    offscreen.strokeWeight(2); 
    offscreen.ellipseMode(CENTER); 
    offscreen.ellipse(width/2, height/2, width/2, height/2); 
  } else if (offscreen_type == OFFSCREEN_DOT) { 
    offscreen.fill(0); 
    offscreen.stroke(0); 
    offscreen.strokeWeight(1); 
    offscreen.ellipseMode(CENTER); 
    offscreen.ellipse(width/2, height/2, 2, 2); 
  } else if (offscreen_type == OFFSCREEN_X) { 
    offscreen.noFill(); 
    offscreen.stroke(0); 
    offscreen.strokeWeight(50); 
    offscreen.line(0, 0, width, height); 
    offscreen.line(width, 0, 0, height); 
  } 
  offscreen.endDraw(); 
  int particleCount = 0; 
  offscreen.loadPixels(); 
} 
 
void setupParticles() { 
  CURVATURE = -PI/10 + floor(random(12)) * PI/36; //changed random 12 to 1
  IRRATIONALITY = 0.1;  //changed random 10 to 0.1 
  MORTALITY = 0.001; //random(0.001, 0.01); 
  FECUNDITY = 20 * MORTALITY; 
  OFFSET =  2*PI/6; //random(PI/6, 5*PI/6); 
 
  particles = new ArrayList(); 
  bornParticles = new ArrayList(); 
  for (int i = 0; i < offscreen.pixels.length; i++) { 
    if (red(offscreen.pixels[i]) < 150) { 
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
     
    irrational_offset = 100; //changed from random
     
color_hue = 10;
    color_saturation = 0; 
    color_brightness = 0; 
 
    stroke_weight = 1.5; 
  } 
   
  void update() { 
    steps++; 
    px = x; 
    py = y; 
    x += 1.5 * sin(heading); //1.5 cos
    y +=  1.5 * cos(heading); //1.5 sin
    heading += sin(curvature);  //random
    curvature -= PI/160 * (1 - 2*noise(irrational_offset + steps * irrationality)); 
 
    if (brightness(offscreen.get(int(round(x)), int(round(y)))) < 255) { 
      fecundity = max(50, min(1, fecundity * 10)); 
      curvature = max(-1000, min(1, curvature * 10)); 
      irrationality = max(0, min(0.4, irrationality * 50)); 
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
      p.mortality = constrain(this.mortality + -0.005, 0.000001, 0.5); //changed from random 
      p.fecundity = constrain(this.fecundity + random(-0.01, 0.01), 0, 0.2); 
      p.offset = constrain(this.offset + PI/30, 0, PI); 
      
      //random(-PI/300, PI/300
 
       p.color_hue = (this.color_hue + 150 + 255) % 5; 
       p.color_saturation = constrain(this.color_saturation + 255, 255, 255); 
       p.color_brightness = constrain(this.color_brightness + 50, 50, 50); 
 
       p.stroke_weight = constrain(this.stroke_weight + -0.1, 0.1, 4); 
 
      bornParticles.add(p); 
    } 
  } 
   
  void draw() { 
    colorMode(HSB); 
    stroke(color_hue, color_saturation, color_brightness); 
    strokeWeight(stroke_weight); 
    strokeCap(SQUARE); 
    line(px, py, x, y); 
  } 
} 


