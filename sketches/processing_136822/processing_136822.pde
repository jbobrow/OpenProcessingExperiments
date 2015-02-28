
final static ArrayList<Particle> myParticles = new ArrayList();
color[] colorOptions = {
  color(242, 242, 242, 100), color(5, 175, 242, 100), color(5, 199, 242, 100), color(5, 219, 242, 100), color(89, 75, 70, 100)
}; 
int particleSpeed = 0;

void setup() {
  size(860, 480,P3D);
  stroke(255,255,255,150);
  rectMode(CENTER);
  noFill();
  smooth();
  noCursor();
}

void draw() {
  background(20, 20, 20);
  
  for (int i = myParticles.size()-1; i >= 0; i--) {
    Particle myParticle = myParticles.get(i);
    myParticle.updateParticle();
    if (myParticle.isAlive == false) {
      myParticles.remove(i);
    }
  }
}

void mouseMoved() {
 if(particleSpeed < 5){
   particleSpeed++;
 }else{
   particleSpeed = 0;
 }

  myParticles.add( new Particle(mouseX, mouseY,particleSpeed, colorOptions[int(random(colorOptions.length))]));
}

class Particle{
  float particleScale = 50;
  float particleSpeed = 0;
  PVector particlePoint;
  color c;
  float value;
  boolean isAlive = true;
  
  Particle(float startX, float startY, float speed, color tempC){
    particleSpeed = speed;
    particlePoint = new PVector(startX, startY, tempC);
    c = tempC;
    value = alpha(c);
 
    stroke(c);
    ellipse(particlePoint.x,particlePoint.y, particleScale, particleScale);
    
    fill(c);
    ellipse(particlePoint.x,particlePoint.y, particleScale*.75, particleScale*.75);
    noFill();
    noStroke();
  }
  
  void updateParticle(){
    smooth();
    particlePoint.y = particlePoint.y - sin(particleSpeed) * .9;
    particlePoint.x = particlePoint.x + cos(particlePoint.x);
    
    if(particleScale > 0){
      particleScale--;
    }else{
      isAlive = false;
    }
  
    stroke(c);
    ellipse(particlePoint.x,particlePoint.y, particleScale, particleScale);
    fill(c);
    ellipse(particlePoint.x,particlePoint.y, particleScale*.75, particleScale*.75);
    noFill();
    noStroke();
  }
}

