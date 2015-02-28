
int n = 3;
Bug[] bugs = new Bug[n];
PVector velocity = new PVector();
float theta;

void setup() {
  size(512, 512);
  
  theta = TWO_PI / n;
  
  translate(width/2, height/2);
  for (int i = 0; i < n; i++) {
    bugs[i] = new Bug(new PVector(width/2*cos(i*theta), width/2*sin(i*theta)));
  }
  
  background(0);
}

void draw() {
  translate(width/2, height/2);
  for (int i = 0; i < n; i++) {
    velocity = PVector.sub(bugs[(i+1) % n].location, bugs[i].location);
    velocity.normalize();
    velocity.mult(0.5);
    bugs[i].update(velocity);
    bugs[i].display();
    
    if (mousePressed == true  && frameCount % 7 == 0) {
      stroke(200);
      line(bugs[i].location.x, bugs[i].location.y, bugs[(i+1) % n].location.x, bugs[(i+1) % n].location.y);
    }
}
  
  if (PVector.dist(bugs[0].location, bugs[1].location) < 1) {
    background(0);
    n++;
    if (n == 20) {
      n = 3;
    }
    theta = TWO_PI / n;
    bugs = new Bug[n];
    for (int i = 0; i < n; i++) {
      bugs[i] = new Bug(new PVector(width/2*cos(i*theta), width/2*sin(i*theta)));
    }
    
  }
  
}





class Bug {
  PVector location;
  color col;
  
  Bug(PVector loc_) {
    location = loc_;
    col = color(71, 211, 41);
  }
  
  void update(PVector vel) {
    location.add(vel);
  }
  
  void display() {
    fill(col);
    noStroke();
    ellipse(location.x, location.y, 2, 2);
  }
  
  
  
}




