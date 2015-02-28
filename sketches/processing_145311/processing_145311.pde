
class brancher{
  color col;
  PVector pos, ppos, vel, acc, targ, targ2, traveled;
  float dist, ang;
  float radius;
  ArrayList<brancher> b;
  boolean alive;
  brancher(PVector pos, float ang, float dist, ArrayList<brancher> B){
    col = color(255*noise(millis()*PI/5000+1000),255*noise(millis()*PI/5000+2000),255*noise(millis()*PI/5000));
    b = B;
    alive = true;
    this.dist = dist;
    this.ang = ang;
    this.pos = pos.get();
    ppos = pos.get();
    targ = new PVector(1,0);
    targ.rotate(ang);
    targ.setMag(dist);
    targ2 = targ.get();
    targ2.rotate(random(-PI/2,PI/2));
    targ2.mult(random(0.5,1.5));
    targ2.add(pos);
    targ.add(pos);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    traveled = new PVector(0,0);
    radius = 10;
  }
  
  brancher(PVector pos, float ang, float dist, ArrayList<brancher> B, float rad){
    this(pos, ang, dist, B);
    radius = rad;
    if(rad<2){
      alive = false;
    }
  }
  
  void seek(){
    PVector c = PVector.sub(targ,pos);
    float m = map(c.mag(),0,50,0,2);
      if(traveled.mag() > 2*dist/3  && alive){
        float a1 = ang+random(1)*PI/6;
        float a2 = ang-random(1)*PI/6;
        float a3 = ang;
        float d = dist*(0.9+random(-0.2, 0.2));
        if(random(1)>0.2){
          b.add(new brancher(pos, a1, d, b, radius*(0.5+random(0.5))));
        }
        if(random(1)>0.2){
          b.add(new brancher(pos, a2, d, b, radius*(0.5+random(0.5))));
        }
        if(random(1)>0.5){
          b.add(new brancher(pos, a3, d, b, radius));
        }
        alive = false;
      }
    c.normalize();
    c.mult(m);
    c = PVector.sub(c,vel);
    applyForce(c);
    c = PVector.sub(targ2,pos);
    c.normalize();
    applyForce(c);
  }
  
  void applyForce(PVector f){
    acc.add(f);
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    traveled.add(vel);
    acc.mult(0);
    if(pos.x < 0 || pos.x > 5000 || pos.y < 0 || pos.y > 5000){
     alive = false;
    }
  }
  
  void display(){
    strokeWeight(radius);
    stroke(col);
    noFill();
    beginShape();
    vertex(ppos.x,ppos.y);
    vertex(pos.x,pos.y);
    endShape();
    ppos = pos.get();
  }
}


class branchSystem{
  ArrayList<brancher> branchers, newbs;
  branchSystem(float x, float y, float d){
    branchers = new ArrayList();
    newbs = new ArrayList();
    branchers.add(new brancher(new PVector(x,y), PVector.sub(new PVector(mouseX,mouseY),new PVector(pmouseX,pmouseY)).heading(), d*2, newbs, d/5));
  }
  void run(){
    for(int i = branchers.size()-1; i>=0; i--){
      brancher b = branchers.get(i);
      if(!b.alive){
        branchers.remove(b);
      }
      b.seek();
      b.update();
      b.display();
    }
    branchers.addAll(newbs);
    newbs.clear();
  }
}
int imgs;
ArrayList<branchSystem> syss;
void setup(){
  size(1000,800);
  background(255);
  syss = new ArrayList();
  imgs = 1;
}
void draw(){
  for(branchSystem bs: syss){
    bs.run();
  }
}
void mouseDragged(){
  PVector v = new PVector(mouseX,mouseY);
  v.sub(new PVector(pmouseX,pmouseY));
  float d = v.mag()/2;
  syss.add(new branchSystem(mouseX,mouseY,d));
}

void keyTyped(){
  //if(key=='s') save("branch "+imgs+".tiff");
}

