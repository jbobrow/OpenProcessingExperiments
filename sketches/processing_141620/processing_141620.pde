
Particle p;
ArrayList<Particle> particles;

void setup() {
  size(640,360);
  particles = new ArrayList<Particle>();
  background(0);
}

void draw() {
  // Operating the single Particle
  if(mousePressed){
  particles.add(new Particle(new PVector(mouseX, mouseY)));
  }
  fill(0, 20);
  rect(0, 0, width, height);
  firework();
}

void firework(){
  for(int i = 0; i<particles.size(); i++){ 
    Particle p = particles.get(i);
    p.run(); 
    if(p.delete()){
      particles.remove(i);
    }
  }
 }

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0.035);
    velocity = new PVector(random(-2,2),random(-3,2));
    location = l.get();
    lifespan =255;
  }

  void run() { 
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -=1.9;
  }

  void display() {
    noStroke();
    int r = (int) random(120,195);
    int g = (int) random(120,155);
    int b = (int) random(150,235);
    int colorful = color(r,g,b);
    fill(colorful,lifespan);
    ellipse(location.x,location.y,8,8);
  }
  
 boolean delete(){
  if(lifespan<0){
    return true;
  }else{
    return false;
  }
 }
}
