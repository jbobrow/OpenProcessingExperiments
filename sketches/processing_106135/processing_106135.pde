
interface Drawable {
  void draw(); 
}

class SandParticle implements Drawable {
  int x, y;
  color pigment;
  int DIAMETER = 2;
  
  SandParticle(int x, int y, color pigment) {
    this.x = x;
    this.y = y;
    this.pigment = pigment;
  }
  
  void draw() {
    fill(pigment);
    noStroke();
    
    ellipse(x, y, DIAMETER, DIAMETER); 
  }
}

class Sand {
  ArrayList<SandParticle> particles;
  color PIGMENT = color(1);
  
  Sand(int particleCount) {
    particles = new ArrayList<SandParticle>();
    for (int i = 0; i < particleCount; i++) {
      particles.add(spawnParticle()); 
    }
  }
  
  private SandParticle spawnParticle() {
    int x = (int)random(width);
    int y = (int)random(height);
    
    return new SandParticle(x, y, PIGMENT);
  }
}

class VibrationPlate implements Drawable {
  color pigment;
  Sand sand;
  float periodicPhase = 0;
 
  VibrationPlate(color pigment, int particleCount) {
    this.pigment = pigment;
    this.sand = new Sand(particleCount);
  }
  
  void draw() {
    drawPlate();
    drawSand();
  }
  
  void drawPlate() {
    fill(pigment);
    noStroke();
    
    int diameter = (int)min(width, height);
    ellipse(width/2, height/2, diameter, diameter);
  }
  
  void drawSand() {
    for (SandParticle particle : sand.particles) {
      particle.draw(); 
    }
  }
  
  void update() {
    updatePlate();
    updateSand();
  }
  
  void updatePlate() {
    periodicPhase += 0.5;
  }
  
  void updateSand() {
    for (SandParticle particle : sand.particles) {
      if (random(1) > 0.00001) {
        int x = particle.x - width/2;
        int y = particle.y - height/2;
        float radialPosition = sqrt(sq(x) + sq(y));
        float angularPosition = atan2(y, x);
        float perturbedAngle = angularPosition + cos(periodicPhase)/200;
        radialPosition += 3 * sin(periodicPhase);
        x = round(radialPosition * cos(perturbedAngle));
        y = round(radialPosition * sin(perturbedAngle));
        particle.x = x + width/2;
        particle.y = y + height/2;
      }
    } 
  }
}

VibrationPlate plate;

void setup() {
  size(800, 800);
  colorMode(RGB, 1.0);
  background(1);
  frameRate(30);
  
  plate = new VibrationPlate(color(0.2, 0.2, 0.2), 10000);
}

void draw() {
  plate.update();
  plate.draw();
}


