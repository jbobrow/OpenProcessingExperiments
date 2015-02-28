
ArrayList dots;

void setup() {
  size(500, 500);
  noStroke();
  background(0);
  colorMode(HSB, 360, 100, 100, 25);

  PVector a = new PVector(0.0, 0.125);
  PVector v = new PVector(0.0, 0.0);
  PVector l = new PVector(width/2, 0);

  dots = new ArrayList();
  dots.add(new Dot()); // Start by adding one element
}

void draw() {
  background(0);

  for (int i = 0; i < dots.size(); i++) {
    Dot dot1 = (Dot) dots.get(i);

    dot1.render();
    dot1.borders();
    dot1.update();

    for (int j = dots.size()-1; j > i; j--) {
      Dot dot2 = (Dot) dots.get(j);
      if (dist(dot1.loc.x, dot1.loc.y, dot2.loc.x, dot2.loc.y)<=40) {
        dot1.push(dot2);
        
        //dot1.collide();
        //dot2.collide();
      }
    }
  }
}

void mousePressed() {
  dots.add(new Dot());
}

class Dot {
  PVector loc;
  PVector vel;
  PVector acc;
  float maxvel;
  int r; //size of circle

  Dot () {
    acc = new PVector(0.0, 0.125);
    vel = new PVector(random(-3, 3), random(0, 1));
    loc = new PVector(width/2, 0);
    maxvel = 10;
    r = 40;
  }
  
  void push(Dot other) {
     PVector v = PVector.sub(loc,other.loc);
     v.normalize();
     v.mult(10);
     acc.add(v);
    
    
  }


  void update() {
    acc.add(new PVector(0.0, 0.125));
    
    //acc.add(new PVector(random(0,0.1),0));
    
    vel.add(acc);
    loc.add(vel);
    //limit speed to max
    if (vel.mag() > maxvel) {
      vel.normalize();
      vel.mult(maxvel);
    }
    acc.mult(0);
  }


  void borders() {
    if ((loc.y > height) || (loc.y < 0)) {
      vel.y *= -1;
    }
    else if ((loc.x < 0) || (loc.x > width)) {
      vel.x *= -1;
    }
  }

  void collide() {
    vel.x *= -1;
    vel.y *= -1;
  }


  void render() {
    stroke(0);
    fill(175);
    ellipse(loc.x, loc.y, r, r);
  }
}



