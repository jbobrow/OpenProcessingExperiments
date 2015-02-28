
Drip[] drips = new Drip[10];
int numDrips;
int dripIndex;

float x=50.0;
float speed = 1.0;
float pen = 28.0;
PFont font;
float v = 0.0;
float increment = 0.01;

void setup() {
  size(400,400);
  smooth();
  for (int i = 0; i < drips.length; i++) {
    drips[i] = new Drip();
    numDrips++;
    dripIndex++;
  }
  background(0);
}

void draw() {
  for (int i = 0; i < numDrips; i++) {
    drips[i].move();
    drips[i].display();
  }
}

void mousePressed() {
  if(dripIndex >= drips.length)
    dripIndex = 0;
  drips[dripIndex] = new Drip(mouseX, mouseY);
  dripIndex++;
}

  
class Drip {
  float x,y; //position
  float speed; //speed of drip
  color c; 
  float r; //radius of drip
  float angle;
  float angleChange;
    
  Drip() {
    x = random(width);
    y = random(height);
    c = color(random(255), random(255), random(255));
    r = random(1,5);
    speed = r*random(1);
    angle = random(2*PI);
    angleChange = random(2*PI);
  }
    
  Drip(int xX, int yY) {
    x = xX;
    y = yY;
    c = color(random(255), random(255), random(255));
    r = random(1,5);
    speed = r*random(1);
    angle = random(2*PI);
    angleChange = random(2*PI);
  }
  
  void move() {
    if(x > width-r)
      angle += PI;
    else if(x < r)
      angle -= PI;
    
    if((y > height-r) || (y < r))
      angle = -angle;
      
    float n = noise(v)*angleChange;
    int choice = int(random(2));
    if(choice == 0)
      angle += n;
    else
      angle -= n;
    x += speed * cos(angle);
    y += speed * sin(angle);
  }
    
  void display() {
    fill(c);
    float n = noise(v)*2*r;
    rectMode(CENTER);
    noStroke();
    ellipse(x, y, n, n);
    v = v + increment;
  }
}

