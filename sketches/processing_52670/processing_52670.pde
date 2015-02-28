

int sides = 8;

void setup() {
  size(800, 800);
  background(255);
  smooth();
}

void draw() {
  background(random(255));

  translate(width/2, height/2);

  rotate(radians(frameCount));

  boolean b = false;
  for (int i = 400; i > 200; i-=10)
  {
    if (b) {
      fill(13, 180, 159);
    }
    else fill (79, 89, 59);

    b = !b;
    createPoly(sides, i, 0, 0);
  } 

  fill(136, 232, 207);
  strokeWeight(5);
  stroke(100);
  int distanceBetweenCircles = 20;
  for (int i = 300; i > 40; i-=distanceBetweenCircles)
  {

    drawCircle(i);
  }
}

void drawCircle(int radius) {
  ellipse(0, 0, radius, radius);
}

void createPoly(int sides, float radius, float xPos, float yPos) {


  float theta = (PI * PI) - .25 * PI;
  int counter = 0;

  beginShape();
  while (counter < sides) {
    float x = xPos + cos(theta)*radius; 
    float y = yPos + sin(theta)*radius;

    vertex(x, y);
    theta = theta + TWO_PI/sides;
    counter = counter +1;
  }
  endShape(CLOSE);
}


