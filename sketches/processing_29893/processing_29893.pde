
class Joe{
  
  PVector pos;
  
  PVector vel;
  
  boolean skating;
  
  Joe() {
    pos = new PVector();
    vel = new PVector();
  }
  
  void skate() {
    skating=true;
    pos.add(vel);
    if(vel.mag()<0.5) {
      vel.x+=random(-.2,.2);
      vel.y+=random(-.2,.2);
      vel.mult(random(2,6));
    }
    vel.mult(.95);
  }
  
  void display() {
    pushMatrix();
    translate(pos.x,pos.y);
    stroke(0);
    fill(0);
    rect(0,0,4,4);
    if (!skating) {
    line(2,4,0,8);
    line(2,4,4,8);
    }
    else {
      if (vel.mag()>1.5) {
        line(2,4,-2,5);
      }
      line(2,4,2,8);      
    }
    popMatrix();
  }
}

Joe j;

void setup() {
  j= new Joe();
  j.display();
  j.vel.x=3;
  j.vel.y=2;
}

void draw() {
  background(202);
  j.skate();
  j.display();
}

void mouseClicked() {
  j.pos.x=width*.5;
  j.pos.y=height*.5;
}

