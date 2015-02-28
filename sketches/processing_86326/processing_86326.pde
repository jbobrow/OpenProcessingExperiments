
// Classe delle particelle colorate.

class Particle {
  int radius;
  boolean clicked;
  color c = color(0,0,random(100,255));
  PVector position, velocity, acceleration;
  public boolean isAlive;
  
  public Particle() {};
  public Particle(float x,float y,int radius) {
    position = new PVector(x,y);
    velocity = new PVector(random(-2,2),random(-2,2));
    this.radius = radius;
    acceleration = new PVector(random(-0.3,0.3),random(-0.3,0.3));
    isAlive = true;    
  }
  void display() {
    if(isAlive) {
      noStroke();  
      fill(c);
      ellipse(position.x,position.y,radius,radius);
    }
  }
  void update(float a) {
    acceleration.mult(a);
    velocity.add(acceleration);
    velocity.limit(5);
    if(abs(velocity.x)< 0.9 && abs(velocity.y)< 0.9) {
      isAlive = false;
    }
    position.add(velocity);
    if(position.x < -radius || position.x > width+radius || position.y > height+radius || position.y < -radius) {
      isAlive = false;
    }  
  }
  
  void setColor(color c) {
    this.c = c;
  }
}

