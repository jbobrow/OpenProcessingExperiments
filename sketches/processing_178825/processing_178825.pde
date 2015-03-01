
ArrayList circles = new ArrayList();

PVector force = new PVector(0, -0.007);
float level = 520;

void setup() {
  size(640, 640);
  fill(0, 100, 205);
  stroke(0, 150, 255);
  strokeWeight(10);
  strokeJoin(ROUND);
  /* We must make them in order. Otherwise things get crazy. */
  for (int i = 0; i <= 10; i++) {
    circles.add(new Circle(new PVector(i*64, height), random(6, 35)));
  }
}

void draw() {
  background(40);
  
  /* The lines and circles will be a whole shape. */
  beginShape();
  vertex(0, height);
  vertex(0, level);
  for (int i = 0; i < circles.size (); i++) {
    Circle c = (Circle) circles.get(i);
    /* 
    If "se" >= 180 then make vertex where the circles xpos is and make a circle where the circle is. Its 180 because
    when we draw our circle it starts at the top (0) then draws to the bottom (left or right) which will equal 180
    or half a circle.
    */
    if (c.se >= 180.0 || c.loc.y-c.s/2 > level) {
      vertex(c.loc.x, level);
      ellipse(c.loc.x, c.loc.y, c.s, c.s);
    } else {
      /* Otherwise draw our circle out of vertex's */
      c.draw();
    }
    c.move();
    c.applyForce(force);
  }
  vertex(width-1, level);
  vertex(width-1, height);
  endShape();
}

class Circle {
  PVector loc, vel, acc;
  float s, se, mass;

  Circle(PVector loc, float s) {
    this.loc = loc;
    vel = new PVector();
    acc = new PVector();
    
    this.s = s*2;
    mass = s/40;
  }

  void draw() {
    /* Draw the circle. "se" is where we should start and end drawing the circle. */
    for (float i = -se; i <= se; i+=2) {
      float x = sin(radians(i)) * s/2;
      float y = cos(radians(i)) * s/2;
      vertex(loc.x+x, loc.y-y);
      //vertex(loc.x+x, loc.y+y);
    }
  }
  void move() {
    /* 
    "se" = is the level minus the (circles position minus its size). We minus our size to get the bottom of the circle.
    This means our for loop will start drawing from the top then end at the bottom. We multiply by 2 so the sticky effect
    doesn't go crazy.
    */
    se = (level-(loc.y-s/2))*2;
    //se = (loc.y-level+s/2)*2;
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    if(loc.y < -s){
      loc.y = height;
      vel = new PVector(0, 0);
      acc = new PVector(0, 0);
    }
  }
  
  void applyForce(PVector force) {
    acc.add(PVector.div(force, mass));
  }
}


