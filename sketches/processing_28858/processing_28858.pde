
class Ball
{
  FCircle expanding_circle;
  int grow_speed;
  boolean growing = false;
  float diam;
  Ball(float diam, int grow_speed) {
    this.expanding_circle = new FCircle(diam);
    this.grow_speed = grow_speed;
    this.diam = diam;
  }
  void scale() {
    float r = expanding_circle.getSize()/2.0+grow_speed/2.0;
    float newX = mouseX;
    float newY = mouseY;

    if (mouseX-r < 7) {
      newX = 6+r;
    } 
    if (mouseX+r > width -7) {
      newX = width-6-r;
    }
    if (mouseY-r < 7) {
      newY = 6+r;
    }
    if (mouseY+r > height-7-40) {
      newY = height-6-40-r;
    }
    if (2*r > min(height-12-40,width-12)) {
      filled_area += expanding.getArea()/total_area;
      diam = 0;
      growing = false;
      return;
    }
    diam = expanding_circle.getSize()+grow_speed;
    expanding_circle = new FCircle(diam);
    style();
    expanding_circle.setPosition(newX,newY);
  }
  void style() {
    expanding_circle.setFill(map(diam,0,min(height-12-40,width-12),0,255),255-map(diam,0,min(height-12-40,width-12),0,255),0);
    expanding_circle.setStrokeWeight(2);
    expanding_circle.setRestitution(0.4);
  }
  boolean isGrowing() {
    return growing;
  }
  void setGrowing(boolean value) {
    growing = value;
  }
  void addToWorld(FWorld world) {
    world.add(expanding_circle);
  }
  void removeFromWorld(FWorld world) {
    world.remove(expanding_circle);
  }
  FBody getBody() {
    return expanding_circle;
  }
  float getArea() {
    return PI*diam*diam/4;
  }
}

class Enemy {
  FCircle enemy;
  float enemy_speed;
  Enemy(float diam, float speed) {
    this.enemy = new FCircle(diam);
    this.enemy.setRestitution(1);
    this.enemy.setPosition(random(15,width-15),random(15,height-40-15));
    this.enemy.setVelocity(random(-5,5),random(-5,5));
    this.enemy.setNoStroke();
    this.enemy.setFill(255,0,0);
    this.enemy_speed = speed;
  }
  void addToWorld(FWorld world) {
    world.add(enemy);
  }
  void constantVelocity() {
    float vel_x = enemy.getVelocityX();
    float vel_y = enemy.getVelocityY();
    float velocity = sqrt(vel_x*vel_x+vel_y*vel_y);
    enemy.adjustVelocity(vel_x*(enemy_speed/velocity-1),vel_y*(enemy_speed/velocity-1));
      enemy.addForce(0,-132.5); //TODO: get correct anti-gravity via body mass
  }
  FBody getBody() {
    return enemy;
  }
}


