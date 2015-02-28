
class Walker {
  float x, y;
  float a = 0.0;
  float sz = 800;
  float size;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void display() {
    //a = map(mouseX, 0, width, 10, 50);
    a += .01;
    //println(a);    
    fill(random(100), 80, 90, a);
    size = random(sz*.75, sz);
    stroke(0);
    ellipse(x, y, size, size);
  }

  void step() {
    float stepx = random(-50, 50);
    float stepy = random(-50, 50);
    x += stepx;
    y += stepy;
  }
}

Walker w;
float sz;

void setup() {
  size(800, 600);
  w = new Walker();
  background(0);
  colorMode(HSB, 100);
}

void draw() {
  w.step();
  w.display();
  }
