
ArrayList particles;
ArrayList falldown;

void setup(){
  size(360, 360);
  particles = new ArrayList<Particle>();
  
  for(int i=0; i<360; i=i+5){
    for(int j=0; j<360; j=j+5){
      Particle p = new Particle(new PVector(i, j));
      particles.add(p);
      fill(random(255), 255, random(255));
      rect(i,j,10,10);
    }
  }

}

void draw(){
  
  if(mousePressed){
    //fallDown(mouseX, mouseY);
    falldown = fallDown2(mouseX, mouseY);
    for (int i = 0; i < falldown.size(); i++) {
    Particle p = (Particle)falldown.get(i);
    p.run();
    }
  } 
  
}

ArrayList<Particle> fallDown2(int x, int y){
  ArrayList fall = new ArrayList<Particle>();
  for(int i=0; i<particles.size(); i++){
    Particle p = (Particle)particles.get(i);
    if((p.location.x > x-10 && p.location.x < x+10) && (p.location.y > y-10 && p.location.y < y+10)){
      fall.add(p);
      fill(255);
      rect(p.location.x, p.location.y, 10, 10);
      
    }
  }
  return fall;
}


void fallDown(int x, int y){
  for(int i=0; i<particles.size(); i++){
    Particle p = (Particle)particles.get(i);
    if((p.location.x > x-10 && p.location.x < x+10) && (p.location.y > y-10 && p.location.y < y+10)){
      p.run();
      
    }
  }
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;

  Particle(PVector l) {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();

  }

  void run() {
   
    update();
    display();
  
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);    
    }
  
    void display() {
    fill(255, random(255), random(255));
    stroke(0);
    rect(location.x,location.y,10,10);
  }  
    
  }
