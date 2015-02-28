
float r;
float a = 200;
float n = 0;
float d = 2;
  
PVector point = new PVector(0,0);;
PVector center;
  
void setup() {
  size(420, 420);
  center = new PVector(width/2,height/2);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();
  noStroke();
}
  
void draw() {
  fill(0, 30);
  rect(0, 0, width, height);
  noFill();
  
  for (int t = 0; t < 360*2;t++) {
    r = a * sin(radians(t * n / d));
    point.set(cos(radians(t)),sin(radians(t)),0);
    point.mult(r);
    point.add(center);
  
    if (t % 5 == 0) {
      stroke(t/2.0, 50, 100, 50);
    } else {  
      stroke(360, 50);
    }
    rect(point.x, point.y, sin(n * 3 * t) * 20, sin(n * 3 * t) * 20);
  }
  
  n += 0.003;
  d += 0.0001;
}

