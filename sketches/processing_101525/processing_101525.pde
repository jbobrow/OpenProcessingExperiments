

WaterParticleSystem water;

void setup()  {
  size(300, 300);
  noStroke();
  water = new WaterParticleSystem();
}

void draw()  {
  background(255);
  water.run();
  fill(0);
  text("TrevPhil", width-30, height-10);
}

class WaterContainer {
  float angle;
  float slider = 10;
  float translateX = width/2;
  float translateY = height/2;
  float w = 50;
  float h = 100;
  float boxArea = w * h;
  float mX1;
  float mY1;
  float mX2;
  float mY2;
  float mX3;
  float mY3;
  float mX4;
  float mY4;
  float wallHit = 0;

  WaterContainer() {
    textAlign(CENTER);
  }

  void run(ArrayList<WaterParticle> pList) {
    angleSlider();

    stroke(0);
    strokeWeight(5);
    noFill();
    pushMatrix();
    translate(translateX, translateY);
    rotate(angle);
    rect(-w/2 - 2, -h - 2, w + 4, h + 4);
    mX1 = screenX(-w/2, -h);  //  these are the coordinates of the container's corners with respect to the original matrix
    mY1 = screenY(-w/2, -h);
    mX2 = screenX(w/2, -h);
    mY2 = screenY(w/2, -h);
    mX3 = screenX(w/2, 0);
    mY3 = screenY(w/2, 0);
    mX4 = screenX(-w/2, 0);
    mY4 = screenY(-w/2, 0);
    popMatrix();
    noStroke();

    for (WaterParticle p : pList) {
      checkEdges(p);
    }
  }

  float calcTriangleArea(float x1, float y1, float x2, float y2, float x3, float y3) {
    //  this applies the formula for area of a triangle according, given 3 points
    float area = abs( (x1*(y2-y3) + x2*(y3-y1) + x3*(y1-y2)) / 2 );
    return area;
  }

  void checkEdges(WaterParticle p) {
    float t1 = calcTriangleArea(p.pos.x, p.pos.y, mX1, mY1, mX2, mY2);
    float t2 = calcTriangleArea(p.pos.x, p.pos.y, mX2, mY2, mX3, mY3);
    float t3 = calcTriangleArea(p.pos.x, p.pos.y, mX3, mY3, mX4, mY4);
    float t4 = calcTriangleArea(p.pos.x, p.pos.y, mX4, mY4, mX1, mY1);
    float tSum = t1 + t2 + t3 + t4;
    //  if the area of all 4 triangles equals the area of the box, the particle is inside the box
    if (tSum > boxArea+.01) {
      p.pos.sub(p.vel);
      findWhichWall(t1, t2, t3, t4);
      bounce(p);
    }
    if (tSum > boxArea+170) {
      //  if the particle gets REALLY for out, it gets put in the center of the box
      p.pos.x = (mX1 + mX2 + mX3 + mX4) / 4;
      p.pos.y = (mY1 + mY2 + mY3 + mY4) / 4;
    }
  }
  boolean checkMouse() {
    float t1 = calcTriangleArea(mouseX, mouseY, mX1, mY1, mX2, mY2);
    float t2 = calcTriangleArea(mouseX, mouseY, mX2, mY2, mX3, mY3);
    float t3 = calcTriangleArea(mouseX, mouseY, mX3, mY3, mX4, mY4);
    float t4 = calcTriangleArea(mouseX, mouseY, mX4, mY4, mX1, mY1);
    float tSum = t1 + t2 + t3 + t4;
    if (tSum > boxArea+.01) {
      return false;
    }  
    else {
      return true;
    }
  }

  void angleSlider() {
    fill(0);
    text("click and drag slider to rotate container", width/2, 25);
    text("click inside the box to reset particles", 115, height-10);
    stroke(0);
    noFill();
    strokeWeight(1);
    rect(10, 10, width-20, 20);
    fill(80, 210, 200, 120);
    rect(slider, 10, 20, 20);
    if (mouseX >= 10 && mouseX <= width-20 && mouseY >= 10 && mouseY <= 30 && mouseButton == LEFT) {
      slider = mouseX-10;
    }
    if(mouseY > 30 && mouseButton == LEFT)  {
      mouseButton = false;
    }
    if (slider < 10) {
      slider = 10;
    }
    if (slider > width-30) {
      slider = width-30;
    }
    angle = TWO_PI * ( slider-10 ) / ( width - 40 );
  }


  void findWhichWall(float t1, float t2, float t3, float t4) {
    float[] tri = {
      t1, t2, t3, t4
    };
    tri = sort(tri);
    if (tri[0] == t1) {
      wallHit = 1;
    }
    if (tri[0] == t2) {
      wallHit = 2;
    }
    if (tri[0] == t3) {
      wallHit = 3;
    }
    if (tri[0] == t4) {
      wallHit = 4;
    }
  }
  void bounce(WaterParticle p) {
    PVector base1 = new PVector();
    PVector base2 = new PVector();
    if (wallHit == 1) {
      base1 = new PVector(mX1, mY1);
      base2 = new PVector(mX2, mY2);
    }
    if (wallHit == 2) {
      base1 = new PVector(mX2, mY2);
      base2 = new PVector(mX3, mY3);
    }
    if (wallHit == 3) {
      base1 = new PVector(mX3, mY3);
      base2 = new PVector(mX4, mY4);
    }
    if (wallHit == 4) {
      base1 = new PVector(mX4, mY4);
      base2 = new PVector(mX1, mY1);
    }

    PVector baseDelta = PVector.sub(base2, base1);
    baseDelta.normalize();
    PVector normal = new PVector(-baseDelta.y, baseDelta.x);
    float baseLength = PVector.dist(base1, base2);
    PVector incidence = PVector.mult(p.vel, -1);
    incidence.normalize();

    PVector[] coords = new PVector[int(baseLength)];
    for (int i=0; i < coords.length; i++) {
      coords[i] = new PVector();
      coords[i].x = base1.x + ((base2.x-base1.x)/baseLength)*i;
      coords[i].y = base1.y + ((base2.y-base1.y)/baseLength)*i;

      if (PVector.dist(p.pos, coords[i]) < 2) {  //  2 for radius of particle
        float dot = incidence.dot(normal);
        p.vel.set(2*normal.x*dot - incidence.x, 2*normal.y*dot - incidence.y, 0);
      }
    }
  }
}


class WaterParticle {
  float r = 2;
  float separationDist = r + r;
  float tooFarAway = r + r + r + r;
  PVector gravity = new PVector(0, .02);
  PVector accel;
  PVector vel;
  PVector pos;

  WaterParticle(float x, float y) {
    accel = new PVector(0, 0);
    vel = new PVector(0, 0);
    pos = new PVector(x, y);
  }

  void applyForce(PVector force) {
    //  force.div(mass);
    accel.add(force);
  }
  void update(ArrayList<WaterParticle> particleList) {
    applyForce(separate(particleList));
    applyForce(cohesion(particleList));
    accel.normalize();
    accel.mult(.08);
    applyForce(gravity);
    vel.add(accel);
    pos.add(vel);
  }
  PVector separate(ArrayList<WaterParticle> particleList) {
    PVector separationForce = new PVector(0, 0);
    for (WaterParticle p : particleList) {
      if (p != this && dist(pos.x, pos.y, p.pos.x, p.pos.y) < separationDist) {
        PVector diff = PVector.sub(pos, p.pos);
        separationForce.add(diff);
      }
    }
    return separationForce;
  }
  PVector cohesion(ArrayList<WaterParticle> particleList) {
    PVector sum = new PVector(0, 0);
    float count = 0;
    for (WaterParticle p : particleList) {
      float distance = dist(pos.x, pos.y, p.pos.x, p.pos.y);
      if (p != this && distance < tooFarAway) {
        sum.add(p.pos);
        count++;
      }
    }
    sum.div(count);
    PVector moveHere = PVector.sub(sum, pos);
    PVector cohesionForce = PVector.sub(moveHere, vel);
    return cohesionForce;
  }
  void display(ArrayList<WaterParticle> particleList) {
    update(particleList);
    fill(0, 0, 255);
    ellipse(pos.x, pos.y, r+r, r+r);
  }
}


class WaterParticleSystem {

  int rowColSize = 15;
  int numParticles = rowColSize*rowColSize;
  ArrayList<WaterParticle> particleList = new ArrayList<WaterParticle>();
  float translateX = width/2;
  float translateY = height/2;
  WaterContainer con;

  WaterParticleSystem() {
    for (int i = 0; i < rowColSize; i++) {
      for (int j = 0; j < rowColSize; j++) {
        addParticle(width/2 + i*.001, height/2 + j*.001);
      }
    }
    con = new WaterContainer(); 
  }

  void run() {
    for (WaterParticle p : particleList) {
      p.display(particleList);
    }
    if (mousePressed && con.checkMouse()) {
      mousePressed = false;
      init(mouseX, mouseY);
    }
    con.run(particleList);
  }

  void addParticle(float x, float y) {
    particleList.add(new WaterParticle(x, y));
  }

  void init(float x, float y) {
    particleList.clear();
    for (int i = 0; i < rowColSize; i++) {
      for (int j = 0; j < rowColSize; j++) {
        addParticle(x + i*.001, y + j*.001);
      }
    }
  }
}



