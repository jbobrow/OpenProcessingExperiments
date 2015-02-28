
Particle p;
PImage bathtub;
ArrayList<Particle> particles;
Rectangle rec;
float watherLimit = 242;
String url = "http://farm8.staticflickr.com/7010/13443893484_8acae04227_c";
void setup() {
  bathtub = loadImage(url, "jpg");
  size(800,518);
  particles = new ArrayList<Particle>();
  rec = new Rectangle(new PVector(100, height));
}

void draw() {
  background(0);
  image(bathtub,0,0);
  particles.add(new Particle(new PVector(530, 189)));
  for(int i = 0; i<particles.size(); i++){
    Particle p = particles.get(i);
  //  if(limit < rec.getLocation()){
    p.run();
   // }
    if(p.isDead()){
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
    acceleration = new PVector(0,0.1);
    velocity = new PVector(random(-0.5,0),random(-0.5,0));
    location = l.get();
    lifespan=300;
    
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan-=1;
  }

  void display(){
    int blue1 = color(10, 206, 245);
    //int blue = color(184, 235, 245);
    fill(blue1, lifespan);
   // stroke(blue1, lifespan);
   noStroke();
    ellipse(location.x,location.y,7,13);
  }
  
  /*boolean isDead(){
    if(lifespan<0){
      return true;
    }else{
      return false;
    }
    */
    boolean isDead(){
      if(location.y > watherLimit){
        return true;
      }else{
        return false;
      }
    }
  }

class Rectangle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Rectangle(PVector l){
    location = l.get();
    velocity = new PVector(0,-0.3);
  }
  
  public void run(){
    update();
    display();
  } 
  public float getLocation(){
 return location.x;
  }
  
  public void update(){
    location.add(velocity);
  }
  public void stay(){
  display();
  }
  public void display(){
    fill(75, 219, 9);
    //rect(location.x,location.y,818,height+0.05);
    
  }
}

 





