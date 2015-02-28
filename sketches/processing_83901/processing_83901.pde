
final color DARKEST = color(0, 139, 69);
final color BRIGHTEST = color(0,255,127);
final float RATE = 0.001;

Shape[] shapes = new Shape[6];
    

void setup() {
  size(640, 360);
  background(0, 139, 69);
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  // small shapes are drawn later than big shapes
  shapes[0] = new Ellipse(1.0);
  shapes[1] = new Rect(0.75);
  shapes[2] = new Ellipse(0.666);
  shapes[3] = new Rect(0.5);
  shapes[4] = new Ellipse(0.333);
  shapes[5] = new Rect(0.1666);
}


void draw() {
  background(0, 139, 69);

  // sort by size:
  if (shapes[6-1].ratio > shapes[6-2].ratio) {
    Shape temp = shapes[6-1];
    for (int i=6-2; i>=0; --i) {
      shapes[i+1] = shapes[i];
    }
    shapes[0] = temp;
  }
  
  for (int i=0; i<6; ++i) {
    shapes[i].update();
    shapes[i].draw();
  }
}


class Shape {
  float ratio;
  
  Shape(float r) {
    ratio = r;
  }
  
  void update() {
    ratio -= RATE;
    if (ratio < 0) {
      ratio = 1.0;
    }
  }
  
  void draw() {
    fill(lerpColor(BRIGHTEST, DARKEST, ratio));
  }
}


class Rect extends Shape {
  Rect(float r) {
    super(r);
  }
  
  void draw() {
    super.draw();
    rect(width/2, height/2, width*ratio, height*ratio);
  }
}


class Ellipse extends Shape {
  Ellipse(float r) {
    super(r);
  }
  
  void draw() {
    super.draw();
    ellipse(width/2, height/2, width*ratio, height*ratio);
  }
}


/*

fill (0,205,102);
ellipse (320,180,640, 360);

fill(0,238,118);
rectMode(CENTER);
rect(320,180,380,290);

fill(0,255,127);
ellipse(320,180,380,290);


fill(0, 139, 69);
rectMode(CENTER);
rect(320,180,275,203);


fill (0,205,102);
ellipse(320,180,275,203);

fill (0,238,118);
rectMode(CENTER);
rect(320,180,180,155);

fill(0,255,127);
ellipse(320,180,180,155);
*/

