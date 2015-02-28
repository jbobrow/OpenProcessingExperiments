
class Creature {
  color creatureColor; // the color of the creature
  Pos position; // the position of the creature
  float deltaScale;
  float aggroLevel;
  float speed;
  float angle;
  int energy;

  Creature(int cSizeX, int cSizeY) {
    this.creatureColor = color((int) random(0, 255), (int) random(0, 255), (int) random(0, 255));
    this.position = new Pos( (int) random(0, 500), (int) random(0, 500));
    this.speed = random(0, 1);
    this.angle = random(0, 3);
    this.aggroLevel = random(0, 25) * (sin(blue(this.creatureColor))+sin(red(this.creatureColor))+ sin(green(this.creatureColor)));
    this.deltaScale = random(0, 2) * (blue(this.creatureColor) + red(this.creatureColor) + green(this.creatureColor))/3;
    this.energy = 35;
  }
  
  void leechColor(PImage img){
    this.creatureColor = img.get(this.position.getX(), this.position.getY());
  }

  void drawCreature(int drawSize) {
    fill(this.creatureColor);
    ellipse(this.position.getX(), this.position.getY(), drawSize, drawSize);
  }

  void moveCreature() {
    int newX = this.position.getX() + (int) (speed * cos(this.angle));
    int newY = this.position.getY() + (int) (speed * sin(this.angle));

    if (newX > 500)
      newX = 0;
    if (newY > 500)
      newY = 0;

    if (newX < 0)
      newX = 500;
    if (newY < 0)
      newY = 500;

    // update creature postion
    this.position.setX(newX);
    this.position.setY(newY);
  }


  void computeColor(PImage img) {
    color pointColor = img.get(this.position.getX(), this.position.getY());

    float colorDelta = abs(red(this.creatureColor) - red(pointColor)) + 
      abs(blue(this.creatureColor) - blue(pointColor)) + 
      abs(green(this.creatureColor) - green(pointColor));

    if (colorDelta > this.aggroLevel)
      this.energy = this.energy - 1;
    else
      this.energy = this.energy + 1;

    this.angle = this.angle + ( (sin(blue(pointColor))+sin(red(pointColor))+ sin(green(pointColor))) * this.deltaScale);
    this.speed = (((1 / (blue(pointColor) + 1)) + (1 / (red(pointColor) + 1)) + (1 / (green(pointColor) + 1))) + 1);
    if (colorDelta > this.aggroLevel)
      img.set(this.position.getX(), this.position.getY(), this.creatureColor);
  }

  int getEnergy() {
    return this.energy;
  }
}


