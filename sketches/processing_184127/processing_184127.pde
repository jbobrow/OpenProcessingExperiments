
Photon photon;

void setup() {
  size(600, 600);
  photon = new Photon();
}

void draw() {
  background(0);
  photon.create();
  photon.updateGroup();
  photon.drawGroup();
}

//===OBJECT====
class Photon {
  float angle;
  float velocity;
  float x, y;
  float waylong; 
  float alpha;
  color _col;
  Photon[] group = {};

  Photon() {
    angle = random(2*PI);
    velocity = random(4, 5);
    x = width/2;
    y = height/2;
    waylong = 0;
    alpha = 0;
    _col = color(random(255), random(255), random(255));
  }

  void updateMe() {
    x += velocity*cos(angle);
    y += velocity*sin(angle);   
    waylong += 0.2*velocity;
    alpha = waylong*dist(0,0,width,height)/(255*sqrt(2));
  }

  void drawMe() {
    fill(_col, alpha);
    noStroke();
    if (0 < x+waylong/2 || x - waylong < width) { 
      if (0 < y+waylong/2 || y - waylong < height) {
        ellipse(x, y, waylong, waylong);
      }
    }
  }

  void create() {
    Photon newphoton = new Photon();
    group = (Photon[])append(group, newphoton);
  }

  void updateGroup() {
    for (int i =0; i < group.length; i++) {
      group[i].updateMe();
    }
  }

  void drawGroup() {
    for (int i =0; i < group.length; i++) {
      group[i].drawMe();
    }
  }
}


