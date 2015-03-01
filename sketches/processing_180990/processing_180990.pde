
Snake s;

void setup() {
  size(640, 640);
  noStroke();
  s = new Snake(new PVector(random(width), random(height)));
  background(255);
}

void draw() {
  fill(255, 30);
  rect(0, 0, width, height);
  s.draw();
  s.boundary();
}

class Snake {
  int segAmount = 500;
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
    vel.mult(0.98);
    
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
    fill(125, 125+sin(radians(90+i*3+frameCount))*125, 125+sin(radians(frameCount))*125);
    float r = map(i, 0, segAmount, 40, 1);
    ellipse(0, 0, r, r);
    popMatrix();
  }

  void boundary() {
    if (loc.x < 0) loc.x = 0;
    if (loc.x > width) loc.x = width;
    if (loc.y < 0) loc.y = 0;
    if (loc.y > height) loc.y = height;
  }
}



