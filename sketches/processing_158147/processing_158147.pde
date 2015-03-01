
ArrayList<Square> squares;

void setup() {
  size(500,500);
  background(255);
  smooth();
  frameRate(30);
  squares = new ArrayList<Square>();
  for (int i = 0; i < width; i+= 50) {
    for (int j = 0; i < 100; j+=10) {
      squares.add(new Square(i,j,random(255), random(0.1,7)));
    }
  }
}

void draw() {
//  saveFrame("output/frames#################.png");
  for (Square s: squares) {
    s.run();
  }
}
class Square {
  PVector loc;
  PVector vel;
  PVector acc;
  float s;
  float v = 1;
  float a = 0.01;
  float c;

  Square(float x, float y, float c_, float s_) {
    loc = new PVector(x,y);
    vel = new PVector(random(-v,v),random(-v,v));
    acc = new PVector(random(-a,a),random(-a,a));
    s = s_;
    c = c_;
  }
  
  void run() {
//    update();
    display();
//    checkEdges();
  }
  
  void update() {
    loc.add(vel);
//    vel.add(acc);
  }
    
  void display() {
    strokeWeight(s);
    fill(c);
    rect(loc.x,loc.y,5,5);
//    noStroke();
//    ellipse(loc.x,loc.y,s,s);
  }
  
  void checkEdges() {

    // When it reaches one edge, set location to the other.
    if (loc.x > width) {
      loc = new PVector(width/2, height/2);
      vel = new PVector(random(-v,v),random(-v,v));
      acc = new PVector(random(-a,a),random(-a,a));
    } else if (loc.x < 0) {
      loc = new PVector(width/2, height/2);
      vel = new PVector(random(-v,v),random(-v,v));
      acc = new PVector(random(-a,a),random(-a,a));
    }

    if (loc.y > height) {
      loc = new PVector(width/2, height/2);
      vel = new PVector(random(-v,v),random(-v,v));
      acc = new PVector(random(-a,a),random(-a,a));
    } else if (loc.y < 0) {
      loc = new PVector(width/2, height/2);
      vel = new PVector(random(-v,v),random(-v,v));
      acc = new PVector(random(-a,a),random(-a,a));
    }
  }
}


