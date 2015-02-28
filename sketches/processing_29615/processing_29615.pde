
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float topspeed;

  color his_color;



  Mover() {
    location = new PVector (random(width), random(height));
    topspeed = 10;
    velocity = new PVector (0, 0);
    acceleration = new PVector (0, 0);
  }


  void update() {
    PVector mouse = new PVector(mouseX, mouseY);

    PVector dir = PVector.sub(icon, location);

    float wiggly = random(0.5);

    PVector wiggle = new PVector(wiggly, wiggly);

    dir.normalize();

    dir.add(wiggle);

    dir.mult(2.5);

    acceleration = dir;


    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(topspeed);
    
  }

  void his_color(color colaa) {

    his_color = colaa;
  }
  void display() {
    noStroke();
    fill(his_color);
    ellipse(location.x, location.y, 20, 20);
  }


  void checkEdges() {
    if (location.x > width) {
      velocity.x = -1 * velocity.x;
    }
    else if (location.x < 0) {
      velocity.x = -1 * velocity.x;
    }

    if (location.y > height) {
      velocity.y = -1* velocity.y;
    }
    else if (location.y < 0) {
      velocity.y = -1* velocity.y;
    }
  }

  int check_hit() {
    return 0;

  
      }
}


