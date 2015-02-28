
/**
 * A simple class to handle particles
 */
class Particle {
  
  PVector pos, dep;
  float a;
  float age, growth, s;
  float r;
  
  Particle(float px, float py, float a) {
    this.pos = new PVector(px, py);
    this.a = a;
    this.dep = new PVector(cos(a), sin(a));
    this.r = random(100);
    this.growth = growth_factor*(0.01 + random(0.01));
  }
  
  void model() {
    this.age += this.growth;
    this.s = 3*(1 - this.age);
    this.a += constrain(this.age*straight_factor, 0.0, 1.0)*angle_wide*(0.5 - noise(r + n));
    this.dep = new PVector(cos(a), sin(a));
    this.dep.mult(speed);
    this.pos.add(this.dep);
    if (random(1.0) < break_prob) {
      this.age = 0.99;
      if (!nobunch && particles.size() < max_particles) {
        generateBunch(this.pos.x, this.pos.y);
      }
      /*
      else {
        noFill(); stroke(0, transparency); strokeWeight(random(5));
        float f = random(5);
        ellipse(this.pos.x, this.pos.y, f*size_factor*this.s, f*size_factor*this.s);
      }
      */
    }
  }
  
  void view(PGraphics g) {
    g.fill(this.s, transparency);
    g.noStroke();
    g.pushMatrix();
      g.translate(this.pos.x, this.pos.y);
      //ellipse(0, 0, this.s, this.s);
      g.rotate(this.a);
      g.rect(0, 0, size_factor*this.s, size_factor*this.s);
    g.popMatrix();
  }
  
  boolean isAlive() {
    return (age < 1.0);
  }
  
}


