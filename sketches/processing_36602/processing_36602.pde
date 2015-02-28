
class Agent {

  Vec2D loc;
  Vec2D vel;
  float agentSize = 5;
  Circle agentC;
  Circle c=new Circle(width/2, height/2, 100);

  Agent (Vec2D LOC, Vec2D VEL) {
    loc = LOC;
    vel = VEL;
  } 

  void run() {
    render();
    intersect();
    move();
  }
  void render() {
    agentC  =new Circle(loc, agentSize);
    gfx.ellipse(c);
    gfx.ellipse(agentC);
  }
  void move() {
    loc.addSelf(vel);
  }

  void intersect () {
    Vec2D[] isec=c.intersectsCircle(agentC);
    if (isec!=null) {
      for (int j=0; j<2; j++) {
        //gfx.ellipse(new Circle(isec[j], 25));
        //  gfx.ray(new Ray2D(p, isec[j].sub(p)), 1000);
        //gfx.line(c, isec[j]);
        agentSize = 10;
      }
    }
  }
}


