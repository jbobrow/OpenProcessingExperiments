
class Particle {

  PVector loc, vel, decay; //stores xy pos, speed of travel, radius of particles
  float rad;              //rate of which particles slow down over time

  int age, lifeSpan;    //age (in frames) of particles & how long they can live
  boolean isDead;      //flag which the ParticleSystem checks to see if it should update or remove the particle
  float agePer;

  float space, i;
  int centre = 400; 

  Particle(PVector l) 
  {
    loc = l;
    vel = new PVector(random(-2, 2), random(-2, 2));
    decay = new PVector(0.95, 0.95); //speed which particles slow down
    age = 0;
    lifeSpan = (int)random(50, 200);
    isDead = false;
    rad = random(0.0025, 5.00);
    color c;
  }

  void update() {
    age++;
    agePer = 1.0 - (age/ (float) lifeSpan);
    rad = 5.0 * agePer;
    loc.add(vel);
    vel.mult(decay);

    if(age > lifeSpan) {

      isDead = true;
    }
  }

  void draw() {

    c = HSB; 
    fill(0, 10);
    
    stroke(195);
    strokeWeight(random(0.02, 1.0));
    smooth(); 

    variableEllipse(mouseX, mouseY, pmouseX);
  }

  void variableEllipse(int x, int y, int px) {
    float speed = abs( x - px) + abs (y - px);
    stroke(speed);
    point(loc.x, loc.y, speed+rad);
    smooth();
  }
}


