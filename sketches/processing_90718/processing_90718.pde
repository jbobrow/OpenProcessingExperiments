
int numSpots = 90;
Spot[] spots = new Spot[numSpots];
boolean on = false;
void setup() {
size(100, 500);
smooth();
noStroke();
for (int i = 0; i < spots.length; i++) {
float rate = 0.5 + i*0.05;
float y= i*10;
spots[i] = new Spot(random(width), y, random(15), rate);
}
}

void draw() {
fill(0, 12);
rect(0, 0, width, height);
fill(255);
  for (int i = 0; i < spots.length; i++) {
    spots[i].move(); 
    spots[i].display(); 
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
x += (speed * direction);
  if ((x > (width - diameter)) || (x < diameter)) {
  direction *= -1;
  }
}  

void display() {
  fill(color(random(255), random(150), random(255)));
  ellipse(x, y, diameter, diameter);
  }
}


