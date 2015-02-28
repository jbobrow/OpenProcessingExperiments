
float offset =60;
float angle = 0.0;
float scalar = 2;
float x;
float y;
float speed = 5.1;
int centX = 250;
int centY = 150;

void setup() {
size(500, 300);
background(255);
strokeWeight(0.5);
stroke( random(70), random(30), random(30));
smooth();
}

void draw() {

    float x= offset + cos(angle) * scalar+ random(2);
    float y = offset +sin(angle) * scalar +random (2);
    line (x, y, 250, 150);
    angle += speed;
    scalar += speed;
  }
 





