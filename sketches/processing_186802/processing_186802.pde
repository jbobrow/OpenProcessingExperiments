
ArrayList Tree;

float rotation_min = -50;
float rotation_max = 50;
float lineWeight_min = 0.5;
float lineWeight_max = 10;

int Trees = 10;
int Detail = 4096*1;
float Velocity = 1;

float lineWeight = 2;

boolean reset = true;

void setup() {
  size(500, 500);
  smooth();
  Tree = new ArrayList();
  for (int i = 0; i < Trees; i++) {
    Branch Limb = new Branch(new PVector(width/2, height/2), new PVector(random(-Velocity, Velocity), random(-Velocity, Velocity)), 70);
    Tree.add(Limb);
  }
}

void draw() {
  background(0);
  for (int i = Tree.size ()-1; i >= 0; i--) {
    float randomTheta_1 = random(rotation_min, rotation_max);
    float randomTheta_2 = random(rotation_min, rotation_max);
    Branch Limb = (Branch) Tree.get(i);
    Limb.update();
    Limb.render();
    if (Limb.timeToBranch()) {
      if (Tree.size() < Detail) {
        //Tree.remove(i);
        Tree.add(Limb.branch(randomTheta_1));
        Tree.add(Limb.branch(randomTheta_2));
      }
            if(Tree.size() >= Detail){
              
        reset = true;
    }
  }
}
  if(reset == true){
  setup();
  reset = false;
}
}
class Branch {
  PVector start;
  PVector end;
  PVector vel;
  float timer;
  float timerstart;

  boolean growing = true;
  boolean shrinking = true;

  Branch(PVector l, PVector v, float t) {
    start = l.get();
    end = l.get();
    vel = v.get();
    timerstart = t;
    timer = timerstart;
  }

  void update() {
    if (growing) {
      end.add(vel);
    }
  }

  void render() {
    strokeWeight(lineWeight);
    stroke(255);
    line(start.x, start.y, end.x, end.y);
  }

  boolean timeToBranch() {
    timer--;
    if (timer < 0 && growing) {
      growing = false;
      return true;
    } else {
      return false;
    }
  }
  boolean timeToShrink() {
    timer--;
    if (timer < 0 && shrinking) {
      shrinking = false;
      return true;
    } else {
      return false;
    }
  }

  Branch branch(float angle) {
    float theta = vel.heading2D();
    float mag = vel.mag();
    theta += radians(angle);
    PVector newvel = new PVector(mag*cos(theta), mag*sin(theta));
    return new Branch(end, newvel, timerstart*0.66f);
  }
}



