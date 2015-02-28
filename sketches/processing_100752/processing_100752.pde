
Triangle t;

void setup() {
  size(1059, 533);
  smooth();

  t = new Triangle(width/2, height/4, width-width/4, height-height/4, width/4, height-height/4);
}

float noiseVal;
float noiseScale=0.02;

void draw() {
  PImage img;
  img = loadImage("fum.jpg");
  image(img, 0, 0);


  stroke(255, 100);
  line(width/2, height/2, 0, 533);
  line(width/2, height/2, 1059, 533);

  stroke(#FF7D7D, 100);
  line(width/2, height/2, width/2, 0);

  noStroke();
  fill(70, 100);
  ellipse(width/2, height/2, 150, 150);


  stroke(#7DFDFE, 100);
  line(70, 100, 70, 405);
  line(989, 100, 989, 405);

  stroke(#FF7D7D, 100);
  line(170, 150, 170, 355);
  line(889, 150, 889, 355);

  stroke(255, 100);
  strokeWeight(1.5);
  line(20, 75, 20, 430);

  line(120, 125, 120, 380);
  line(220, 175, 220, 330);
  line(1039, 75, 1039, 430);
  line(939, 125, 939, 380);
  line(839, 175, 839, 330);


  t.drawTriangle();
  if (checkCollision(mouseX, mouseY, t)) {
    fill(0, 100);
    stroke(255, 100);
  }
  else {
    noStroke();
  }
}

class Triangle {
  float point1x;
  float point1y;
  float point2x;
  float point2y;
  float point3x;
  float point3y;

  Triangle(float point1x, float point1y, float point2x, float point2y, float point3x, float point3y) {
    this.point1x = point1x;
    this.point1y = point1y;
    this.point2x = point2x;
    this.point2y = point2y;
    this.point3x = point3x;
    this.point3y = point3y;
  }

  void drawTriangle() {
    triangle(point1x, point1y, point2x, point2y, point3x, point3y);
  }
}

boolean checkCollision(float x, float y, Triangle t) {
  float tArea, t1Area, t2Area, t3Area;
  tArea  = triangleArea(t.point1x, t.point1y, t.point3x, t.point3y, t.point2x, t.point2y);
  t1Area = triangleArea(x, y, t.point2x, t.point2y, t.point3x, t.point3y);
  t2Area = triangleArea(x, y, t.point3x, t.point3y, t.point1x, t.point1y);
  t3Area = triangleArea(x, y, t.point2x, t.point2y, t.point1x, t.point1y);
  noStroke();
  fill(255, 50);
  triangle(t.point1x, t.point1y, t.point3x, t.point3y, t.point2x, t.point2y);
  fill(#FF7D7D, 50);
  triangle(x, y, t.point2x, t.point2y, t.point3x, t.point3y);
  fill(#4A5F5F, 50);
  triangle(x, y, t.point3x, t.point3y, t.point1x, t.point1y);
  fill(#7DFDFE, 50);
  triangle(x, y, t.point2x, t.point2y, t.point1x, t.point1y);

  float totalArea = t1Area+t2Area+t3Area;
  return (totalArea == tArea);
}

float triangleArea(float p1, float p2, float p3, float p4, float p5, float p6) {
  float a, b, c, d;
  a = p1 - p5;
  b = p2 - p6;
  c = p3 - p5;
  d = p4 - p6;
  return (0.5* abs((a*d)-(b*c)));
}
