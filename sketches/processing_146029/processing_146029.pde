
ArrayList<PVector> particles;
ArrayList<PVector> vels;
float max_radius;
PVector center;
PVector cursor;
float scale;
int width, height;
 
void setup() {
  width = 640; height = 640;
  size(width, height);
  frameRate(1000);
  scale = .01;
   
  max_radius = 0;
  center = new PVector(width*.5, height*.5);
  cursor = new PVector(0, height);
   
  particles = new ArrayList<PVector>();
  vels = new ArrayList<PVector>();
  for (int i = 0; i < 50; i++) {
    particles.add(new PVector(center.x, center.y, random(0, 255)));
    vels.add(new PVector(0,0,0));
  }
     
  background(0);
  fill(0, 0, 0, 0);
}
 
void draw() {
    for (PVector v : vels) {
        v.x += random(-1,1);
        v.y += random(-1,1);
    }
    
  for (PVector p : particles) {
      stroke(0, p.z, 255, 75);
      point(p.x, p.y);
      p.x += v.x;
      p.y += v.y;
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

