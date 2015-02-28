

float rad = 300;


void setup() {
  size(800, 800);
  smooth();
}

void draw() {

  background(0);
  translate (width/2, height/2);

  for (int i=0; i<360; i+=1) {
    float angle = radians(i);
    float angle2 = random(angle);
    float x = cos(angle) * rad;
    float y = sin(angle) * rad;
    float x2 = cos(angle2) * rad;
    float y2 = sin(angle2) * rad;
    stroke (random(255), random(255), random(255));

    line (x, y, x2, y2);
  }

  for (int i=20; i<360; i+=1) {
    float angle = radians(i);
    float angle2 = random(angle);
    float x = cos(angle) * rad;
    float y = sin(angle) * rad;
    float x2 = cos(angle2) * rad;
    float y2 = sin(angle2) * rad;
    stroke (random(255), random(255), random(255));

    line (x, y, x2, y2);
  }
}


