
float x, y;
float radius;
float angle = 0.0;
int centX = 0; 
int centY = 0;
int xStart;
int yStart; 
int diamX; 
int diamY; 

void setup() {
  size(800, 800);
  smooth();
  xStart = 400;
  yStart = 400;
  diamX = 280;
  diamY = 40;
}

void draw() {
  background(255);
  for (float i = 0; i < 20; i++) {
    pushMatrix();
    noFill();
    translate(xStart, yStart);
    rotate(radians(i*mouseY));
    stroke(0, 218/i, 174/i);
    drawLogo(mouseX, 0);
    popMatrix();
  }
  drawLogo(width/2, height/2);
}

void drawLogo(float x, float y) {
  pushMatrix();
  translate(x, y);
  rotate(angle);
  angle += -.001;
  for (float ang = -90; ang <= 360; ang += 60) {
    float radius = dist(width/2, height/2, 600, 600);
    float rad = radians(ang);
    x = centX + (radius * cos(rad)); 
    y = centY + (radius * sin(rad));
    stroke(0, 218, 174, 100);
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
  popMatrix();
}


