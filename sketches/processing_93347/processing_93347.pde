

//inspired from http://processing.org/learning/topics/simpleparticlesystem.html
ArrayList<Particle> particles;

int centerX = 0;
int centerY = 0;

void setup() {
    size(550,450);
    centerX = width/2;
    centerY = height/2;
    particles = new ArrayList<Particle>();
}
 
void draw() {
  background(255);
  //[offset-down] A new Particle object is added to the ArrayList every cycle through draw().
  particles.add(new Particle());
 
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.run();
    if (p.isDead()) {
      particles.remove(i);
    }
  }
}
 
class Particle {
    float radius =centerY+50;
    int grad = 0;
    float pcenterX;
    float pcenterY;
    float speed;
    color pcolor;
  float lifespan;
 
  Particle() {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    pcenterX = centerX+random(-20,20);
    pcenterY = centerY+random(-20,20);
    speed = random(1,40);
    lifespan = 255;
    pcolor = color(0,0,200);
  }
 
  // Sometimes it’s convenient to have a “run”
  // function that calls all the other functions we need.
  void run() {
    update();
    display();
  }
 
  void update() {
    lifespan-= 0.50;
    grad+=3;
    radius-=0.5;
  }
 
  void display() {
    stroke(pcolor,lifespan);
    fill(pcolor,lifespan);
    float winkel = radians(grad);
    float x = pcenterX + (cos(winkel)*radius);
    float y = pcenterY + (sin(winkel)*radius);
    ellipse(x,y,8,8);
  }
 
  // Is the Particle alive or dead?
  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
}
