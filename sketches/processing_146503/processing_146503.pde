
ArrayList<PVector> particles;
float max_radius;
PVector center;
PVector cursor;

void setup() {
  size(640,740);
  frameRate(1000);
  
  max_radius = 0;
  center = new PVector(320, 320);
  cursor = new PVector(0, 640);
  
  particles = new ArrayList<PVector>();
  for (int i = 0; i < 1000; i++) {
    particles.add(new PVector(center.x, center.y, random(0, 255)));
  }
    
  background(0);
  fill(0, 0, 0, 0);
}

void draw() {
  for (PVector p : particles) {
      stroke(p.z, 0, 255, 75);
      point(p.x, p.y);
      p.x += random(-1, 1);
      p.y += random(-1, 1);
      float d = sqrt((p.x-center.x)*(p.x-center.x) + (p.y - center.y)*(p.y - center.y));
      if (d > max_radius)
      {
        max_radius = d;
      }
  }
  
  stroke(30, 30, 30);
  fill(0, 0, 0, 0);
  ellipse(center.x, center.y, 2*max_radius, 2*max_radius);
  
  stroke(255, 255, 255);
  cursor.x += .05;
  cursor.y = 740 - 100*(max_radius/320);
  point(cursor.x, cursor.y);
  
  stroke(255, 0, 0, 100);
  point(cursor.x, 740 - 2.5*sqrt(cursor.x));
}
