
ArrayList<Agent> agents;
int numAgents = 400;
int maxRadius = 300;
int maxAlpha = 20;
int colorVariance = 20;
float speed;
int r, g, b;

void setup() {
  size(1024, 768);
  background(0);
  
  r = (int) random(255);
  g = (int) random(255); 
  b = (int) random(255);
  
  agents = new ArrayList<Agent>();
  for (int i=0; i<numAgents; i++) {
    agents.add(new Agent());
  }
}

void draw() 
{  
  speed = map(mouseX, 0, 255, 0.1, 2.0);
  
  // find pairs of agents which are intersecting
  for (int i=0; i<agents.size(); i++) {
    Agent a = agents.get(i);
    a.others.clear();
    for (int j=i+1; j<agents.size(); j++) {
      Agent b = agents.get(j);
      if (checkIfIntersecting(a,b)) {
        a.others.add(b);
        b.others.add(a);   
      }
    }
  }  
  
  // update agents movements and draw triangles
  // for any group of three overlapping agents
  for (Agent a : agents) {
    a.update();
    a.drawTri();
  }
}

boolean checkIfIntersecting(Agent a, Agent b) {
  float d = PVector.dist(a.p, b.p);
  if (d < 0.5*(a.rad + b.rad)) {
    return true;
  } else {
    return false;
  }
}

void mousePressed() {
  setup();
}
class Agent 
{
  PVector p, v;
  float rad, alph;
  color col;
  int t;
  ArrayList<Agent> others;
  
  Agent() {
    p = new PVector( random(width), random(height) );
    v = new PVector( random(-1,1), random(-1,1) );
    rad = random(maxRadius);
    others = new ArrayList<Agent>();
    t = 0;
    col = color(r+random(-colorVariance, colorVariance), 
                g+random(-colorVariance, colorVariance), 
                b+random(-colorVariance, colorVariance));
    alph = random(maxAlpha);    
  }
  
  void update() {
    p.x += speed * v.x;
    p.y += speed * v.y;
    t++;
  }
    
  void drawTri() {
    if (others.size()==2) {
      fill(col, alph);
      stroke(0, alph);
      Agent o1 = others.get(0);
      Agent o2 = others.get(1);
      triangle(p.x, p.y, o1.p.x, o1.p.y, o2.p.x, o2.p.y);
    }
  }
  
  /* used to view agents */
  void draw() {  
    noFill();
    stroke(255);
    ellipse(p.x, p.y, rad, rad);
  }  
}


