
class Spot {
  float x, y; // X-coordinate, y-coordinate
  float diameter; // Diameter of the circle
  float speed; // Distance moved each frame
  int direction = 1; // Direction of motion (1 is down, -1 is up)
  
  Spot(float xpos, float ypos, float dia, float sp) {
    x = xpos; 
    y = ypos;
    diameter = dia;
    speed = sp;
  }
  
  void move() {
    y += (speed * direction);
    if ((y > (height - diameter / 2)) || (y < diameter / 2)) {
      direction *= -1; // Bounce of the window edges
    }
  }
  
  void display() {
    ellipseMode(RADIUS);
    imageMode(CENTER);
    image (invade, x, y, diameter, diameter);
  }
}


