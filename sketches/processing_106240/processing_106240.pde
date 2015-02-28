
Bug[] bugs = new Bug[4];
PVector velocity = new PVector();

void setup() {
  size(512, 512);
  
  bugs[0] = new Bug(new PVector(0, 0));
  bugs[1] = new Bug(new PVector(0, height));
  bugs[2] = new Bug(new PVector(width, height));
  bugs[3] = new Bug(new PVector(width, 0));
  background(0);
}

void draw() {
  
  for (int i = 0; i < 4; i++) {
    velocity = PVector.sub(bugs[(i+1) % 4].location, bugs[i].location);
    velocity.normalize();
    velocity.mult(0.5);
    bugs[i].update(velocity);
    bugs[i].display();
    
    if (mousePressed == true  && frameCount % 7 == 0) {
      stroke(200);
      line(bugs[i].location.x, bugs[i].location.y, bugs[(i+1) % 4].location.x, bugs[(i+1) % 4].location.y);
    }
}
  
  if (PVector.dist(bugs[0].location, bugs[1].location) < 1) {
    background(0);
    bugs[0] = new Bug(new PVector(0, 0));
    bugs[1] = new Bug(new PVector(0, height));
    bugs[2] = new Bug(new PVector(width, height));
    bugs[3] = new Bug(new PVector(width, 0));
  }
  
}





class Bug {
  PVector location;
  color col;
  
  Bug(PVector loc_) {
    location = loc_;
    col = color(81, 211, 41);
  }
  
  void update(PVector vel) {
    location.add(vel);
  }
  
  void display() {
    fill(col);
    noStroke();
    ellipse(location.x, location.y, 8, 8);
  }
  
  
  
}




