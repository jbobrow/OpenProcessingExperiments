
float n1, n2, n3, n4; // noise values
float alpha;

Dancer fire;

void setup() {
  size(400, 600);
  frameRate(24);
  background(0, 20, 80);
  noFill();
  alpha = 255;
  n1 = random(10);
  n2 = random(10);
  n3 = random(10);
  n4 = random(10);
  fire = new Dancer(width/2, height, height, color(100), 50, 1, 1);
}

void draw() {

  fire.reset(width/2, height, random(height), color(random(200, 255), random(255), 0), random(alpha), random(5), 1);  
  fire.move(-1);
  fire.show();
  
  if (alpha > 0) alpha = alpha - 0.01;
  n1 = n1 + 0.1;
  n2 = n2 + 0.1;
  n3 = n3 + 0.1;
  n4 = n4 + 0.1;
}

void mousePressed() {
  save("fire.tif"); 
  
}

class Dancer {
  float x1, y1; // initial position in the class room
  float x2, y2; // middle position in the class room
  float x3, y3; // final position in the class room
  float step; // length of step
  color col; // dress color 
  float alpha; // alpha value
  float weight; // stroke weight
  float force; // force of the bend
  
  Dancer(float _x1, float _y1, float _step, color _col, float _alpha, float _weight, float _force) {
    x1 = _x1;
    y1 = _y1;
    step = _step;
    col = _col;
    alpha = _alpha;
    weight = _weight;
    force = _force;
  }
  
  void reset(float _x1, float _y1, float _step, color _col, float _alpha, float _weight, float _force) {
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



