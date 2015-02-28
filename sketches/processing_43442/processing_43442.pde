
float x, y;
float radius;
float angle = 0.0;
int centX = 0; 
int centY = 0;

void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  background(255);
  
  translate(width/2, height/2);
  
  float circleAlpha = map(mouseX, 0, width, 0, 255);
  float circleScale = map(mouseX, 0, width, 0, 1.2);
  scale(circleScale);
  
  rotate(angle);
  angle += -.002;
  
  for (float ang = -90; ang <= 360; ang += 60) {
    float radius = dist(width/2, height/2, 600, 600);
    float rad = radians(ang);
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad));
    stroke(0, 218, 174, circleAlpha);
    strokeWeight(50);
    point(x, y);
  }

  for (float ang = -135; ang <= 360; ang += 60) {
    float radius = dist(width/2, height/2, 600, 600);
    float rad = radians(ang);
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad));
    strokeWeight(40);
    point(x, y);
  }

  for (float ang = -180; ang <= 360; ang += 60) {
    float radius = dist(width/2, height/2, 600, 600);
    float rad = radians(ang);
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad));
    strokeWeight(30);
    point(x, y);
  }

  for (float ang = -225; ang <= 360; ang += 60) {
    float radius = dist(width/2, height/2, 600, 600);
    float rad = radians(ang);
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad));
    strokeWeight(20);
    point(x, y);
  }
}


