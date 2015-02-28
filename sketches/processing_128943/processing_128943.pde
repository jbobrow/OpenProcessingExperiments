
ArrayList<Stars> poop = new ArrayList();

void setup() {
  size(600, 400);
  for (int i=0;i<800;i++) {
    Stars s = new Stars();
    poop.add(s);
  }
}

void draw() {
  background(0);
  for (int i=0;i<poop.size();i++) {
    Stars si = (Stars) poop.get(i);
    si.display();
    si.update();
    for (int j=i+1;j<poop.size();j++) {
      Stars sj = (Stars) poop.get(j);
      if(sj.rad>2 && si.rad>2 && dist(si.x,si.y,sj.x,sj.y)<20){
        stroke(-1,60);
        line(si.x,si.y,sj.x,sj.y);
      }
    }
  }
}

class Stars {
  float rad, x, y;
  Stars() {
    rad = random(0.5, 3);
    x = random(0, width);
    y = random(0, height);
  }

  void display() {
    noStroke();
    if(rad<2) fill(-1);
    else fill(-1,rad*30);
    ellipse(x, y, rad, rad);
  }

  void update() {
    y = y + random(-0.2, 0.2);
    x = x + random(-0.2, 0.2);
  }
}

