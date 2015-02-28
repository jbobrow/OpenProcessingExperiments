
class Animal extends Organism {
  float energy; // How much energy does it have?
  float energyConsumption; // How much energy does it use per cycle?
  float appetite; // How much can it eat per cycle?
  float direction;
  float speed;
  Organism nearestFood;
  Organism nearestEnemy;
  Animal(World wo) {
    super(wo);
    energy = 20;
    setSize();
    energyConsumption = 0.01;
    appetite = 0.1;
    direction = random(2*PI);
    speed = constrain(random(5),1,5);
  }
  void setSize() {
    orgSize = energy+4;
  }
  void liveALittle() {
    lookAround();
    move();
    eat();
    energy -= energyConsumption;
    setSize();
  }
  void draw() {
    pushMatrix();
    fill(c);
    translate(x,y);
    rotate(direction);
    float dimX = orgSize;
    float dimY = dimX/2;
    triangle( (-dimX/2),(-dimY/2),(-dimX/2),dimY/2,(dimX/2),0);
    popMatrix();
  }
  void eat() {}
  void lookAround() { }
  void move() {
    float dx = cos(direction)*speed;
    float dy = sin(direction)*speed;
    deflect(dx,dy);
    x += dx;
    y += dy;
 }
  void deflect(float dx, float dy) {
    // Turn if close to world edge
    // If next step would bring animal over edge, reflect direction off edge
    if (x+dx<0 || x+dx>w.sizeX) { // going off left or right edge
      direction = PI-direction;
    }
    if (y+dy<0 || y+dy>w.sizeY) { // going off top edge
      direction = 2*PI-direction;
    }
  }
}

