
float rot = 0;
float gruen = 0;
float blau = 0;
int X = 0;
int Y = 0;
boolean addierenX = true;
boolean addierenY = true;

void setup() {
  size(100, 600);
}

void draw() {
  background(255);
  move();
  display();
}

void mousePressed() {
  // Zufallsfarbe für Kreis
  rot = random(0, 256);
  gruen = random(0, 256);
  blau = random(0, 256);
}

void move() {
  if ((X + 10) == width)
    addierenX = false;
    
  if ((X - 9) == 0)
    addierenX = true;
    
  if ((Y + 10) == height)
    addierenY = false;
    
  if ((Y - 9) == 0)
    addierenY = true;
  
  if (addierenX)
    X = X + 1;
  else
    X = X - 1;
    
  if (addierenY)
    Y = Y + 1;
  else
    Y = Y - 1;
}

void display() {
  noStroke();
  fill(rot, gruen, blau);
  ellipse(X,Y,20,20);
}


