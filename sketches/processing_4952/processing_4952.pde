
class Bird extends Particle {
  float angle = 0.0;
  float birdSize = 3.0;

  Bird(int ix, int iy, float ivx, float ivy){
    super(ix, iy, ivx, ivy); 
  }

  void update() {
    super.update();
    float dx = mouseX - super.x;
    float dy = mouseY - super.y;
    angle = atan2(dy, dx); 
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(angle+PI/2);
    scale(birdSize);
    strokeWeight(1.0/birdSize);
    line(1, 0, 0, 3);
    line(1, 0, 2, 3);
    popMatrix();
  }
}



