
class Boule {
  float posX, posY;
  float velX, velY;
  float radius = BOULE_RADIUS;
  float strength = 0;
  int multi;
  Oscillator osc;
  
  Boule(float x, float y, int multi) {
    this.posX = x;
    this.posY = y;
    this.multi = multi;
  }
  
  void setVelocity(float speed, float direction) {
    velX = speed * cos(direction);
    velY = speed * sin(direction);
  }

  float getSpeed() {
    return sqrt(velX * velX + velY * velY);
  }
  
  float getDirection() {
    return atan2(velY, velX);
  }
  
  float getTransparency(float r) {
    return (r < radius) ? 0 : (r < radius + 1) ? r - radius : 1;
  }
  
  float speedFactor(float s, float theta) {
    return cos(getDirection() - theta) * getSpeed() / s;
  }
  
  boolean collidesWith(Boule other) {
    return dist(this.posX, this.posY, other.posX, other.posY) <= this.radius + other.radius;
  }
  
  void update(float dt) {

    // Update position
    posX += velX * dt;
    posY += velY * dt;

    // Check for collision with left/right edge
    if (posX < radius) {
      posX = 2 * radius - posX;
      velX = -velX;
    }
    else if (posX >= width - radius) {
      posX = 2 * (width - radius) - posX;
      velX = -velX;
    }

    // Check for collision with top/bottom edge
    if (posY < radius) {
      posY = 2 * radius - posY;
      velY = -velY;
    }
    else if (posY >= height - radius) {
      posY = 2 * (height - radius) - posY;
      velY = -velY;
    }

    // Recalculate strength
    float decay = BOULE_ATTEN * strength * exp(-dt);
    if (strength > decay)
      strength -= decay;
    else
      strength = 0;

    // Update oscillator amplitude
    osc.setAmp(VOLUME * strength / multi);
  }
}

