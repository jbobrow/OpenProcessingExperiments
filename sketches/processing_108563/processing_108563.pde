
Circle[] circles; // array for the circle objects
int numCircles=80; // number of circles in simulation

void setup() {
  size(600,480);
  smooth();
  strokeWeight(3); // boundaries thicker
  circles = new Circle[numCircles]; // create the array of the given size
  for (int i=0; i<numCircles; i++) {
    // now create circles according to the given definition, use random numbers as values
    circles[i] = new Circle(50+random(500),50+random(380),random(100),random(255));
  }
}

void draw() {
  background(255); // repaint a white background in each frame
  for (int i=0; i<numCircles; i++) {
    circles[i].render(); // tell every circle to repaint itself (after rotating a bit)
  }
}

class Circle {
  float x, y; // position
  float v; // sin value
  float c; // color value
  
  Circle(float x, float y, float v, float c) {
    // assign the randomly created values to the class variables to remember them for painting
    this.x=x; 
    this.y=y;
    this.c=c;
    this.v=v;
  } 
  
  void render() {
    fill(255,255-c,c); // set the gray value as color to fill
    v+=0.1;
    ellipse(x,y,20+20*sin(v),20+20*sin(v));
  }
}


