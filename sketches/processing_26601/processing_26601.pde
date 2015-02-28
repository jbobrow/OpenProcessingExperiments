
ArrayList Seeds = new ArrayList();
Seed Sd;
 
void setup() {
  size(900,450);
  background(255);
  smooth(); //smooth lines
}
 
void draw() {
  for (int i=0; i<Seeds.size(); i++) {
    Seed Sd = (Seed) Seeds.get(i);
    Sd.move();
    Sd.render();
    Sd.bounce();
    Sd.intersect();
  }
}
 
void mousePressed () {
  int a = Seeds.size();
  Seed Sd = new Seed (new PVector(mouseX,mouseY), color (a), random(3,15));
  Seeds.add(Sd);
  Sd.tag();
}

 class Seed {
  PVector pos;
  PVector post;
  PVector dir;
  PVector dirt;
  color c;
  float s;
 
  Seed(PVector _pos,  color _c, float _s) {
    pos=_pos;
    c=_c;
    s=_s;
    if (random(0,4)<=1) { 
      dir = new PVector (s,0);
    }
    else if (random(0,4)<=2) {
      dir = new PVector (0,s);
    }
    else if (random(0,4)<=3) {
      dir = new PVector (-s,0);
    }
    else if (random(0,4)<=4) {
      dir = new PVector (0,-s);
    }
  }
 
  void tag() {
    post = pos;
    dirt = dir;
    post.sub(dirt);
  }
    
  void render() {
    fill(255);
    stroke(c);
    rectMode(CENTER);
    rect(pos.x,pos.y,s,s);
  }
 
  void move( ) {
    pos.add(dir);
  }
   
  void bounce() {
    if (pos.x> width) {
      pos.x = 0;
    }
    if (pos.x <0) {
      pos.x = width;
    }
    if (pos.y> height) {
      pos.y = 0;
    }
    if (pos.y <0) {
      pos.y = height;
    }
  }
  
  void intersect() {
    if (post == pos) {
      while (dirt == dir) {
          dir = new PVector (random(-s,s),random(-s,s));
        }
      dirt = dir;
      post = pos;
      }
    }
    
  }

                
