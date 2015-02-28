

float r, r2 ;
float a = 300;
float n = 0;
float d = 2;

PVector point = new PVector(0,0);;
PVector point2 = new PVector(0,0);;
PVector center;

void setup() {
  size(720, 720);
  center = new PVector(width/2,height/2);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();
  noStroke();
}

float ac = 0;

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);

  for (int t = 0; t < 360*2;t+=3) {
    r = a * sin(radians(t * n / d));
    r2 = a * sin(radians(-t * n / d));
   
    point.set(cos(radians(t)),sin(radians(t)),0);
    point.mult(r);
    point.add(center);

    point2.set(cos(radians(t)),sin(radians(t)),0);
    point2.mult(r2);
    point2.add(center);


    if (t % 5 == 0) {
      fill(t/2.0, 50, 100, 50);
    } else {   
      fill(360, 50);
    }
    ellipse(point.x, point.y, 5, 5);
    ellipse(point2.x, point2.y, 5, 5);
  }

  n += 0.003;
  d += 0.0001;
} 
