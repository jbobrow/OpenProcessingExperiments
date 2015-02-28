
class Osc {
  float angle;
  float speed;
  
  Osc(float angle, float speed) {
    this.angle = angle;
    this.speed = speed;
  }
  
  float next() {
    angle += speed;
    return current();
  }
  
  float current() {
    return sin(angle);
  }
}

class Split {
  Osc osc;
  float val;
  int index;
  
  Split(int index, float speed) {
    this.index = index;
    val = random(1);
    osc = new Osc(0, speed);
  }
  
  void update() {
    val = map(osc.next() * oscDamp, -1, 1, 0, 1);
  }
}

float oscDamp = 1.0;

Split[] splits;
int depth = 8;

boolean points = false;

void setup() {
  size(700, 700);
  
  splits = new Split[round(pow(2, depth)) - 1];
  for (int i = 0; i < splits.length; i++) {
    int gen = generation(i);
    float speed = map(gen, 0, depth, 0.001, 0.1);
    if (i % 2 == 0) {
      speed *= -1;
    }
    splits[i] = new Split(i, speed);
  }
  
  initColors();
}

void initColors() {
  background(points ? 0 : 255);
  stroke(points ? 230 : 20);
}

void keyPressed() {
  points = !points;
  initColors();
}

void draw() {
  if (points) {
    pushStyle();
    fill(20, 40);
    rect(0, 0, width, height);
    popStyle();
  }
  else {
    background(255);
  }
  
  for (Split split : splits) {
    split.update();
  }
  drawSplit(0, width, height, true);
  
  oscDamp = map(mouseY, 0, height, 1, 0);
}


void drawSplit(int index, float w, float h, boolean verticalLine) {
  if (index >= splits.length) { return; }
  
  Split s = splits[index];
  
  int gen = generation(index);
  strokeWeight(map(gen, 0, depth-1, 10, 1));
  
  if (verticalLine) {
    float x = s.val * w;
    
    if (points) {
      point(x, h);
    } else {
      line(x, 0, x, h);
    }
    
    drawSplit((index * 2) + 1, 
              x, h, 
              false);
    
    pushMatrix();
    translate(x, 0);
    drawSplit((index * 2) + 2, 
              w - x, h, 
              false);
    popMatrix();
  }
  else {
    float y = s.val * h;
    
    if (points) {
      point(w, y);
    } else {
      line(0, y, w, y);
    }
    
    drawSplit((index * 2) + 1, 
              w, y, 
              true);
    
    pushMatrix();
    translate(0, y);
    drawSplit((index * 2) + 2, 
              w, h - y, 
              true);
    popMatrix();
  }
}


int generation(int index) {
  float logbase2 = log(index + 1) / log(2);
  return floor(logbase2);
}
/*
explanation for above:
0 => 1, 2   gen 0

1 -> 3, 4   gen 1
2 -> 5, 6   gen 1

3 -> 7, 8   gen 2
4 -> 9, 10  gen 2
5 -> 11, 12    gen 2
6 -> 13, 14    gen 2

7 -> 15, 16   gen 3
8 -> 17, 18   gen 3




0: -Infinity
1: 0.0

2: 1.0
3: 1.5849625

4: 2.0
5: 2.321928
6: 2.5849626
7: 2.807355

8: 3.0
9: 3.169925

*/
