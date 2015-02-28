

float angle1 = 0.0;
float angle2 = 0.0;
float deltaAngle1 = 0.05; // Spiral rotation speed
float deltaAngle2 = 0.2; // object's rotation speed
int offset = 200; //Controls size of window
float scalar = 2;
float speed = 0.2; //Controls change in amplitude
float colorX;
float colorY;


void setup() {
  size(2*offset, 2*offset);
  smooth();
  background(0);
}

void draw() {

  float x = offset + cos(angle1) * scalar;
  float y = offset + sin(angle1) * scalar;
  translate(x, y);

  colorX = map(x, 0, width, 0, 255);
  colorY = map(y, 0, height, 0, 255);
  fill(colorX, 255-colorX, colorY);

  rotate(angle2);
  rect(-15, -15, 30, 30);
  angle1 += deltaAngle1;
  angle2 += deltaAngle2;
  scalar += speed;
}

void mousePressed() {
  background(0);
   angle1 = 0.0;
   angle2 = 0.0;
   scalar = random(4);
   speed = random(0.5);
   deltaAngle1 = random(0.3); // Spiral rotation speed
   deltaAngle2 = random(0.3); // object's rotation speed
}
