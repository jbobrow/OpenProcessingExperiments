
class Particle {
  public Particle(PVector pos, PVector vel, PVector acc, float mass, float adres, float dt, int radius, boolean locked) {
    this.pos = pos;
    this.vel = vel;
    this.acc = acc;
    this.mass = mass;
    this.adres = adres;
    this.dt = dt;
    this.radius = radius;
    forces = new PVector[4];
    for (int i = 0 ; i < 4; i++)
      forces[i] = new PVector();
    forceindex = 0;
    bcolor = color(random(255), random(255), random(255));
    this.locked = locked;
    dragged = false;
    force = new PVector();
  }

  public Particle(float dt) {
    pos = new PVector();
    vel = new PVector();
    acc = new PVector();
    mass = 1.;
    adres = 0.;
    this.dt = dt;
    bcolor = color(random(255), random(255), random(255));
    locked = false;
    radius = int(random(10, 30));
    dragged = false;

    forces = new PVector[4];
    for (int i = 0 ; i < 4; i++)
      forces[i] = new PVector();
    forceindex = 0;
  }

  void update() {
    if (dragged) {
      pos.x = mouseX;
      pos.y = mouseY; 
      vel.set(0., 0., 0.);
      return;
    }
    if(locked) return;
    force.set(0,0,0);
    for (int i = 0 ; i< 4; i++)
      force.add(forces[i]);

    vel.x += (acc.x - (force.x / mass + vel.x * adres)) * dt;
    vel.y += (acc.y - (force.y / mass + vel.y * adres)) * dt;
    
    pos.x += vel.x * dt;
    pos.y += vel.y * dt;
  }

public void resetforces(){
  for(int i = 0; i < 4; i++)
    forces[i].x = forces[i].y = 0;
}

  public PVector pos;
  public PVector vel;
  public PVector acc;
  public float mass;
  public PVector forces[];
  public int forceindex;
  public float adres; //aero dynamic resstivity

  public color bcolor;
  public float dt;
  public boolean locked;
  public int radius;
  public boolean dragged;
  public PVector force;
}


float maxtension =.1;
class Node{
  public Node(float len, float yung, float decay, Particle p1, Particle p2){
    this.p1 = p1;
    this.p2 = p2;
    this.len = len;
    this.yung = yung;
    this.decay = decay;
    
  }
  public Node(){
  }
  
  public void update(){
    dist = int(p1.pos.dist(p2.pos));
    tension = ((len - dist) * yung);
  //  if(abs(tension) > 1.1) tension = tension >0?1:-1;
    PVector force = PVector.sub(p1.pos, p2.pos);
    force.normalize();
    force.mult(tension);
    p2.forces[p2.forceindex].set(force);
    p2.forceindex++;
    if(p2.forceindex == 4)
      p2.forceindex = 0;
    force.mult(-1);
    p1.forces[p1.forceindex].set(force);
    p1.forceindex++;
    if(p1.forceindex == 4)
      p1.forceindex = 0;
    
  }
  
  void draw(){
    stroke((dist - len)/len * 255, 0, 0);
    line(p1.pos.x, p1.pos.y, p2.pos.x, p2.pos.y);
  }
  public Particle p1, p2;
  public float len;
  public float yung;
  public float tension;
  public float decay;
  private int dist;
}

import java.util.Iterator;

float dt = 0.5;
float yung = 2.1;
float nodelen = 5;
float adres = .1;
float mass = 1;
int gridsize = 40;
ArrayList<Particle> particles;
ArrayList<Node> nodes;
void setup() {
  size(300, 300);
  particles = new ArrayList<Particle>();
  nodes = new ArrayList<Node>();
  int x, y;
  for (x = 0; x < gridsize; x ++)
    for (y = 0; y < gridsize; y ++) {
      particles.add(new Particle(new PVector(x*5+50, y*5+50), new PVector(), new PVector(0.0, 0.1), mass, adres, dt, 5, (y == 0)));
    }
  for (x = 1; x < gridsize+1; x ++){
    for (y = 1; y < gridsize; y ++) {
      Node node = new Node(nodelen, yung, 0, particles.get((x-1)*gridsize+y-1), particles.get((x-1)*gridsize+y));
      nodes.add(node);
    }
    
  }
  for (x = 0; x < gridsize; x ++){
    for (y = 1; y < gridsize; y ++) {
      Node node = new Node(nodelen, yung, 0, particles.get((y-1)*gridsize+x), particles.get((y)*gridsize+x));
      nodes.add(node);
    }
    
  }
  noFill();
}

void draw() {
  background(255);

  Iterator<Node> nodeiter = nodes.iterator();
  while(nodeiter.hasNext()){
    Node n = nodeiter.next();
    n.update();
//    if(n.tension > .05)
//      nodeiter.remove();
    n.draw();
  }

  Iterator<Particle> iter = particles.iterator();
  while (iter.hasNext ()) {
    Particle p = iter.next();
    stroke(p.bcolor);
    point(p.pos.x, p.pos.y);
    //ellipse(p.pos.x, p.pos.y, p.radius, p.radius);
    //point(p.pos.x, p.pos.y);
    p.update();
    p.resetforces();
//        if (p.pos.y > height - 100)
//    
//          p.acc.y = -0.9;
//        else
//          if (p.acc.y == -0.9)
//            p.acc.y = 0.1;
  }
}

void mousePressed() {
  for (Particle p : particles) {
    p.dragged = (p.radius > int(p.pos.dist(new PVector(mouseX, mouseY))));
    if (p.dragged)  
      break;
  }
}

void mouseReleased() {
  for (Particle p : particles) {
    if(p.dragged)
      p.locked = false;
    p.dragged = false;
    
  }
}



