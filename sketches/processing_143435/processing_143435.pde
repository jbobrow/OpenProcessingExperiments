
PVector[] location;
PVector[] velocity;
color[] pigment;
float gravity = 0.03;
float damping = 0.005;
void setup(){
  size(800,600);
  ellipseMode(CENTER);
  smooth();
  noStroke();
  location = new PVector[500];
  velocity = new PVector[location.length];
  pigment = new color[location.length];
  for(int i=0;i<location.length;i++){
    location[i] = new PVector(random(0,width),random(0,height));
    velocity[i] = new PVector(random(-1,1),random(-1,1));
    pigment[i] = color(random(0,255),random(0,255),random(0,255));
  }
  mouseX = width/2;
  mouseY = height/2;
  background(0);
}
void draw(){
  fill(0,16);
  rect(0,0,width,height);
  PVector mouse = new PVector(mouseX,mouseY);
  for(int i=0;i<location.length;i++){
    fill(pigment[i]);
    ellipse(location[i].x,location[i].y,3,3);
    location[i].add(velocity[i]);
    PVector relativeLocation = PVector.sub(location[i],mouse);
    float forceMagnitude = gravity/sq(relativeLocation.mag());
    forceMagnitude = constrain(forceMagnitude,0,1);
    relativeLocation.normalize();
    velocity[i].sub(PVector.mult(relativeLocation,gravity));
    velocity[i].mult(1-damping);
    velocity[i].add(PVector.mult(new PVector(random(-1,1),random(-1,1)),0.1));
  }
}



