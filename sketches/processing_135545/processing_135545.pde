
ArrayList<Node> nodes = new ArrayList<Node>();
float colsize;

float t = 0;
float spd = 0;

void setup() {
  rectMode(CENTER);
  colorMode(HSB);
  size(500, 500);  
  colsize = width / 20;
  for (float x = colsize; x < width; x+=colsize) {
    for (float y = colsize/2; y < height; y+=colsize) {
      nodes.add(new Node(x, y, colsize/2));
    }
  }
  background(0);
}

void draw() {
  for (Node n : nodes) {
    n.run();
  }
  
  t += .001;//map(mouseX, 0, width, 0, .1);
  // map(mouseY, 0, height, 0, 100)
  spd = abs(sin(t) * 40) + 1;
}


class Node {
  float r;
  PVector loc, hsb, hsb_vel;
  float speed;
  color c;

  Node(float x, float y, float _r) {
    loc = new PVector(x, y);
    r = _r;
    speed = 1;
    c = color(255);
    hsb = new PVector(random(255), 0, 255);
    hsb_vel = new PVector(0, random(.001, 10), 0);
  }

  void run() {
    update();
    display();
  }

  void display() {
    fill(hsb.x, hsb.y, hsb.z, 200);
    noStroke();
    rect(loc.x + random(-speed, speed), loc.y, r * .8, r * 1.8);
  }

  void update() {
    speed = spd;
    hsb.add(hsb_vel);
    if (hsb.y > 255 || hsb.y < 0) {
     hsb_vel.y = hsb_vel.y * -1;
    }
  }
}



