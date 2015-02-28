
ArrayList<Particle> arr; 
color particleColor;

void setup(){
  size(500, 500);
  background(255); 
  arr = new ArrayList<Particle>();
  particleColor =color(random(150,255), random(100,200), random(0,50));
} 

void draw(){
  //background(255); 
  arr.add(new Particle(new PVector(mouseX, mouseY)));
  for(int i = 0; i < arr.size(); i++){
    Particle p = arr.get(i);
    p.run();
    if(p.isDead()){
    arr.remove(i);
    }
  }
}
 
void mouseClicked(){
  particleColor = color(random(150,255), random(100,200), random(0,50));
}
 
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  color particle;

  Particle(PVector l) {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0;
    particle = particleColor; 
  }

  // Sometimes it’s convenient to have a “run”
  // function that calls all the other functions we need.
  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 5.0;
  }

  void display() {
    fill(particleColor, lifespan);
    noStroke();
    smooth();
    ellipse(location.x,location.y,(lifespan/2)/15,(lifespan/2)/15);
  }

  boolean isDead(){
    if(lifespan < 0.0){
    return true; 
    } else {
    return false; 
    }
  }
 
}


