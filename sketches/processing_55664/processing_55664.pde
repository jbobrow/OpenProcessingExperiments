
class Drop {
  PVector loc, vel, colour;
  float weight;
  
  public Drop(float weight, PVector start, PVector start_vel,
              float r, float g, float b) {
    this.weight = weight;
    this.loc = start;
    this.vel = start_vel;
    this.colour = new PVector(r,g,b);
  }
  
  public void draw() {
    noStroke();
    fill(colour.x, colour.y, colour.z);
    pushMatrix();
      translate(loc.x, loc.y, loc.z);
      sphere(weight);
    popMatrix();
    
    loc.add(vel);
    vel.z += gravity;
  }
}

