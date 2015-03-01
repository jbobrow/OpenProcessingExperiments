
int numSpots = 90;

Spot[] spots = new Spot[numSpots];

void setup() {
  frameRate(10);
  size(400, 400);
  noStroke();
//  stroke(0);
//  strokeWeight(.3);
  for (int i = 0; i < spots.length; i++) {
    float x = 10 + i*4;
    float rate = 0.5 + i*0.05; // Create each object
    spots[i] = new Spot(x, 50, rate*20, rate);
  }
}

void draw() {
  background(0);
  
  for (int i = 0; i < spots.length; i++) {
    fill(80,i*2,150,160);
    spots[i].move(); // Move each object
    spots[i].display(); // Display each object
  }
}

class Spot {
  float x, y; // X-coordinate, y-coordinate
  float diameter; // Diameter of the circle
  float speed; // Distance moved each frame
  int direction = 1; // Direction of motion (1 is down, -1 is up)
  // Constructor
    Spot(float xpos, float ypos, float dia, float sp) {
      x = xpos;
      y = ypos;
      diameter = dia;
      speed = sp;
    }
 
  void move() {
    y += (speed * direction);
    if ((y > (height - diameter/2)) || (y < diameter/2)) {
      direction *= -1;
  }
  }
  
  void display() {
    x = random(0,400);
  ellipse(x, y, diameter, diameter);
  }
}


