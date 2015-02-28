
import java.util.Iterator;

ParticleSystem ps;
PFont font;

void setup() {
  size(640,360);
  smooth();
  ps = new ParticleSystem(new PVector(mouseX, mouseY));
  font = createFont("Calibri", 16, true);
}

void draw() {
  background(0);
  if(mousePressed){
    ps.addParticle();
    ps.addParticle();
  }
  ps.run();
  
  if(keyPressed){
    SaveFrame();
  }
  
  FrameRate();
  CursorPos();
}

void CursorPos(){
  fill(125,125,125);
  rect(width-80, height-25, 75, 20);
  textAlign(RIGHT);
  textFont(font,12);
  String cursorPos = "x: "+floor(mouseX)+", y:"+floor(mouseY);
  fill(0,0,0,175);
  text(cursorPos, width-10, height-10);
}

void FrameRate(){
  fill(125,125,125);
  rect(width-80, height-55, 75, 20);
  textAlign(LEFT);
  textFont(font,12);
  fill(0);
  text("FPS: " + int(frameRate),width-60,height-40);
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(random(-0.1,0.1),random(-0.1,0.1));
    velocity = new PVector(random(-1,1),random(-1,1));
    location = new PVector(mouseX,mouseY);
    lifespan = 700; //in milliseconds
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 16;
  }

  // Method to display
  void display() {
    stroke(0,lifespan);
    int r = (int)random(0,200);
    int g = (int)random(50,255);
    int b = (int)random(100,255);
    //println(r + " ; " + g + " ; " + b);
    fill(r,g,b,lifespan);
    ellipse(location.x,location.y,8,8);
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

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

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

  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove(); 
      }
    }
  }
}

void keyPressed(){
  println("key pressed");
  SaveFrame();
}

void SaveFrame(){
  int timer = 256;
  while(timer > 0){
    //saveFrame("capture-##.png");
    fill(125,125,125, timer);
    rect(10, height-30, 95, 20);
    textAlign(LEFT);
    textFont(font,12);
    String cursorPos = "Screen Captured";
    fill(0,0,0,175);
    text(cursorPos, 15, height-15);
    timer -= 10;
  }
}


