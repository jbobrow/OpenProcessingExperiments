
//Day 59 #create365

ArrayList<Object> objects; 
boolean action = false;
PVector center;
int lifespan = 500;

void setup() {
  size(640, 640);
  smooth();
  
  objects = new ArrayList<Object>();
}

void draw() {
  background(30);
  if (lifespan < 0) {
    objects = new ArrayList<Object>();
    lifespan = 500;
  }
 
 if (objects.size() == 5) {
   action = true;
   lifespan--;
 } else {
   action = false;
 }
 
 for (Object o : objects) {
   o.update(center);
   o.display();
 }
}

class Object {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  float radius, r;
  float theta = 0.0;;
  float thetaInc = TWO_PI/200;
  color c = color(random(255), random(255), random(255));
  
  Object(PVector pos) {
    position = pos.get();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    r = 155;
  }
  
  void update(PVector center) {
    if(action) {
      PVector force = PVector.sub(position, center);
      float distance = force.mag();
      distance = constrain(distance, 20, 40);
      force.normalize();
      float strength = (float) 100/(distance*distance);
      force.mult(-1*strength);;
      acceleration.add(force);
      velocity.add(acceleration);
      velocity.mult(0.99);
      position.add(velocity);
      acceleration.mult(0);
    }
    
    radius = -r * cos(theta) + 2*r;
    theta+= thetaInc;
    
    
  }
  
  void display() {
    noStroke();
    float alpha = map(lifespan, 0, 500, 0, 150);
    fill(c, alpha);
    ellipse(position.x, position.y, radius, radius);
}
}

void mouseClicked() {
  if (objects.size() < 5) {
    objects.add(new Object(new PVector(mouseX, mouseY)));
    center = calcCenter(objects);
  } else {
  }
}

PVector calcCenter(ArrayList<Object> obj) {
  float xSum = 0;
  float ySum = 0;
  for (Object o : obj) {
    xSum += o.position.x;
    ySum += o.position.y;
  }
  PVector center = new PVector(xSum/obj.size(), ySum/obj.size());
  return center;
}
