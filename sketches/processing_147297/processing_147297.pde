
Circle[] circles; // array for the objects
int numCircles=100; // number of shapes in simulation
PVector pulse;
boolean pulsed;
 
void setup() {
  size(900,500);
  smooth();
  strokeWeight(3); // boundaries thicker
  circles = new Circle[numCircles]; // create the array of the given size
  for (int i=0; i<numCircles; i++) {
    // now create squares according to the given definition, use random numbers as values
    circles[i] = new Circle(50+random(500),50+random(380),random(10,50),random(0.01,0.1),random(255));
  }
  pulsed = false;
}
 
void draw() {
  background(0); // repaint a white background in each frame
  for (int i=0; i<numCircles; i++) {
    circles[i].render(); // tell every square to repaint itself (after rotating a bit)
  }
  pulsed = false;
}

void mousePresed() {
  pulse = new PVector(mouseX*2, mouseY*2);
  pulsed = true;
}
 
class Circle {
  float x, y; // position
  float angle=0; // angle
  float w; // width=height
  float s; // speed of rotation
  float c; // grey value
   
  Circle(float x, float y, float w, float s, float c) {
    // assign the randomly created values to the class variables to remember them for painting
    this.x=x;
    this.y=y;
    this.c=c;
    this.w=w;
    this.s=s;
  }
   
  void render() {
    fill(c); // set the gray value as color to fill
    angle += s/20; // adjust the angle according to the rotation speed s
    pushMatrix(); // used for local transformation
    translate(x,y); // the center of the local coordinate system is the center of the shape
    rotate(angle); // rotate the coordinate system
    fill(0,100, 50);
    ellipse(mouseY-w/10,mouseY-w/.2,mouseX/w,mouseX/w); // draw the planet
    fill(0,10, 170);
    ellipse(mouseX+w/10,mouseY+w/.2,mouseX/w,mouseX/w);
    fill(150, 0, 70);
    ellipse(mouseX+w/5,mouseY+w/.5,mouseX/w,mouseX/w);
    fill(50, 170, 20);
    ellipse(mouseX+w/20,mouseY+w/.1,mouseX/w,mouseX/w);
   
    popMatrix(); // used for local transformation
  }
}
