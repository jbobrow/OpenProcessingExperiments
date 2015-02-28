
float angle = 0.0;
float centre = 125;
float curl = 2;
float speed = 0.05;

void setup() {
  size(250, 250); 
}

void draw() {
  float x = centre + cos(angle) * curl;
  float y = centre + sin(angle) * curl;
  ellipse( x, y, 2, 2);
  angle += speed;
  curl += speed;
}


