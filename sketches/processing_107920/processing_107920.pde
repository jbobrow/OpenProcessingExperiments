
ArrayList particles;

void setup(){
  size(300, 792);
  background(255);
  particles = new ArrayList();
  smooth();
}

void draw(){
  background(255);
  
  particles.add(new Particle());
  
  for(int i = 0; i < particles.size(); i++){
    Particle p = (Particle) particles.get(i);
    
    PVector gravity = new PVector(0,0.5*p.mass);  
    float c = 0.2;
    PVector friction = p.velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);
  
  p.applyForce(gravity);
  p.applyForce(friction);
  p.update();
  p.display();
  p.checkEdge();
  
  }
  
}


class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float o = 0;
  float op = 0;
  //float r, g, b = 0;
  //float rr = 10;
  //float gg = 40;
  //float bb = 80;
  
  Particle(){
    location = new PVector(random(width), random(height));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = random(0.2,2);
  }
  
  void applyForce(PVector force){
  PVector f = PVector.div(force,mass);
  acceleration.add(f);
  }
  
  
  void update(){
  velocity.add(acceleration);
  location.add(velocity);
  acceleration.mult(0);
  }
  
  void display(){
  //rr += 0.5;
  //gg += 0.1;
  //bb += 0.5;
  
  //r = map(noise(rr),0,1,150,255);
  //g = map(noise(gg),0,1,150,255);
  //b = map(noise(bb),0,1,150,255);
  //color n = color(r, g, b);
  
  op += 0.5;
  o = map(noise(op), 0, 1, 5, 20);
  
  noStroke();
  fill(50, o);
  rect(location.x, location.y, mass*20, mass*20);
  }
  
  void checkEdge(){
  if(location.x > width){
    velocity.x *= -1;
    location.x = width;
  }else if(location.x < 0){
    velocity.x *= -1;
    location.x = 0;
  }
  if(location.y > height){
    location.y = height;
    velocity.y *= -1;
  }
  
  }
  


}


