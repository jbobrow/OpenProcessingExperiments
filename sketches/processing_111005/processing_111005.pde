
boolean mouseIsDown;
ArrayList<OrbitSphere> osphs;
GravitySphere gs;
ArrayList<GravitySphere> gsphs;
float t = 0;
boolean creating = false;
boolean moving = false;
float gridSize = 32;
ArrayList<ArrayList<OrbitSphere>> grid;

void setup() {
  size(320, 480);
  osphs = new ArrayList<OrbitSphere>();
  for (int i = 0; i < 200; i++) {
    //osphs[i] = new OrbitSphere();
    osphs.add(new OrbitSphere());
  }
  gsphs = new ArrayList<GravitySphere>();
  
  grid = new ArrayList<ArrayList<OrbitSphere>>();
  
}

void draw() {
  t++;
  background(40, 20, 70);
  for (int i = 0; i < osphs.size(); i++) {
    osphs.get(i).draw();
  }
  if (gs != null) {
    gs.attractRad = sqrt(pow(mouseX - gs.pos.x, 2) + pow(mouseY - gs.pos.y, 2));
  }
  
  for (int i = 0; i < gsphs.size(); i++) {
    gsphs.get(i).draw();
  }
  
  if (mouseIsDown && (mouseX != pmouseX || mouseY != pmouseY)) {
    gs = new GravitySphere(mouseX, mouseY);
    gs.attractRad = min(500, 100 / sqrt(new PVector(mouseX - pmouseX, mouseY - pmouseY).mag()));
    gs.attract();
    gsphs.add(gs);
    gs = null;
  }
}

void mousePressed() {
  if (!mouseIsDown) {
    for (int i = 0; i < gsphs.size(); i++) {
      GravitySphere g = gsphs.get(i);
      float mox = mouseX - g.pos.x;
      float moy = mouseY - g.pos.y;
      //println(mox);
      //println(moy);
      if (mox >= -g.size && mox <= g.size && moy >= -g.size && moy <= g.size) {
        gs = g;
        println("YAY");
        return;
      }
    }
    /*
    gs = new GravitySphere(mouseX, mouseY);
    gsphs.add(gs);
    creating = true;
    */
    mouseIsDown = true;
  }
}

void mouseDragged() {
  
  //println("GGGG");
  if (!creating) {
    moving = true;
  }
  
}

void mouseReleased() {
  /*
  if (creating) {
    gs.attract();
    gs = null;
    creating = false;
  }
  else if (!moving) {
    if (gs != null) {
      gsphs.remove(gs);
      gs.destroy();
    }
  }
  else {
    moving = false;
  }
  */
  mouseIsDown = false;
}

class GravitySphere {
  PVector pos;
  float size;
  float attractRad;
  ArrayList<OrbitSphere> stsphs;
  int life = 30;
  
  GravitySphere(int px, int py) {
    pos = new PVector(px, py);
    size = 1;
    stsphs = new ArrayList<OrbitSphere>();
  }
  
  void draw() {
    if (life >= 0) {
      noStroke();
      fill(255);
      float n = noise(pos.x, pos.y, t/100.0);
      ellipse(pos.x, pos.y, size + size/2*n, size + size/2*n);
      fill(255, 100);
      ellipse(pos.x, pos.y, size + size*n, size + size*n);
      fill(255, 10);
      life--;
    }
    /*
    if (this == gs) {
      noFill();
      stroke(255);
      strokeWeight(1);
      ellipse(pos.x, pos.y, attractRad*2, attractRad*2);
    }
    */
    
    if (life == 0) {
      destroy();
      gsphs.remove(gs);
    }
  }
  
  void attract() {
    int ct = 0;
    for (int i = 0; i < osphs.size(); i++) {
      OrbitSphere osph = osphs.get(i);
      if (osph.orbitee == null && PVector.sub(pos, osph.pos).mag() < attractRad) {
        osph.orbitee = this;
        stsphs.add(osph);
        osph.ang = atan2(osph.pos.y - pos.y, osph.pos.x - pos.x);
        PVector diff = PVector.sub(osph.pos, pos);
        osph.orbitRad = diff.mag();
        ct++;
      }
    }
    size += ct/3;
  }
  
  void destroy() {
    for (int i = 0; i < stsphs.size(); i++) {
      OrbitSphere osph = stsphs.get(i);
      osph.orbitee = null;
    }
  }

}

class OrbitSphere {
  PVector pos;
  float size;
  PVector vel;
  GravitySphere orbitee;
  color col;
  boolean ccw;
  float ang;
  float orbitRad;
  float vmag;
  
  OrbitSphere() {
    size = random(15);
    pos = new PVector(random(320-size), random(480-size));
    vel = new PVector(random(0.5), random(0.5));
    vmag = vel.mag();
    col = color(random(100) + 100, random(100) + 100, random(100) + 100);
  }
  
  void draw() {
    if (orbitee == null) {
      
      pos.x += vel.x;
      if (pos.x + size/2 > 320 || pos.x - size/2 < 0) {
        vel.x = -vel.x;
      }
      
      pos.y += vel.y;
      if (pos.y + size/2 > 480 || pos.y - size/2 < 0) {
        vel.y = -vel.y;
      }
      
      noStroke();
      fill(col, 20);
      ellipse(pos.x, pos.y, size/2, size/2);
      fill(col, 10);
      ellipse(pos.x, pos.y, size * 2, size * 2);
      
    }
    
    else {
      
      ang = ang + vmag / sqrt(size) / 20;
      vel.x = orbitee.pos.x + orbitRad * cos(ang) - pos.x;
      pos.x += vel.x;
      vel.y = orbitee.pos.y + orbitRad * sin(ang) - pos.y;
      pos.y += vel.y;
      PVector diff = PVector.sub(pos, orbitee.pos);
      //diff.rotate((float)(Math.PI/2));
      float px = diff.x;
      float py = diff.y;
      diff.y = -px;
      diff.x = py;
      stroke(col, 200000/(orbitRad*orbitRad));
      strokeWeight(0.5);
      //line(pos.x, pos.y, pos.x - diff.x * 5, pos.y - diff.y * 5);
      noFill();
      //fill(col, 10);
      ellipse(orbitee.pos.x, orbitee.pos.y, orbitRad*2, orbitRad*2);
      
      noStroke();
      fill(col, 2000000/(orbitRad*orbitRad));
      ellipse(pos.x, pos.y, size/2, size/2);
      fill(col, 100000/(orbitRad*orbitRad));
      ellipse(pos.x, pos.y, size, size);
    }
    /*
    size -= 0.03;
    if (size <= 0) {
      osphs.remove(this);
      if (orbitee != null) {
        orbitee.stsphs.remove(this);
      }
    }
    */
  }
}
