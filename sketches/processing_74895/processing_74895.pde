
int radius = 250;

float [] xPos = new float [600];
float [] yPos = new float [600];

void setup() {
  size(600, 600);
  smooth();
  background(0);
  for (int i = 0; i < xPos.length; i++) {
    int deg = i * 1;
    float angle = radians(deg);
    xPos[i] = cos(angle) * radius;
    yPos[i] = sin(angle) * radius;
  }
  translate(width/2, height/2);
  for (int i = 0; i < xPos.length; i++) {

    int p1 = (int)random(360);
    int p2 = (int)random(360);

    stroke(random(255), random(255), random(255));
    line(xPos[p1], yPos[p1], xPos[p2], yPos[p2]);
  }
}

void draw() {
}
