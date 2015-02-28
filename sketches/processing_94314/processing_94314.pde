
//Particle[] particles;
//int NUM_PARTICLES = 100;
ArrayList particles;
int LIFESPAN = 100;
PVector acceleration =  new PVector(0f, 0.01);
int baseAngle;
color backgroundCol, strokeCol, fillCol;
 
void setup() {
 colorMode(HSB, 360, 50, 100);
 background(0);
 size(800, 400);
 //stroke(0);
 strokeWeight(3);
 //fill(150);
 smooth();
 particles = new ArrayList();
}
 
void draw() {
  background(0);
  //Partikel generieren wenn maus sich bewegt
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
 
void mousePressed() {
  baseAngle = (int)random(0,360); //Grundfarbe setzen
  backgroundCol = color(baseAngle, 30, 50+random(50));
  strokeCol = color((baseAngle+120) % 360, 30, 50+random(50));
  fillCol = color((baseAngle+240) % 360, 30, 50+random(50));
   
  //background(backgroundCol);
  //background(0);
  stroke(strokeCol, 50);
  fill(fillCol, 75);
}
 
public class Particle {
  PVector location;
  PVector velocity;
  int life;

  public Particle() {
      location = new PVector(mouseX, mouseY);
      //geschwindigkeit abhängig von mausbewegung
      velocity = new PVector(mouseX-pmouseX, mouseY-pmouseY);
      life = 0;
  }

  public boolean exist() {
     velocity.add(acceleration);
     location.add(velocity);
     ellipse(location.x, location.y, 10, 10);
     if (life > LIFESPAN) {
       return false;
     }
     life++;
     return true;
  }

}
