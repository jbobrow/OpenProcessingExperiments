
baseParSys[] pp = new baseParSys[3];
PImage star;

void setup() {
  size(500, 500);
  star = loadImage("star.png");
  
  pp[1] = new baseParSys(width/2, height/2);
  pp[2] = new baseParSys(width/2, height/2);
  
  background(0);
}

void draw() {
  fill(0, 50);
  rect(0, 0, width, height);
  
  float xgrav = random(-sin(radians(frameCount)), sin(radians(frameCount)));
  float ygrav = random(-sin(radians(frameCount)), sin(radians(frameCount)));
  
  PVector gravity = new PVector(xgrav, ygrav);
  
  //pp[1].applyForce(gravity);
  pp[1].addParticle();
  pp[1].run();
  
  pp[2].applyForce(gravity);
  pp[2].addRedParticle();
  pp[2].run();
  
}
import java.util.*;

class baseParSys {
  
  ArrayList<starBase> parPnt;
  PVector origin;
  
  baseParSys(float x, float y) {
    origin = new PVector(x, y);
    parPnt = new ArrayList<starBase>();
  }
  
  void run() {
    for (int i = parPnt.size()-1; i > 0; i--) {
      starBase p = parPnt.get(i);
      p.run();
      
      if (p.isDead()) {
        parPnt.remove(p);
      }
    }
  }
  
  void addParticle() {
    parPnt.add(new starBase(origin));
  }
  
  void addRedParticle() {
    parPnt.add(new starRed(origin));
  }
  
  void applyForce(PVector f) {
    for (starBase p: parPnt) {
      p.applyForce(f);
    }
  }
}
class starBase {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float lifespan;
  float mass = 1;
  float tran = 255;
  float rotation;


  starBase(PVector l) {
    location = l.get();
    lifespan = 500;
    acceleration = new PVector(random(-2, 2), random(-1, 1));
    velocity = new PVector(random(-1, 1), random(-1, 1));
    
    rotation = random(-5, 5);
  }

  void run() {
    update();
    display();
    checkedges();
  }

//  void rotateStar() {
//    float rad = radians(frameCount);
//    rotate(rad);
//  }

  void display() {
    tint(255, tran);
    pushMatrix();
    imageMode(CENTER);
    translate(location.x, location.y);
    scale(.5, .5);
//    rotateStar();
    rotate(rotation*radians(frameCount));
    image(star, 0, 0);
    tran-=1;
    popMatrix();
  }

  void checkedges() {
    if (location.x+star.width/4 > width) {
      velocity.x = velocity.x*-1;
    } 
    else if (location.x-star.width/4 < 0) {
      velocity.x = velocity.x*-1;
    }

    if (location.y+star.height/4 > height) {
      velocity.y = velocity.y*-1;
    } 
    else if (location.y-star.height/4 < 0) {
      velocity.y = velocity.y*-1;
    }
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}

class starRed extends starBase {
  
  starRed(PVector l) {
    super(l);
  }
  
    void display() {
    tint(255, 0, 0, tran);
    pushMatrix();
    imageMode(CENTER);
    translate(location.x, location.y);
    scale(.2, .2);
//  rotateStar();
    image(star, 0, 0);
    tran-=1;
    popMatrix();
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}


