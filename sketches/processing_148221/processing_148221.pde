
Circlee[] circless; // array for the objects
int numCircless=150; // number of shapes in simulation
PVector pulse;
boolean pulsed;
//
float R; //radius
ArrayList<Circle> circles;

void setup() {
  size(700,600);
  smooth();
  strokeWeight(3); // boundaries thicker
  circless = new Circlee[numCircless]; // create the array of the given size
  for (int i=0; i<numCircless; i++) {
    // now create squares according to the given definition, use random numbers as values
    circless[i] = new Circlee(50+random(500),50+random(380),random(10,50),random(0.01,0.1),random(255));
  }
  pulsed = false;
  R = 15;
  circles = new ArrayList<Circle>();
}
 
void draw() {
  background(0); // repaint a white background in each frame
  for (int i=0; i<numCircless; i++) {
    circless[i].render(); // tell every square to repaint itself (after rotating a bit)
  }
  pulsed = false;
  //
  for (int i=0; i<circles.size(); i++) {
    circles.get(i).render();
    circles.get(i).move();
  }
  
  for (int i=0; i<circles.size(); i++ ) {
    if (circles.get(i).isStale()) {
      circles.remove(i);
      i--;
    }
  }
  if (keyPressed){
  if (key==' ') {
  background(0);
  }
}

}

void mousePresed() {
  pulse = new PVector(mouseX*2, mouseY*2);
  pulsed = true;
}
//
void mouseClicked() {
  if (mouseButton==LEFT) {
    circles.add(new Circle(mouseX, mouseY, R));
  }
  if (mouseButton==RIGHT) {
    for (int i=0;i<circles.size();i++) {
      circles.get(i).toggleGravity();
    }
  }
}


class Circlee {
  float x, y; // position
  float angle=0; // angle
  float w; // width=height
  float s; // speed of rotation
  float c; // grey value
  

   
  Circlee(float x, float y, float w, float s, float c) {
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
    ellipse(mouseX-w/10,mouseY-w/.2,mouseX/w,mouseX/w); // draw the planet
    fill(0,10, 170);
    ellipse(mouseX+w/10,mouseY+w/.2,mouseX/w,mouseX/w);
    fill(150, 0, 70);
    ellipse(mouseX+w/5,mouseY+w/.5,mouseX/w,mouseX/w);
    fill(50, 170, 20);
    ellipse(mouseX+w/20,mouseY+w/.1,mouseX/w,mouseX/w);
   
 
    popMatrix(); // used for local transformation
  }
}


  class Circle {
   // class data/variables
  float centerX, centerY;
  float vx, vy, ax, ay;
  float radius, elasticity;
  float v_max, v_min;
  //float fallspeed;
  boolean gravity;
  
    // Constructor, builds the object when it is declared.
  Circle(float x, float y, float r) {
    v_max = 10;
    v_min = -10;
    centerX = x;
    centerY = y;
    //random velocity
    vx = random(0, 0.5);
    vy = random(0, 0.5); //random(v_min, v_max)
    ax = 0;
    ay = 0.0000000000002; //random(-0, -0.700)
    radius = r/5;
    // 1 is a perfectly elastic collision, no energy lost
    // 0.9 means about 10% of the velocity in the direction of the collision is lost
    elasticity = 1;
    //fallspeed = 900;
    gravity = true;
  }
  
  void render() {
    stroke(0);
    if (gravity) {
      fill(0, 100, 240);
    }
    else {
      fill(100, 150, 50);
     
    }
    ellipse(centerX, centerY, random(0,2)*radius, random(0,2)*radius);
    ellipse(centerX, centerY, random(0,5)*radius, random(0,5)*radius);
   
    
  }
  
  // update the position according to Newtonian motion
  void move() {
    if (gravity) {
      vx += ax;
      vy += ay;
    }
    centerX += vx;  // syntactically equivalent to x = x+vx
    centerY += vy;
    // top wall collision
    if (centerY<radius) {
      centerY = 2*radius - centerY;
      vy = -vy*elasticity;
    }
  
    // bottom wall collision
    if (centerY>height-radius) {
      centerY = 2*(height-radius) -centerY;
      vy = -vy*elasticity; //-vy*elasticity
       
    }
  
    // left wall collision
    if (centerX<radius) {
      centerX = 2*radius - centerX;
      vx = -vx*elasticity; //-vx*elasticity
    }
  
    // right wall collision
    if (centerX>width-radius) {
      centerX = 2*(width-radius)-centerX;
      vx = -vx*elasticity;
    }
  }
  
  // return true if the circle is off the bottom of the
  // screen, false otherwise
  boolean isStale() {
    return (centerY > height + radius);
  }
  
  // toggle the gravity, turn gravity on and off
  void toggleGravity() {
    gravity = !gravity;
  }
}


