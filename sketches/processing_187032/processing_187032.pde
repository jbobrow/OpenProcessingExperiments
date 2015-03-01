
//Reference
//https://processing.org/examples/regularpolygon.html

Polygon [] polygon = new Polygon[10];
float bigness;


void setup() {
  size(700, 700);
  bigness = 10;

  for (int i=0; i< polygon.length; i++) {
    polygon[i] = new Polygon();
  }
}

void draw() {
  background(0);
  smooth();

  for (int i=0; i< polygon.length; i++) {
    polygon[i].display();
    polygon[i].reset();
  }
}

//void polygon(float x, float y, float radius, int npoints) {
//  float angle = TWO_PI / npoints;
//  beginShape();
//  for (float a = 0; a < TWO_PI; a += angle) {
//    float sx = x + cos(a) * radius;
//    float sy = y + sin(a) * radius;
//    vertex(sx, sy);
//    println(a);
//   // println(sx);
//  //  print(sy);
//  }
//  endShape(CLOSE);
//}



class Polygon {
  PVector pos;
  float rot;
  float radius;
  int g;
  int b;
  int r;

  Polygon() {
    pos = new PVector(0, 0);
    rot = 0;
    radius = random(0,width/2);
    g = 255;
    b = 0;
  }

  void display() {
    stroke(0, g, b);
    noFill();
    radius += 1.6;
    g -= 1;
    b += 1;
    println(b);
    int npoints = 5;
    float angle = TWO_PI / npoints;

    pushMatrix();
    translate(width/2, height/2);
    rot +=0.02;
    rotate(rot);
    beginShape();

    float a1 = angle;
    float x1 = pos.x + cos(a1) * radius;
    float y1 = pos.y + sin(a1) * radius;
    vertex(x1, y1);

    float a2 = a1+angle;
    float x2 = pos.x + cos(a2) * radius;
    float y2 = pos.y + sin(a2) * radius;
    vertex(x2, y2);

    float a3 = a2+angle;
    float x3 = pos.x + cos(a3) * radius;
    float y3 = pos.y + sin(a3) * radius;
    vertex(x3, y3);

    float a4 = a3+angle;
    float x4 = pos.x + cos(a4) * radius;
    float y4 = pos.y + sin(a4) * radius;
    vertex(x4, y4);

    float a5 = a4+angle;
    float x5 = pos.x + cos(a5) * radius;
    float y5 = pos.y + sin(a5) * radius;
    vertex(x5, y5);

    line(x1, y1, x3, y3);
    line(x1, y1, x4, y4);
    line(x2, y2, x4, y4);
    line(x2, y2, x5, y5);
    line(x3, y3, x5, y5);

    endShape(CLOSE);
    popMatrix();
  }
  
  void reset() {
    if (radius >= width/2) {
      radius = 0;
      g = 255;
      b = 0;
    }
  }
}



