

Particle p;
PImage bg;
ArrayList<Particle> particles;
String url = "http://volcorn.com/Schoch";
void setup() {
  bg = loadImage(url,"jpg");
  size(400,533);
  particles = new ArrayList<Particle>();
 
}

void draw() {
  background(0);
  image(bg,0,0);
  particles.add(new Particle(new PVector(238, 261)));
  for(int i = 0; i<particles.size(); i++){
    Particle p = particles.get(i);
    p.run();
    if(p.isDead()){
      particles.remove(i);
    }
}
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  int lifespan;

  Particle(PVector l) {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0.2);
    velocity = new PVector(random(-1,1),random(-2,3));
    location = l.get();
    lifespan=255;
    
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan-=2;
  }

  void display(){
    int green = color(125, 242, 70);
    int green1 = color(75, 219, 9);
    fill(green, lifespan);
    stroke(green1, lifespan);
   
    ellipse(location.x,location.y,12,12);
  }
  
  boolean isDead(){
    if(lifespan<0){
      return true;
    }else{
      return false;
    }
  }
}

 






