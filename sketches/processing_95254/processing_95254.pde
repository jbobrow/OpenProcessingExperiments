
ArrayList<Particle> arr; 
color particleColor;

void setup(){
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  background(0,100,0);  
  arr = new ArrayList<Particle>();
} 

void draw(){
  background(0,100,0); 
  for(int i = 0; i < arr.size(); i++){
    Particle p = arr.get(i);
    p.run();
    if(p.isDead()){
    arr.remove(i);
    }
  }
}
 
void mouseClicked(){
  for(int i = 0; i < 3; i++){
  particleColor = color(random(20,60), random(100,150), random(100,150));
    for(int j = 0; j < 10; j++){
      arr.add(new Particle(new PVector(mouseX, mouseY), particleColor));
    }
  }
}
 
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  color particleC; 

  Particle(PVector l, color pC) {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0;
    particleC = pC;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }

  void display() {
    fill(particleC);
    noStroke();
    smooth();
    ellipse(location.x,location.y,(lifespan/2)/7,(lifespan/2)/7);
  }

  boolean isDead(){
    if(lifespan < 0.0){
    return true; 
    } else {
    return false; 
    }
  }
 
}



