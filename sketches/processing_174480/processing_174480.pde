
Tree[] trees;

void setup() {
  size(1000, 1000);
  background(255);
  ellipseMode(CENTER);
  frameRate(200);
  smooth();
  trees = new Tree[1];
  trees[0] = new Tree();
}

void draw() {
  for (int i=0;i<trees.length;i++) {
  PVector loc = trees[i].loc;
  float diam = trees[i].d;
  float c = map(trees.length,0,1000,0,50);
  stroke(c);
  ellipse(loc.x, loc.y, diam, diam);
  trees[i].update();
  }
}

void mousePressed() {
  background(255);
  trees = new Tree[1];
  trees[0] = new Tree();
}

class Tree {
  PVector loc;
  PVector v;
  float d;
  
  Tree() {
    loc = new PVector(width/2, height);
    v = new PVector(0, -1);
    d = 32;
  }
  
  Tree(Tree parent) {
    loc = parent.loc.get();
    v = parent.v.get();
    float area = PI*sq(parent.d/2);
    float newDiam = sqrt(area/2/PI)*2;
    d = newDiam;
    parent.d = newDiam;
  }

  void update() {
    if (d>0.2) {
      loc.add(v);
      PVector bump = new PVector(random(-1, 1), random(-1, 1));
      bump.mult(0.1);
      v.add(bump);
      v.normalize();

      if (random(0, 1)<0.015) {
        trees = (Tree[]) append(trees, new Tree(this));
      }
    }
    else if (d<=0.2){
      float p = random(-20,20);
      PVector vert = new PVector(0,-1);
      float rad = PVector.angleBetween(v, vert);
      
      fill(255,255,255,random(10,50));
      ellipse(loc.x,loc.y,10,10);
      
      
      /*
      beginShape();
      vertex(loc.x,loc.y);
      bezierVertex(loc.x+10,loc.y-15,loc.x+40+p,loc.y-5+p/2,loc.x+50+p,loc.y+5);
      bezierVertex(loc.x+40+p,loc.y+10,loc.x+10,loc.y+20,loc.x,loc.y);
      endShape();
      */
     
      
      
    }
  }
}

