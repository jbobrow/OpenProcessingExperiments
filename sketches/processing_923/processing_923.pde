
// Random Walker (No Vectors)
// Daniel Shiffman <http://www.shiffman.net>
// The Nature of Code, Spring 2009

// A random walker class!

class Walker {
  PVector loc;
  float radius;
  float angle;
  float wiggle;
  float wAngle;
  float value;
  Walker(float _radius, float _value) {
    value = _value;
    println(value);
    radius = _radius;
    angle = random(0,360);
    wAngle = random(0,360);
    loc = new PVector((cos(radians(angle)) * radius) + width/2,(sin(radians(angle)) * radius) + height/2);
  }

  void render() {
    stroke(20,200);
    fill(value);
    //rectMode(CENTER);
    ellipse(loc.x,loc.y,10,10);
  }

  // Randomly move up, down, left, right, or stay in one place
  void walk() {
    //PVector vel = new PVector(random(-range,range),random(-range,range));
    //loc.add(vel);
    // add wiggle
    wAngle += 5;
    wiggle = cos(radians(wAngle)) * 2;
    angle += .5+(wiggle/10);
    loc = new PVector((cos(radians(angle)) * (radius + wiggle)) + width/2,(sin(radians(angle)) * (radius + wiggle)) + height/2);

    // Stay on the screen
    loc.x = constrain(loc.x,0,width-1);
    loc.y = constrain(loc.y,0,height-1);
  }
}





