
class Particle{
  int life;
  PVector pos;
  PVector direction;
  float velocity;
  int col;
  float size;
  
  public Particle(PVector pos, float dir){
     this.pos = pos;
     velocity = 0.5+random(3);
     float a = (dir+(5*PI)/6)+random(PI/4);
     direction = new PVector(cos(a),sin(a));
     life = 50 + int(random(155));
     col = color(random(255),random(255),random(255));
     size = 1.0+random(5);
  }
  
  public void update(){
    pos.add(PVector.mult(direction,velocity));
    life-=2;
  }
  
  public void draw(){
    pushStyle();
    stroke(col,life);
    strokeWeight(size);
    point(pos.x,pos.y);
    popStyle();
  }
  
}

