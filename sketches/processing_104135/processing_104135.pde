

  PImage hausen;
  Maxim max;
  AudioPlayer fundo; 
  AudioPlayer stockhausen1;
  AudioPlayer stockhausen2;
  AudioPlayer stockhausen3;
  AudioPlayer stockhausen4;
  AudioPlayer  click;


ParticleSystem ps;

void setup() {
  size(720,480);
  ps = new ParticleSystem(new PVector(width/2,50));
    hausen = loadImage("stockhausen.png");
    imageMode(CENTER);
    max = new Maxim(this);
    stockhausen1 = max.loadFile ("stock_short.wav");
    stockhausen1.setLooping(false);
    stockhausen2 = max.loadFile ("stock_short1.wav");
    stockhausen2.setLooping(false);
    stockhausen3 = max.loadFile ("stock_short2.wav");
    stockhausen3.setLooping(false);
    stockhausen4 = max.loadFile ("stock_short3.wav");
    stockhausen4.setLooping(false);
    click = max.loadFile ("click.wav");
    click.setLooping(false);
    fundo = max.loadFile ("const.wav");
    fundo.setLooping(true);
}

void draw() {
  background(255);
  fundo.play();
  
  if(mousePressed){
  click.cue(0);
  click.play();
}
  ps.origin.set(mouseX,mouseY,0);
    
 
  ps.addParticle();
  ps.run();



}


class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float px1 = 0;
  float px2 = 0.6;
  
  
  Particle(PVector l) {
   // acceleration = new PVector(px1,px2);
    velocity = new PVector(random(-4,4),random(0,4));
    location = l.get();
    lifespan = 255.0;
    
  }

  void run() {
    update();
    display();
   
  }

  // Method to update location
  void update() {

    acceleration = new PVector(px1,px2);
  
   
    if(mousePressed){
    velocity.add(acceleration);
    location.add(velocity);
    }
   
   px1= map(mouseX, 0, width, -2,2);
   px2 = map(mouseY, 0, height, -2,2);
       
    lifespan -= 5.0;
  
  }

  // Method to display
  void display() {
 
    image(hausen,location.x,location.y,50,70);
   
    if(location.x>= width){
    stockhausen1.cue(0);
    stockhausen1.speed(random(0.1,2));
    stockhausen1.play();
    }
    if(location.x<= 0){
    stockhausen2.cue(0);
    stockhausen2.speed(random(0.1,2));
    stockhausen2.play();
    }
    if(location.y<= 0){
    stockhausen3.cue(0);
    stockhausen3.speed(random(0.1,2));
    stockhausen3.play();
    }
    if(location.y>= height){
    stockhausen4.cue(0);
    stockhausen4.speed(random(0.1,2));
    stockhausen4.play();
    }

    
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}


// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Using Generics now!  comment and annotate, etc.

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void addParticle(float x, float y) {
    particles.add(new Particle(new PVector(x, y)));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}





