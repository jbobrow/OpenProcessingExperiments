

Particle p;
PImage bg;
ArrayList<Particle> particles;
String url = "http://volcorn.com/Schoch";
VomitRectangle reci;
float limit = 400;
void setup() {
  bg = loadImage(url,"jpg");
  size(400,533);
  particles = new ArrayList<Particle>();
  reci = new VomitRectangle(new PVector(170, height));
 
}

void draw() {
  background(0);
  image(bg,0,0);
  particles.add(new Particle(new PVector(238, 261)));
  for(int i = 0; i<particles.size(); i++){
    Particle p = particles.get(i);
    if(limit < reci.getLocation()){
    p.run();
    if(p.isDead()){
      particles.remove(i);
    }
}
  }
  if(limit < reci.getLocation()){
  reci.run();
}else{
reci.stay();
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
class VomitRectangle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  VomitRectangle(PVector l){
    location = l.get();
    velocity = new PVector(0,-0.3);
  }
  
  public void run(){
    update();
    display();
  } 
  public float getLocation(){
 return location.y;
  }
  
  public void update(){
    location.add(velocity);
  }
  public void stay(){
  display();
   //ellipse(238,261,20,20);
  }
  public void display(){
    fill(75, 219, 9);
    rect(location.x,location.y,130,height+0.05);
  }
}
