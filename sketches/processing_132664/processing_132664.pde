
VectorField vf;
ParticleSystem ps;

boolean showRot= true, showDiv=true, showVect = true, showHeading = false;

void setup() {
  size(600, 400, P2D);
  vf = new VectorField();
  ps = new ParticleSystem();
}

void draw() {
  background(255);
  vf.update();
  vf.draw(showRot, showDiv, showVect, showHeading);
  ps.update();
  ps.followField(vf);
  ps.draw();
 
  
}





void mouseDragged() {
  vf.modify(mouseX, mouseY, pmouseX, pmouseY);
   
}

void keyPressed() {
   
  if (keyPressed) {
    if (key=='r') {
      showRot =!showRot;
    }
  }
  
  if (keyPressed) {
    if (key=='d') {
      showDiv =!showDiv;
    }
  }
  if (keyPressed) {
    if (key=='v') {
      showVect =!showVect;
    }
  }
  
    if (keyPressed) {
    if (key=='h') {
      showHeading =!showHeading;
    }
  }
  
  
   if (keyPressed) {
    if (key=='p') {
     Particle p = new Particle(mouseX, mouseY);
     PVector m = new PVector(mouseX-pmouseX, mouseY-pmouseY);
     m.mult(10);
     p.vel.add(m);
  //p.vel.add(mouseX-pmouseX, mouseY-pmouseY);
  ps.particles.add(p);
    }
  }
  
}
class Particle extends PVector {

  PVector vel, acc;
  float life;

  Particle(float x_, float y_) {
    super(x_, y_);
   // vel = new PVector(random(-1, 2), -1);
    vel = new PVector();
    acc = new PVector();
    life = 1;
  }

  void follow(PVector target) {
    PVector v = target.get();
    v.sub(this);
    v.mult(0.0);
    vel.add(v);
  }


void followField(VectorField vf) {
  vel.add(vf.lookup(this.get()));
  vel.mult(0.1);
}

  void update() {
    life = max(0, life-0.0002);
    PVector force = new PVector(0, 0*.5);
    acc.set(force);
    vel.add(acc);
    this.add(vel);
    if (x > width) x = 0;
    if (y > height) y = 0;
    if (x <  0) x = width;
    if (y < 0) y = height;
  }








  void draw() {
    float ang = vel.heading();
    colorMode(HSB, 360, 100, 100);
    fill(degrees(ang), 70, 70, 100);
    noStroke();
    arc(x, y, 30*life, 30*life, ang-1, ang+1);
    colorMode(RGB, 255, 255, 255);
  }
}

class ParticleSystem {

  ArrayList <Particle> particles;

  ParticleSystem() {
    particles = new ArrayList();
  }

  void update() {
    java.util.Iterator iter = particles.iterator();
    while (iter.hasNext ()) {
      Particle p = (Particle) iter.next();
      if (p.life == 0) {
        iter.remove();
      }
    }

    for (int n = 0; n < particles.size(); n++) {
      Particle p1 = particles.get(n);
      Particle p2 = (n == particles.size()-1) ? particles.get(0) : particles.get(n+1);
     p1.follow(p2);
    }

    for (Particle p : particles) {
      p.update();
     // p.followField();
    }
  }


void followField(VectorField vf) {
  for (Particle p : particles) {
   //  p.vel.set(vf.lookup(vf));
  //  p.vel.set(2, 2);
      p.followField(vf);
    }
  
}

  void draw() {
    for (Particle p : particles) {
      p.draw();
    }
  }
}

class VectorField {

  PVector[][] v;
  int resolution = 10;
  int dimX = width/resolution, dimY = height/resolution;
  float dx, dy;
  float[][] dv, rot;

  VectorField() {
    v = new PVector[dimX][dimY];
    dv = new float[dimX][dimY];
    rot = new float[dimX][dimY];
    dx = width/dimX;
    dy = height/dimY;
    initVectors();
  }

  void initVectors() {
    for (int i = 0; i < dimX; i++) {
      for (int j = 0; j < dimY; j++) {
        float x = (i+.5)*dx+frameCount;
        float y = (j+.5)*dy;
        float vx = noise(x*0.01, y*0.01)-.5; // noise(x,y)
        float vy = noise((x+width)*0.01, y*0.01)-.5; 
        v[i][j] = new PVector(vx, vy);
        v[i][j].setMag(20);
      }
    }
  }

  void divergence() {
    for (int i = 0; i < dimX; i++) {
      for (int j = 0; j < dimY; j++) {
        int right = (i == dimX-1) ? 0 : i+1;
        int down = (j == dimY-1) ? 0 : j+1;
        dv[i][j] = v[i][j].dot(new PVector(-1, -1));
        dv[i][j] += v[right][j].dot(new PVector(1, -1));
        dv[i][j] += v[right][down].dot(new PVector(1, 1));
        dv[i][j] += v[i][down].dot(new PVector(-1, 1));
      //  println(dv[i][j]);
      }
    }  
  }
  
    void rotational() {
    for (int i = 0; i < dimX; i++) {
      for (int j = 0; j < dimY; j++) {
        int right = (i == dimX-1) ? 0 : i+1;
        int down = (j == dimY-1) ? 0 : j+1;
        PVector w = v[i][j].get().cross(new PVector(-1, -1));
        w.add(v[right][j].get().cross(new PVector(1, -1)));
        w.add(v[right][down].get().cross(new PVector(1, 1)));
        w.add(v[i][down].get().cross(new PVector(-1, 1)));
     //   println(w.x, w.y, w.z);
        float s=-1.0;
        if (abs(w.z)==w.z) {
        s=1.0;
        }
       // println(s);
        rot[i][j] = w.mag()*s;
    //    println( rot[i][j]);
      }
    }  
  }

  void smoothVectors(float f) {
    for (int i = 0; i < dimX; i++) {
      for (int j = 0; j < dimY; j++) {
        int left = (i == 0) ? dimX-1 : i-1;
        int right = (i == dimX-1) ? 0 : i+1;
        int up = (j == 0) ? dimY-1 : j-1;
        int down = (j == dimY-1) ? 0 : j+1;
        PVector w = v[left][j].get();
        w.add(v[i][up]);
        w.add(v[right][j]);
        w.add(v[i][down]);
        w.mult(.25);
        w.mult(f);
        v[i][j].mult(1-f);
        v[i][j].add(w);
        v[i][j].setMag(10);
      }
    }
  }

  void update() {
    smoothVectors(10*.005);
    divergence();
    rotational();
  }

  void modify(float mx, float my, float pmx, float pmy) {
    PVector force = new PVector(mx-pmx, my-pmy);
    for (int i = 0; i < dimX; i++) {
      for (int j = 0; j < dimY; j++) {
        float x = (i+.5)*dx;
        float y = (j+.5)*dy;
        float d = dist(x, y, mx, my);
        if (d < 50) {
          float f = map(d, 0, 50, 1, 0);
          PVector tmp = force.get();
          tmp.mult(f);
          v[i][j].add(tmp);
          v[i][j].setMag(10);
        }
      }
    }
  }
  
  
  
  PVector lookup(PVector lookup) {
 
    int column = int(constrain(lookup.x/resolution,0,dimX-1));
    int row = int(constrain(lookup.y/resolution,0,dimY-1));
    return v[column][row].get();
  }
  
  
  
  
  
  
  
  

  void draw(boolean showRot, boolean showDiv, boolean showVect, boolean showHeading) {
    for (int i = 0; i < dimX; i++) {
      for (int j = 0; j < dimY; j++) {
        float x = (i+.5)*dx;
        float y = (j+.5)*dy;
        float ang = v[i][j].heading()+PI;
          rectMode(CENTER);
        
        
      if (showHeading) {  
        colorMode(HSB, 360, 100, 100);
        fill(degrees(ang), 40, 60, 200);
        rectMode(CENTER);
         rect(x, y, dx, dy);

      }
        // DIVERGENCE
        if (showDiv) {
          colorMode(RGB, 255, 255, 255);
        fill(125, 125, 120, 100);
        noStroke();
        if (dv[i][j] > 5) {
          fill(125, 125, 120, 100);
          ellipse(x, y, dv[i][j]*2, dv[i][j]*2);
        }
         if (dv[i][j] < -5) {
          fill(50, 50, 50, 100);
          ellipse(x, y, -dv[i][j]*2, -dv[i][j]*2);
        }
        }
        // ROTATIONAL
        if ((abs(rot[i][j]) > 10) && showRot) {
          pushMatrix();
          translate(x, y);
          rotate(-rot[i][j]*frameCount*0.001);
          stroke(20,20,20);
          noFill();
          rect(0,0, rot[i][j], rot[i][j]);
          popMatrix();
        }
        
        
        // vector
        if (showVect) {
        // vecteurs
        //ellipse(x, y, 15, 15);
        beginShape(LINES);
        stroke(50);
        vertex(x, y);
        stroke(50);
        vertex(x+v[i][j].x, y+v[i][j].y);
        endShape();
      }
      }
    }
  }
}


