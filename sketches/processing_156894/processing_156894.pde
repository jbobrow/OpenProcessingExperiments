
//Day 32


ArrayList<Object> objects;

void setup() {
  size(600, 600);
  smooth();
  objects = new ArrayList<Object>();
  
  for (int i = 0; i < width/40; i++) {
    for (int j = 0; j < height/40; j++) {
  objects.add( new Object(new PVector(20 + 40*i, 20 + 40*j)));
  }
  }
}

void draw() {
  background(0);
  for (Object object : objects) {
  object.update();
  object.display();
  }
}

class Object {
  
  PVector position;
  float distance;
  float angle;
  float amp;
  float ang = 0;
  float angVel = 0.1;
  float shade = 255;
  int w = 40;
  
  Object(PVector p_) {
    position = p_;
    angle = 0;
    amp = 0;
  }
  
  void display() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    rectMode(CENTER);
    noStroke();
    shade = map(position.x, 0, width, 125, 10)+ map(position.y, 0, height, 125, 10);
    fill(30, 205,250, shade );
    rect(0, 0, w, w);
    popMatrix();
  }
  
  void update() {
   PVector m = new PVector(mouseX, mouseY);
   distance = position.dist(m);
   float d = constrain(distance, 40, 2*width);
   if (mousePressed) {
     angle = 0;
   ang = 0;}
     else{
   amp = 15/(d);
   angle = PI/10*sin(ang);
   ang += amp;
     }
  }
    
}
