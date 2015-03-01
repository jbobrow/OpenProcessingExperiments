
float x = 0;
float y = 0;
float GROWTH = 1;
Branch b;
ArrayList<Branch> branches = new ArrayList<Branch>();
int m;
int LIMIT = 100000; // without this your processor's gonna suffer
int bg = 0;
int fg = 255;

void setup() {
  size(400,400);
  smooth();
  background(bg);
  stroke(fg);
  branches.add(new Branch(width/2, height, -HALF_PI, height/2 * 0.6));
}

void reset() {
  branches = new ArrayList<Branch>();
  branches.add(new Branch(width/2, height, -HALF_PI, height/2 * 0.6));
  background(bg);
}

void draw() {
  if(branches.size() < 100000) {
    for(int i=0;i<branches.size();i++) {
      Branch b = branches.get(i);
      if(!b.isAlive()) {
        float tmpX = b.x;
        float tmpY = b.y;
        float tmpR = b.init_rot;
        float tmpTtl = b.init_ttl;
        branches.add(new Branch(tmpX, tmpY, tmpR + random(-HALF_PI, HALF_PI), tmpTtl));
        branches.add(new Branch(tmpX, tmpY, tmpR + random(-HALF_PI, HALF_PI), tmpTtl));
        branches.remove(i);
      }
      b.update(); 
    }
    
  }
  println(branches.size());
}

class Branch {
  float x;
  float y;
  float init_rot;
  float init_ttl;
  float ttl;
  float thickness;
  
  Branch(float x, float y, float init_rot, float init_ttl) {
    this.x = x;
    this.y = y;
    this.init_rot = init_rot;
    this.thickness = map(dist(0, this.y, 0, 0), 0, height, 0, 5);
    this.init_ttl = init_ttl * 0.8;
    this.ttl = init_ttl;
  }
 
  void update() {
    this.thickness = map(dist(0, this.y, 0, 0), 0, height, 0, 5);
    if(this.isAlive()) {
      strokeWeight(this.thickness);
      pushMatrix();
      translate(this.x, this.y);
      rotate(this.init_rot);
      line(0,0, GROWTH, 0);
      x += GROWTH * cos(this.init_rot);
      y += GROWTH * sin(this.init_rot);
      popMatrix();
      this.ttl -= 1;
    }
  }
  
  boolean isAlive(){
    return this.ttl > 0;
  } 
}

void mouseClicked() {
  reset(); 
}


