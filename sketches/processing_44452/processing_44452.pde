
int numSpots = 30; //Declares and creates the array
Spot[] spots = new Spot[numSpots];

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  for (int i = 0; i < spots.length; i++) {
    float x = 10 + i*16;
    float rate = 0.5 + i*0.05; // Creates each of the objects
    spots[i] = new Spot(x, 50, 16, rate);
  }
}

void draw() {
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  for (int i = 0; i < spots. length; i++) {
    spots[i].move(); //Moves each of the spots
    spots[i].display(); //Displays each of the objects
  }
}

class Spot {
  float x, y;
  float diameter;
  float speed;
  int direction = 1;

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
    ellipse(x, y, diameter, diameter);
  }
}


