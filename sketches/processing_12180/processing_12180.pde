
class Vertex {
  PVector l;
  PVector f = new PVector();
  PVector v = new PVector();
  PVector d = new PVector();
  public Vertex(PVector loc) {
    this.l = loc; 
  }
  public void calc(Vertex o) {
    d.set(o.l); d.sub(l);
    float dm = d.mag();
    float fm = -15/max(dm,10e-2);
    d.div(dm); d.mult(fm);
    f.add(d);
    o.f.sub(d);
  }
  void move(float dt) {
    d.set(f);  d.mult(dt); v.add(d);
    v.mult(0.96);
    d.set(v); d.mult(dt);
    l.add(d);    
    f.set(0,0,0); 
  }
}

class Edge {
  Vertex v0,v1;
  float k = 30;
  float r = 5;  
  PVector d = new PVector();
  public Edge(Vertex v0, Vertex v1) {
    this.v0 = v0;
    this.v1 = v1;
  }  
  public void calc() {     
    d.set(v1.l); d.sub(v0.l);
    float dm = d.mag();
    float f = k*(r-dm);
    d.div(dm); d.mult(f/2.0);
    v0.f.sub(d);
    v1.f.add(d);    
  }
}

Edge edges[];
Vertex vertices[];
Vertex fix[] = new Vertex[4];
Vertex pick;
int n = 20;
float s = 20;
float dt = 0.1;

boolean wave = false;

void mousePressed() {
  PVector d = new PVector();
  float md = Float.MAX_VALUE;
  pick = null;
  for (Vertex v : vertices) {
    d.set(mouseX, mouseY, 0);
    d.sub(v.l);    
    float vd = d.mag();
    if (vd < md && vd < 10.0) {
      md = vd;
      pick = v;
    }
  }    
}

void mouseDragged() {
  if (pick != null) {
    pick.l.set(mouseX, mouseY, 0);  
  }
}

void keyPressed() {
  if (key == '+') {
    for (Edge e : edges) {
      e.k = constrain(e.k + 5, 1, 100); 
    }
  } else if (key == '-') {
    for (Edge e : edges) {
      e.k = constrain(e.k - 5, 1, 100); 
    }
  } else if (key == 'r') {
    for (Edge e : edges) {
      e.r = random(1,20);
    }
  } else if (key == 'w') {
    wave = !wave;
    if (pick == null)
      pick = fix[(int)random(0,3)];
  } else if (key == 'b') {
    fix[0].l.x = fix[0].l.y = 20;
    fix[1].l.x = width - 20; fix[1].l.y = height - 20;
    fix[2].l.x = width - 20; fix[2].l.y = 20;
    fix[3].l.x = 20; fix[3].l.y = height - 20;
  }
}

void setup() {
  size(640, 480, P2D);
  frameRate(20);
  smooth();
  vertices = new Vertex[n*n];
  for (int i=0; i<vertices.length; i++) {
      vertices[i] = new Vertex(new PVector((i%n)*s, i/n*s));
      vertices[i].l.x += (width-n*s)/2;
      vertices[i].l.y += (height-n*s)/2;
  }
  fix[0] = vertices[0];
  fix[1] = vertices[n*n-1];
  fix[2] = vertices[n-1];
  fix[3] = vertices[(n-1)*n];    
  edges = new Edge[2*(n*n-n)];
  int ei = 0;
  for (int x=0; x<n; x++) {
    for (int y=0; y<n; y++) {
      Vertex v = vertices[x*n+y];
      if (x < n-1) {
        Vertex r = vertices[(x+1)*n+y];
        edges[ei++] = new Edge(v, r);
      }
      if (y < n-1) { 
        Vertex b = vertices[x*n+y+1];
        edges[ei++] = new Edge(v, b);
      }
    }
  }
}

void draw() {
  background(0);  
  stroke(200);
  for (Edge e : edges) {
    line(e.v0.l.x, e.v0.l.y, e.v1.l.x, e.v1.l.y);  
    e.calc();    
  }
  noStroke();
  for (int i=0; i<vertices.length; i++) {
    Vertex v = vertices[i];    
    for (int j=i+1; j<vertices.length; j++) {            
      v.calc(vertices[j]);
    } 
    if (v == pick) {
      fill(255,0,0,200);       
      rect(v.l.x-5, v.l.y-5, 10, 10);
    } else {
      fill(255,v.v.x*10,v.v.y*10); 
      rect(v.l.x-2, v.l.y-2, 4, 4);
    }
  }    
  for (Vertex v : vertices) {
    if (v == pick) {
      pick.f.set(0,0,0); 
    } else if (v != fix[0] && v != fix[1] && v != fix[2] && v != fix[3]) {
      v.move(dt); 
    }
  }
  if (wave && pick != null) {
    pick.l.x += 10*sin((frameCount%50)/50.0*TWO_PI);
    pick.l.y += 10*cos((frameCount%50)/50.0*TWO_PI);    
  }
}

