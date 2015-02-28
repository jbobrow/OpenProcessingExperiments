
class AvatarFish extends Fish {
  int invincibleCount;
  boolean invincible, growth;

  AvatarFish(float xPos, float yPos) {
    super();
    velocity= new PVector (7, 7);
    pos=new PVector (xPos, yPos);
    fishScale = 0.2;
    invincibleCount=0;
  }

  void checkInvincibility() {
    if (invincibleCount>0) {
      invincible=true;
      invincibleCount--;
    }
    else {
      invincible=false;
    }
  }

  void moveRight() {
    if (velocity.x < 0)velocity.x *= -1;
    pos.x += velocity.x;
  }
  void moveLeft() {
    if (velocity.x > 0)velocity.x *= -1;
    pos.x += velocity.x;
  }
  void moveUp() {
    pos.y -= velocity.y;
  }
  void moveDown() {
    pos.y += velocity.y;
  }

  void eat(Fish other) {
    if ((fishSize*fishScale) > (other.fishSize*other.fishScale)) { 
      if (fishScale<2 && growth) { 
        fishScale *= 1.05;
        growth=false;
      }
    }
    else {
      this.fishAlive = false;
      if(!invincible){
        lives--;
        lifeTextSize=100;
      }
      
    }
  }

  void avtDeath() {  
    invincibleCount=60;
  }

  boolean checkHeadOn(Fish other) {
    if (velocity.x*other.velocity.x < 0 && abs(pos.y-other.pos.y) < max((fishSize*fishScale)/8, (other.fishSize*other.fishScale)/8)) {
      return true;
    }
    return false;
  }

  void drawFish() {
    super.drawFish();
  }

  void drawInvincibleFish() {
    if (invincible && invincibleCount%6==0) {
      super.drawFish();
    }
  }
}

