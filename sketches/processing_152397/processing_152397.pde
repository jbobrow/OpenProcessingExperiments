
int n; // dimensions of points matrix
int m; // n x m = total number of points
PVector[] points;
float pointsMargin;

float radius;

PVector particle;
PVector pvelocity;

void setup() {
  size(400, 400); 
  
  pointsMargin =  50;
  
  particle = new PVector(width / 2, height / 2);
  pvelocity = new PVector(random(-1, 1), random(-1, 1));
  
  // setting points
  n = 15;
  m = 15;
  points = new PVector[n * m];
  for(int i = 0; i < n; i++) {
    for(int j = 0; j < m; j++) {
      float x = pointsMargin + (width - pointsMargin*2) * i / (float) (n - 1);
      float y = pointsMargin + (height - pointsMargin*2) * j / (float) (m - 1);
      points[m * i + j] = new PVector(x, y);
    }    
  }
  radius = min((width - pointsMargin*2) / (float) (n - 1), (height - pointsMargin*2) / (float) (m - 1));
  
  background(255);
}

void draw() {
  background(255);
  
  moveParticle();

  strokeWeight(1);
  stroke(0, 128);

  point(particle.x, particle.y);
  
  for(int i = 0; i < points.length; i++) {
    if(dist(particle.x, particle.y, points[i].x, points[i].y) < 2 * radius) {
      line(particle.x, particle.y, points[i].x, points[i].y);
    }
  }

  // drawPoints();
}

void moveParticle() { 

  particle.add(pvelocity);

  PVector accel = new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
  pvelocity.add(accel);
  pvelocity.limit(3);
  
  if (particle.x > width - pointsMargin) {
    particle.x = width - pointsMargin;
    pvelocity.x *= -1;
  }

  if (particle.x < pointsMargin) {
    particle.x = pointsMargin;
    pvelocity.x *= -1;
  }
  
  if (particle.y > height - pointsMargin) {
    particle.y = height - pointsMargin;
    pvelocity.y *= -1;
  }
  
  if (particle.y < pointsMargin) {
    particle.y = pointsMargin;
    pvelocity.y *= -1;
  }
}


void drawPoints() {  
  stroke(0);
  strokeWeight(0.5);
  for(int i = 0; i < points.length; i++)
    point(points[i].x, points[i].y);
}

void mouseMoved() {
  pvelocity = new PVector(mouseX - particle.x, mouseY - particle.y);
  pvelocity.limit(4);
}
