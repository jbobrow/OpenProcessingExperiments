
float n1, n2, n3, n4; // noise values
int num = 2000; // number of dancers

Dancer master;
Dancer[] pupil;

void setup() {
  size(600, 400);
  background(255);
  noFill();
  frameRate(6);
  n1 = random(10);
  n2 = random(10);
  n3 = random(10);
  n4 = random(10);
  pupil = new Dancer[num];
  for (int i = 0; i < num; i++) {
    pupil[i] = new Dancer(random(width), random(height + 100), random(100), 
                          color(random(255), random(255), 0), int(random(255)), int(random(5)), 1);
  }
}

void draw() {


  for (int i = 0; i < num; i++) {
    pupil[i].move(-1);
    pupil[i].show();
  }

  n1 = n1 + 0.1;
  n2 = n2 + 0.1;
  n3 = n3 + 0.1;
  n4 = n4 + 0.1;
  
  if ((second() % 30) == 0) noLoop();
}


class Dancer {
  float x1, y1; // initial position in the class room
  float x2, y2; // middle position in the class room
  float x3, y3; // final position in the class room
  float step; // length of step
  color col; // dress color 
  int alpha; // alpha value
  int weight; // stroke weight
  float force; // force of the bend
  
  Dancer(float _x1, float _y1, float _step, color _col, int _alpha, int _weight, float _force) {
    x1 = _x1;
    y1 = _y1;
    step = _step;
    col = _col;
    alpha = _alpha;
    weight = _weight;
    force = _force;
  }
  
  void move(int direction) {
    x2 = x1 + (noise(n1) - 0.5) * force * step;
    y2 = y1 + direction * noise(n2) * step;
    x3 = x2 + (noise(n3) - 0.5) * step;
    y3 = y2 + direction * noise(n4) * step;
  }
  
  void show() {
    stroke(col, alpha);
    strokeWeight(weight);
    beginShape();
    curveVertex(x1, y1);
    curveVertex(x1, y1);
    curveVertex(x2, y2);
    curveVertex(x3, y3);
    curveVertex(x3, y3);
    endShape();
  } 
  
}



