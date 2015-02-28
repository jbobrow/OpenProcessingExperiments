
float circleColor;
float x, y;
float radius;
int centX = 0; 
int centY = 0;

void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  background(255);
  translate(50, 50);
  for (int x = 0; x < width; x = x + 100) {
    for (int y = 0; y < height; y = y + 100) {
      drawLogo(x, y, x-y);
    }
  }
}

void drawLogo(float x, float y, float circleColor) {
  pushMatrix();
  translate(x, y);
  scale(0.1);
  for (float ang = -90; ang <= 360; ang += 60) {
    float radius = dist(width/2, height/2, 600, 600);
    float rad = radians(ang);
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad));
    stroke(circleColor, 218, 174);
    strokeWeight(50);
    point(x, y);
  }

  for (float ang = -135; ang <= 360; ang += 60) {
    float radius = dist(width/2, height/2, 600, 600);
    float rad = radians(ang);
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad));
    stroke(0, circleColor, 174);
    strokeWeight(40);
    point(x, y);
  }

  for (float ang = -180; ang <= 360; ang += 60) {
    float radius = dist(width/2, height/2, 600, 600);
    float rad = radians(ang);
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad));
    stroke(0, 218, circleColor);
    strokeWeight(30);
    point(x, y);
  }

  for (float ang = -225; ang <= 360; ang += 60) {
    float radius = dist(width/2, height/2, 600, 600);
    float rad = radians(ang);
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad));
    stroke(circleColor);
    strokeWeight(20);
    point(x, y);
  }
  popMatrix();
}


