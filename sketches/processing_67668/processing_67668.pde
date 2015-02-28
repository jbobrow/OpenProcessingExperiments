
import java.util.*;

HeartSystem hs = new HeartSystem();

void setup() {
  size(600,600,P2D);
  smooth();
  background(255);
  noStroke();  
}

void draw() {
  Heart h = new Heart(new PVector(width/2, height/2), new PVector(random(-2,2), random(-2,2)), rNeg(PI/72,PI/64), random(17,25));
  hs.add(h);
  hs.draw();
}

float rNeg(float minAbs, float maxAbs) {
  int rneg = (int)random(2);
  float r = random(minAbs, maxAbs);
  
  if (rneg == 0) {
    return -r;
  }
  
  return r;  
}

class HeartSystem {
  private List<Heart> hearts = new ArrayList<Heart>();
  
  public void add(Heart h) {
    hearts.add(h);
  }
  
  public void draw() {
    for (int i = 0; i < hearts.size(); i++) {
      Heart h = hearts.get(i);
      if (h.isOOB()) {
        hearts.remove(i);
      } else {
        h.draw();
      }      
    }
  }
}

class Heart {
  PVector pos;
  final PVector vel;
  float size, rot;
  final float drot;
  
  private color col, scol;
  private int time = 0;
  
  private static final int maxTime = 100;
  
  public Heart(PVector pos, PVector vel, float drot, float size) {
    this.pos = pos;
    this.vel = vel;
    this.rot = rot;
    this.drot = drot;
    this.size = size;
    
    float red = random(150,255);
    this.col = color(red,0,0);
    this.scol = color(red-20,0,0);
  }
  
  public void draw() {
    update();
    render();
  }
  
  public void update() {
    rot += drot;
    pos = PVector.add(pos, vel);
    time++;
  }
  
  public void render() {
    float dt = 6f/size;
    
    fill(col);
    stroke(scol);
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(rot);
    scale(1+0.1*sin(time*TWO_PI/30));
    
    beginShape();
    for (float t = 0; t <= TWO_PI; t += dt) {
      float sint = sin(t);
      float x = size*16*sint*sint*sint/17;
      float y = -size*(13*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t))/17;
      vertex(x, y);
    }
    endShape();
    
    popMatrix();
  }
  
  public boolean isOld() {
    return time > maxTime;
  }
  
  public boolean isOOB() {
    return pos.x+size < 0 || pos.x-size > width || pos.y+size < 0 || pos.y-size > height;
  }
}


