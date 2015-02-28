
import java.util.Calendar;


Agent cloud; // The black hole
Agent[] movers; // The thunderbolts
int randHue; // storing random hue values

void setup() {
  size(800, 400);
  smooth();
  colorMode(HSB, 360, 100, 100);
  background(random(360), 20, 80);
  cloud = new Cloud(5, 1, 160); // (speed, transparency, radius) of the black hole
  movers = new Agent[50]; // the more Agents, the denser the thunderstorm
  randHue = (int) random(361);
  for (int i = 0; i < movers.length; i++) {
    // thunderbolts (speed, size, hue, transparency)
    // thunderbolts get bigger, more transparent and faster with higher count
    movers[i] = new Agent(5+i, 1+i, randHue+i*int(random(10)), 100/(i+1));
  }
}


void draw() {
  cloud.run(); // display and update the black hole
  for (Agent m : movers) {
    m.run(); // display and update the thunderbolts
  }
}

void mouseClicked() { // restart thunderstorm by click
  background(random(360), 20, 80); 
  randHue = (int) random(361);
  for (int i = 0; i < movers.length; i++) {
    movers[i].erase( randHue+i*int(random(10)) );
  }
}


void keyPressed() { // save a screeny (Java-only)
  if (key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
}
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

class Agent {

  PVector loc, vel;
  PVector prevLoc;
  float step;
  int hue; 
  float thickness, alpha;

  Agent(float _step, float _thickness, int _hue, float _alpha) {
    hue = _hue;
    alpha = _alpha;
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    prevLoc = loc.get();
    step = _step;
    thickness = _thickness;
  }

  void run() {
    prevLoc = loc.get();

    // Velocity direction
//    vel = PVector.random2D(); <-- this doesn't work in Processing.js!
    vel.x = random(-1.0,1.0);
    vel.y = random(-1.0,1.0);
    // Velocity magnitude
    vel.mult(step);
    // Add velocity to Location
    loc.add(vel);

    offScreen(); // boundary behaviour

    display();
  }

  void display() { 
    stroke(hue, 100, 100, alpha);
    strokeWeight(thickness);
    line(prevLoc.x, prevLoc.y, loc.x, loc.y);
  }

  void offScreen() {
    if (loc.x > width) { 
      loc.x = 0; 
      prevLoc.x = loc.x;
    }
    if (loc.x < 0) { 
      loc.x = width; 
      prevLoc.x = loc.x;
    }
    if (loc.y > height) { 
      loc.y = 0; 
      prevLoc.y = loc.y;
    }
    if (loc.y < 0) { 
      loc.y = height; 
      prevLoc.y = loc.y;
    }
  }

  void erase(int _hue) {  // method to set back location and hue of the bolt
    loc.mult(0); 
    loc.x = width/2; 
    loc.y = height/2;
    hue = _hue;
  }
}

class Cloud extends Agent {
  float rad;

  Cloud(float _step, float _alpha, float _rad) {
    super(_step, 0, 0, _alpha);
    rad = _rad;
  }

  void display()  {
    noStroke();
    fill(hue, 0, 0, alpha);
    ellipse(loc.x, loc.y, rad, rad);
  }
}



