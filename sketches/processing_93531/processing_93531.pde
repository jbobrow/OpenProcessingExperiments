
ArrayList particles;
int LIFESPAN = 100;
PVector acceleration =  new PVector(0f, 0.03);
color pColor;
 
void setup() {
 size(500, 500);
 noStroke();
 pColor=color(255, 0, 0);
 smooth();
 particles = new ArrayList();
}
 
void draw() {
  background(0);
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

void mouseClicked(){
  pColor=color(255, random(0,255), 0);
}
 
public class Particle {
  PVector location;
  PVector velocity;
  int age;
  float w;
 
  public Particle() {
      location = new PVector(mouseX, mouseY);
      velocity = new PVector(mouseX-pmouseX, mouseY-pmouseY);
      w = 35;
      age = 0;
  }
 
  public boolean exist() {
     velocity.add(acceleration);
     location.add(velocity);
     ellipse(location.x, location.y, w, w);
     if (age > LIFESPAN) {
       return false;
     }
     age++;
     w=w-0.3;
     fill(pColor, 255-2*age);
     return true;
  }
 
}
