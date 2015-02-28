
class Node {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  int timer;
  int life;
  color bgColor;
  
  Node(){
    this(new PVector(random(width), random(height)));
  }

  Node(PVector _loc){
    this(_loc.get(),color(random(100), 50, 50, random(50, 150)), (int)random(10, 100));
  }
  
 Node(PVector _loc, color _bgColor, int _life){
    loc = _loc.get();
    bgColor = _bgColor;
    life = _life;
    r = 1.0;
    timer = 0;  
  }
  
  void run(){
    update();
    render();
  }
  
  void update(){
    timer = timer < life ? timer + 1 : life;
    r = (float)timer;
    //println("timer = " + timer + " / life = " + life);
  }
  
  void render(){
    ellipseMode(CENTER);
    noStroke();
    fill(bgColor);
    ellipse(loc.x, loc.y, r, r);
  }
  
  Boolean dead(){
    return timer > life;
  }  
}

