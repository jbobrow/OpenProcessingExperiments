
class EnemyBall {
  
  // DATA
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxSpeed;
  float bWidth;
  color bColor;
  PVector playerWeapon;
  float playerWeaponMagnitude;
  
  // CONSTRUCTOR
  EnemyBall() {
    location = new PVector(width/2,width/2);
    velocity = new PVector(0,0);
    maxSpeed = 4.0;
    bWidth = 22;
    bColor = #FF3300;
  }
 
  // FUNCTIONS 

  // Calculate object acceleration. Add it to velovity and set max speed. Add velocity to location.
  void update() {
    acceleration = new PVector(random(-0.25,0.25),random(-0.25,0.25));    
    velocity.add(acceleration);
    velocity.limit(maxSpeed);    
    location.add(velocity);
  }
  
  // Calculate object acceleration. Add it to velovity and limit. Add velocity to location.  
  void player() {
    playerWeapon = new PVector(mouseX,mouseY);
    playerWeapon.sub(location);
    playerWeaponMagnitude = playerWeapon.mag();
  }
  
  // Execute this if, the player is close to object
  boolean hit() {
    player();
    
    if (playerWeaponMagnitude < 11) {
      return true;
    } else {
      return false;
    }
  }
  
  // Visualize object  
  void display() {
    ellipseMode(CENTER);
    fill(bColor, 220);
    ellipse(location.x,location.y,bWidth,bWidth);  
  }
  
  // Reverse velocity x or y when hitting a wall  
  void checkEdges() {
    if ((location.y > (height-11)) || (location.y < 11)) {
        velocity.y = velocity.y * -1;
    }
    if ((location.x > (height-11)) || (location.x < 11)) {
      velocity.x = velocity.x * -1;
    }
  }
}

