
ArrayList snakes = new ArrayList();

void setup() {
  size(640, 640);
  noStroke();
  for (int i = 0; i < 20; i++) {
    snakes.add(new Snake(new PVector(random(width), random(height))));
  }
}

void draw() {
  background(20);
  for (int i = 0; i < snakes.size (); i++) {
    Snake s = (Snake) snakes.get(i);
    s.draw();
    s.boundary();
  }
}

class Snake {

  int segAmount = 50;
  float segLength = 5, startAngle;
  
  PVector[] pos = new PVector[segAmount];
  PVector loc, vel, acc;
  
  Snake(PVector loc) {
    this.loc = loc;
    vel = new PVector((1-random(2)), (1-random(2)));
    vel.mult(4);
    acc = new PVector();
    for(int i = 0; i < segAmount; i++){
      pos[i] = new PVector(i, i); 
    }
  }

  void draw() {
    PVector m = new PVector(mouseX, mouseY);
    if (mousePressed) {
      PVector d = PVector.sub(m, loc);
      d.normalize();
      d.mult(0.5);
      acc = d;
    }
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    
    dragSegment(0, loc);
    for (int i = 0; i < pos.length-1; i++) {
      dragSegment(i+1, pos[i]);
    }
  }

  void dragSegment(int i, PVector loc) {
    float angle = atan2(loc.y - pos[i].y, loc.x - pos[i].x);  
    pos[i].x = loc.x - cos(angle) * segLength;
    pos[i].y = loc.y - sin(angle) * segLength;
    
    pushMatrix();
    translate(pos[i].x, pos[i].y);
    rotate(angle);
    fill(125, 125+sin(radians(90+i+frameCount))*125, 125+sin(radians(frameCount))*125);
    float r = map(i, 0, segAmount, 30, 1);
    ellipse(0, 0, r, r);
    popMatrix();
  }

  void boundary() {
    if (loc.x < 0) vel.x *= -1;
    if (loc.x > width) vel.x *= -1;
    if (loc.y < 0) vel.y *= -1;
    if (loc.y > height) vel.y *= -1;
  }
}



