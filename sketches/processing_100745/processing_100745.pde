
float r;
float a = 200;
float n = 0;
float d = 2;
  
PVector point = new PVector();;
PVector center;
  
void setup() {
  size(420, 420);
  center = new PVector(width/2,height/2);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();
  frameRate(200);
}
  
void draw() {
  fill(0, 30);
  rect(0, 0, width, height);
  
  for (int t = 0; t < 360*2;t++) {
    r = a * sin(radians(t * n / d));
    point.x=cos(radians(t));
    point.y=sin(radians(t));
    point.mult(r);
    point.limit(abs(sin(t)*150));
    point.add(center);
  
    if (t % 5 == 0) {
      fill(t/2.0, 50, 100, 50);
    } else {  
      fill(360, 50);
    }
    noStroke();
    ellipse(point.x, point.y, 10, 10);
  }
  
  n += 0.003;
  d += 0.0001;
}

