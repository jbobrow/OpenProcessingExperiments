
ArrayList particles;
int LIFESPAN = 500;
//global gravity
PVector acceleration =  new PVector(0f, 0.025);

void setup() {
 size(600, 600); 
 stroke(0);
 strokeWeight(3);
 fill(150);
 smooth();
 particles = new ArrayList();
}

void draw() {
  background(255);
  //only create when mouse moves
  if (abs(mouseX-pmouseX) > 0.0001) {
    particles.add(new Particle()); 
  } 
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = (Particle)particles.get(i);
    if(!p.exist()) {
      particles.remove(i);  
    }
  }  
}


public class Particle {
  PVector location;
  PVector velocity;
  int age;
  
  public Particle() {
      location = new PVector(mouseX, mouseY);
      //get velocity from direction and speed of mouse movement
      velocity = new PVector(mouseX-pmouseX, mouseY-pmouseY);   
      age = 0;
  }
 
  public boolean exist() {
     velocity.add(acceleration);
     location.add(velocity);
     if (location.x > width || location.x < 0)
       velocity.x*=-1;
     if (location.y > height || location.y < 0)
       velocity.y *= -1;
     ellipse(location.x, location.y, 10, 10); 
     if (age > LIFESPAN) {
       return false;
     } 
     age++;
     return true;
  }
    
}
