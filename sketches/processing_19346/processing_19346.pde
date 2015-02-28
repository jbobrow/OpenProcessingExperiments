
import toxi.geom.*;

ArrayList Agents = new ArrayList();
int AgentPop = 100;

void setup() {
  size(1000,600);
  smooth();
  for (int i = 0; i < AgentPop; i++) {
    Vec3D p = new Vec3D(random(0,width),random(0,height),0);
    Vec3D v = new Vec3D(random(-1,1),random(-1,1),0);
    float mv = 4;
    float mf = 0.2;
    tAgents a = new tAgents(p,v,mv,mf);
    Agents.add(a);
  }
}

void draw() {
  fill(0,30);
  rect(-20,-20,width+40,height+40);
  for (int i = 0; i < Agents.size(); i++) {
    tAgents a = (tAgents) Agents.get(i);
    a.update(Agents);
    a.render(i+1);
  }
}


