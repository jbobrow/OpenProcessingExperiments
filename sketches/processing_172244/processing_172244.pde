
float circleDiam = 0;
ArrayList n;
int i = 0;
int j = 0;
float x = 100;
float y = 100;
void setup() {
  background(0);
  size(800, 500, P3D);
  n = new ArrayList();
}

void draw() {
  rectMode(CENTER);
  noFill();
  oneSpiralLoop();
}



void oneSpiralLoop() {
  float j= random(10, 120);
  n.add(new Sphere());
  Sphere b = (Sphere) n.get(0);
  x = x*.01+(circleDiam* .1) * cos(radians(circleDiam)+j);
  y = y*.01+(circleDiam* .1) * sin(radians(circleDiam));
  b.display(x, y);
  
  if (circleDiam > 10000) {
    circleDiam = 0;
    n.remove(0);
  }
  circleDiam++;
}


class Sphere {
  float r = random(0, 255);
  float diameter = random(0, 50);
  Sphere() {
  }

  void update() {
  }
  
  void display(float xpos, float ypos) {
    stroke(255);
    pushMatrix();
    translate(xpos+100, ypos+200);
    fill(random(10), 150, 210);
    sphere(diameter);
    popMatrix();
  }
}
