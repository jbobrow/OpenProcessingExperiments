
ArrayList<Blob> blobs;
float initRad = 100;

void setup() {

  size(600, 600);
  colorMode(HSB,100);

  blobs = new ArrayList<Blob>();
}

void draw() {
  background(100);

  for (int i = blobs.size()-1; i > 0; i--) {

    Blob b = blobs.get(i);

    b.update();
  }
  
}

void mouseReleased() {
  
  blobs.add(new Blob(new PVector(width/2, height/2), new PVector(random(-.1, .1),random(-.1, .1)), initRad, color(random(100),100,80,80), 0));
  
}
class Blob {
  ArrayList<Blob> blobChilds;
  color c;
  float rad;
  PVector loc, vel, acc;
  boolean hasChilds;
  int childLvl;
  int childCount;
  int childLvlMax;
  int birthRate;

  Blob(PVector loc, PVector vel, float rad, color c, int childLvl) {
    this.loc = loc;
    this.vel = vel;
    this.rad = rad;
    this.acc = new PVector(0, 0);
    
    this.c = c;

    blobChilds = new ArrayList<Blob>();
    this.hasChilds = false;
    this.childLvl = childLvl;
    this.childCount = 2;
    this.childLvlMax = 4;
    this.birthRate = 80;
  }

  void display() {

    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, rad, rad);
  }

  void update() {

    vel.add(acc);
    loc.add(vel);

    if (hasChilds) {
      for (int i=blobChilds.size()-1; i>0; i--) {
        Blob bChild = blobChilds.get(i);

        bChild.stick(this.loc,this.rad);
        
        bChild.update();
      }
    }
    edges();

    display();

    if (frameCount % birthRate == 0 && childLvl < childLvlMax && blobChilds.size() <= childCount) divide();
  }

  void divide() {
      PVector childVel = new PVector( random(-.10*(childLvl+1)*2) , random(.10*(childLvl+1)*2) );
    
      blobChilds.add(new Blob(new PVector(loc.x, loc.y), 
      childVel, rad/2, color(0,80), childLvl+1));

      this.hasChilds = true;
  }
  
  void stick(PVector pLoc, float pRad) {
    strokeWeight(5-childLvl);
    stroke(0,20);
    line(loc.x,loc.y,pLoc.x,pLoc.y);
    noStroke();
  }
  
  void edges() {
    if (loc.x > width) {
     loc.x = width;
     vel.x *= -1;
    } else if (loc.x < 0) {
     loc.x = 0;
     vel.x *= -1;
    }
    
    if (loc.y > height) {
     loc.y = height;
     vel.y *= -1;
    } else if (loc.y < 0) {
     loc.y = 0;
     vel.y *= -1;
    }
  }
}


