
void loadBackground() {
  base = loadImage("podklad.png");
  dx = (width - base.width) / 2;
  dy = (height - base.height) / 2;
}

void initArrayLists() {
  nodes = new ArrayList();
  placeNodes();
  addMass(0.01);
  joints = new ArrayList();
  connectNodes();
  
  if(bg) background(255);
  else background(0);
}

void placeNodes() {
  float yMin = /*-2 * h_tr;*/-height/2;
  float xMin = /*-2 * a_tr;*/-width/2;
  float yMax = /*height + 2 * h_tr;*/1.5 * height;
  float xMax = /*width + 2 * a_tr;*/1.5 * width;
  
  for(float y = yMin; y < yMax; y+= h_tr) {
    for(float x = xMin; x < xMax; x += a_tr) {
      nodes.add(new Node(x, y));
    }
    y += h_tr;
    for(float x = xMin + (a_tr / 2); x < xMax; x += a_tr) {
      nodes.add(new Node(x, y));
    }
  }
}

void addMass(float k) {
  for(Node n: nodes) { 
    if(n.loc.x < 0)
      n.mass += n.mass * -n.loc.x * k;
    if(n.loc.x > width)
      n.mass += n.mass * (n.loc.x - width) * k;
    if(n.loc.y < 0)
      n.mass += n.mass * -n.loc.y * k;
    if(n.loc.y > height)
      n.mass += n.mass * (n.loc.y - height) * k;
  }
}

void connectNodes() {
  for(int i = 0; i < nodes.size(); i++) {
    Node a = nodes.get(i);
    for(int j = 0; j < i; j++) {
      Node b = nodes.get(j);
      if(a != b && dist(a.loc.x, a.loc.y, b.loc.x, b.loc.y) < 1.5 * a_tr)
        joints.add(new Joint(a, b, a_tr));
    }
  }
}


void displayNodes() {
  for(int i = 0; i < nodes.size(); i++) {
    Node a = nodes.get(i);
    for(int j = max(0, i - nodes.size() / 20); j < i; j++) {
      Node b = nodes.get(j);
  //for(Node a: nodes) 
    //for(Node b: nodes) 
      float d = dist(a.loc.x, a.loc.y, b.loc.x, b.loc.y);
      if(d < 5 * a_tr) {
        float alp = pow(1/(d/(5 * a_tr + 1)), 2.5);
        if(bg) stroke(0, alp);
        else stroke(255, alp);
        line(b.loc.x, b.loc.y, a.loc.x, a.loc.y);
      }
    }
  }
}

PVector friction(Node n) {
  float k = map(baseBrightness(n.loc.x, n.loc.y), 0, 255, friction*5, friction);
  PVector force = n.vel.get();
  force.mult(-1);
  force.mult(k);
  return force;
}

PVector wind(Node n) {
  float s = 0.01;
  PVector force = new PVector(noise(frameCount * s, n.loc.x * s, n.loc.y * s) - 0.468,
                             noise(n.loc.y * s, frameCount * s, n.loc.x * s) - 0.468);
  force.mult(wind);
  return force;
}

float baseBrightness(float x, float y) {
  if(alpha(base.get(int(x - dx), int(y - dy))) == 0) return 255;
  return brightness(base.get(int(x - dx), int(y - dy)));
}

