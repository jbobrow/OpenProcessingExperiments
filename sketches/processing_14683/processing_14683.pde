
Particle particle;
Engine engine;
PVector a;
boolean mousePressedDown;
int timer = 8;

void setup(){
  size(400,400);
  engine = new Engine(0, new PVector(width/2,height/2,0));
  smooth();
}

void draw(){    
  background(0);
  engine.run();
  engine.addParticle(mouseX,mouseY);
}

public class Engine{
 
  ArrayList particles;    
  PVector origin;        

  Engine(int num, PVector v){
    particles = new ArrayList();             
    origin = v.get();                        
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin));    
    }
  }

  void run() {
   
    for (int i = particles.size()-1; i >= 0; i--){
      Particle p = (Particle) particles.get(i);
      p.run();
      if (p.dead()) {
        particles.remove(i);
      }
    }
  }

  void addParticle(){
    particles.add(new Particle(origin));
  }
  
  void addParticle(float x, float y){
    while(timer != 0){
      for (int i = 0; i < 20; i++){
        particles.add(new Particle(new PVector(x,y)));  
      }
      timer--;
    }
    timer = 8;
  }

  void addParticle(Particle p){
    particles.add(p);
  }

  boolean dead(){
    if (particles.isEmpty()){
      return true;
    }else{
      return false;
    }
  }
}

class Particle{
  PVector locatie;
  PVector velocity;
  PVector accelaration;
  float timer;
  
  Particle(PVector l){
    accelaration = new PVector(0,-0.05,0);
    velocity = new PVector(random(-0.5,0.5),random(0,1),0);
    locatie = l.get();
    timer = random(20, 70);
  }

  void run(){
    update();
    render();
  }

  void update(){
    velocity.add(accelaration);
    locatie.add(velocity);
    timer -= 1.0;
  }

  void render(){
    ellipseMode(CENTER);
    noStroke();
    fill(100,timer);
    ellipse(locatie.x,locatie.y,random(5,10),random(5,10));    
  }

  boolean dead(){
    if (timer <= 0.0){
      return true;
    } else {
      return false;
    }
  }
}


