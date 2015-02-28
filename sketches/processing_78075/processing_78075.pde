
class Circle {

  //float x=0, y=0;
  //float vx = 1, vy = 1;
  PVector velocity, acceleration, location;

  int radius = 10;

  Circle(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector( random(1, 3),  random(1, 2) );
    acceleration = new PVector();
  }

  void render() {
    stroke(0);
    strokeWeight(2); //radius);
        
    point(location.x, location.y); 
    renderVelocity();
  }

  void renderVelocity() {
    //PVector velocity = 
  }

  void stayInStage(int w, int h) {
    if(location.x>w) {
      location.x-=1; 
      velocity.mult(-1);
    }
    if (location.x<0) {
      location.x++;
      velocity.mult(-1);
    }
    if(location.y>h) {
      location.y-=10;
      velocity.mult(-1);
    }
    if (location.y<0) {
      location.y++;
      velocity.mult(-1);
    }
  }

  void move() {
    velocity.add(acceleration);
    location.x += velocity.x;
    location.y += velocity.y;
    
  }

  void applyForce(PVector force) {
    acceleration.add(PVector.div(force, radius));
  }

}



