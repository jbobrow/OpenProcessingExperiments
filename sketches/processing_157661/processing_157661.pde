
//Day 60 #create365
ArrayList<Object> objects;
int num = 200;
int a = 2;
int b = 30;
PVector center, right;
float r;
float angle;

void setup() {
  size(320,640);
  objects = new ArrayList<Object>();

  center = new PVector(width/2, height/2);
  right = new PVector(width, 0);
  for (int i = 0; i < num; i++) {
    for (int j = 0; j < 6; j++) {
      objects.add(new Object(new PVector(a*i, PI/b*i + j*TWO_PI/6)));
    }
  }
}

void draw() {
  background(30);

  PVector mouse = new PVector(mouseX, mouseY);
  r = PVector.sub(mouse, center).mag();

  angle = calcAngle();


  for (Object o : objects) {
    o.update();
    o.display();
  }
}

class Object {

  PVector position; //in r and theta?
  PVector velocity;
  PVector acceleration;
  int rad = 3;
  float theta = 0.0;
  float scale;
  float velScale;
  float initR;

  Object(PVector pos) {
    position = pos.get();
    initR = position.x;
    velocity = new PVector(0, 2*PI*initR/60/600);
    acceleration = new PVector(0, 0);
  }

  void update() {

    scale = map(initR, 0, 200, 3, -2); 
    velScale = map(angle, 0, TWO_PI, 360000, 1);
    velocity.x = scale*sin(theta);
    velocity.y = 2*PI*initR/velScale;
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    theta += map(r, 0, 450, TWO_PI/600, TWO_PI/300);
  }

  void display() {
    noStroke();
    fill(255, 200);
    pushMatrix();
    translate(position.x*cos(position.y) + width/2, position.x*sin(position.y) + height/2);
    ellipse(0, 0, rad, rad);
    popMatrix();
  }
}

float calcAngle() {
  pushMatrix();
  translate(width/2, height/2);
  right = new PVector(1, 0);
  PVector mouse = new PVector(mouseX - width/2, mouseY - height/2);
  float angle = PVector.angleBetween(mouse, right);
  popMatrix();
  if (mouseY > height/2) {
    angle = TWO_PI-angle;
  }
  return angle;
}

