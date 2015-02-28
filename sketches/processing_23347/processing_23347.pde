
public class Particle {
  PVector position;
  PVector velocity;
  PVector particleColor;

  Particle(PVector position, PVector velocity, PVector particleColor) {
    this.position = new PVector(position.x, position.y, position.z);
    this.velocity = velocity;
    this.particleColor = new PVector(particleColor.x, particleColor.y, particleColor.z);
  }

  void updatePosition() {
    position.add(velocity);   
  }

  void draw() {
    stroke(0, 255, particleColor.z);
    vertex(position.x, position.y, position.z);
    stroke(particleColor.x, particleColor.y, particleColor.z);
    vertex(position.x + velocity.x*3, position.y + velocity.y*3, position.z + velocity.z*3);
  }
}


