
Walker walker;

void setup(){
  size(500,500);
  background(0);
  smooth();
  walker = new Walker();
}

void draw(){
  walker.show();
  walker.move();
}

class Walker{
  PVector pos;

  Walker(){
    pos = new PVector(width/2,490);  
  }

  void show(){
    fill(125,90);
    ellipse(pos.x,pos.y,20,20);
  }

  void move(){
    PVector v = new PVector(random(-8,8),random(-3,1));
    pos.add(v);
    if (pos.y < 10){
      pos = new PVector(width/2,490);
    }
  }
}





