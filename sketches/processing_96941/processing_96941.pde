
class Bb {
  PVector loc;
  PVector speed;
  color c;
  
  Bb() {
    loc = new PVector(random(width), random(height));
    speed = new PVector (random(-3,3), random(-3,3));
    c = color(random(255), random(255), random(255), 220);
  }
  
  void display () {
    noStroke();
    fill(c);
    ellipseMode(CENTER);
    ellipse(loc.x, loc.y, 10, 10);
  }
  
  void bounce () { 
    loc.add(speed);
    
    if ((loc.x < 0) || (loc.x > width)) {
      speed.x *=-1;
    }
    
    if ((loc.y < 0) || (loc.y > height)) {
      speed.y *=-1;
    }
  }
}

Bb[] balls = new Bb [260];

void setup () {
  size (640, 360);
  for (int i = 0; i < balls.length; i++) {
  balls[i] = new Bb();
  }
}

void draw () {
//  background(2);
  
  for (int i = 0; i < balls.length; i++) {
    
  balls[i].bounce();
  balls[i].display();
  }
}
