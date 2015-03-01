
ArrayList<Object> objects;
int d = 5;
float sp = 0.009;
float ri = 200.0;
void setup() {
size(600, 600);
smooth();
objects = new ArrayList<Object>();

for (int i = 0; i < (int) width/d; i++) {
    for (int j = 0; j < (int) height/d; j++) {
      objects.add(new Object(new PVector(d*i+d/2, d*j+d/2)));
    }
  }
}

void draw() {
background(0);
for (Object object : objects) {
    object.move();
  }
}

class Object {
  PVector position;
  float s = 0;
  float ang = 0;
float r;

  Object(PVector p_) {
    position = p_;
  }

void move() {
noStroke();
    fill(255);
if (pmouseX != 0 || pmouseY != 0) {
s = sp * det(position.x, position.y, pmouseX, pmouseY, mouseX, mouseY) / (dist(position.x, position.y, mouseX, mouseY) + 1);
ang += s;
r = ri * s + .1;
ellipse(position.x + r*cos(ang), position.y + r*sin(ang), 1, 1);
} else {
   ellipse(position.x, position.y, 1, 1);
}    
}

float det(float x1, float y1, int x2, int y2, int x3, int y3) {
  return (float) ((x3-x1)*(y2-y1) - (x2-x1)*(y3-y1));
}
}

