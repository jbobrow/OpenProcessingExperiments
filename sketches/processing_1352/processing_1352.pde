

import java.util.*;

class Bubble {
  PVector loc;
  PVector vel;
  PVector acc;

  boolean held = false;

  float r = random(maxSize)+minSize;
  float conDist = r/connectionRange;

  int maxConnects = (int) (r/maxConFactor);

  color col;

  ArrayList connected;

  Bubble(float x, float y) {
    if(maxConnects < 1) maxConnects=1;
    loc = new PVector(x,y);
    vel = new PVector(random(5)-5,random(5)-5);
    acc = new PVector(0,0);
    col = color(random(100),random(100),random(100));
    connected = new ArrayList();
  }

  void setSize(float s) {
    r = s;
    conDist = r/connectionRange;
  }

  void update() {
    Bubble b;
    PVector diff;
    float d;

    for(int i = 0; i < bubbles.length; i++) {
      b = bubbles[i];
      if(b != this) {
        diff = PVector.sub(b.loc,loc);
        d = diff.mag();
        if(d-r < b.r) {
          diff.mult(repelMultiplier);
          acc.sub(diff);
          vel.limit(vel.mag()-(vel.mag()/ballDamping));
          if(connections_enabled && d-conDist < b.conDist && b.connected.size() < b.maxConnects && connected.size() < maxConnects && ! connected.contains(b)) {
            connected.add(b);
            b.connected.add(this);
          }
        }
        else if(connected.contains(b) && d-r-spare > b.r+spare) {
          diff.mult(accelMultiplier);
          acc.add(diff);
        }
      }
    }

    acc.limit(maxSteer);
    vel.add(acc);
    if(grav_enabled) {
      vel.add(gravity);
    }

    //vel.limit(maxSpeed);
    vel.limit(vel.mag()-(vel.mag()/damping));
    borders();

    loc.add(vel);
    acc.set(0,0,0);

    if(held) {
      loc.set(pmouse);
      vel.set(0,0,0);
    }
  }

  void borders() {
    float speed = vel.mag();
    if(loc.x > width-r/2 && vel.x > 0) {
      vel.x = -vel.x;
      vel.limit(speed-(speed/wallDamping));
    }
    if(loc.x < r/2 && vel.x < 0) {
      vel.x = -vel.x;
      vel.limit(speed-(speed/wallDamping));
    }
    if(loc.y < r/2 && vel.y < 0) {
      vel.y = -vel.y;
      vel.limit(speed-(speed/wallDamping));
    }
    if(loc.y > height-r/2 && vel.y > 0) {
      vel.y = -vel.y;
      vel.limit(speed-(speed/wallDamping));
    }
  }

  void display() {
    pushMatrix();
    translate(loc.x,loc.y);
    stroke(col,90);
    strokeWeight(1.5);
    fill(col,80);
    
    ellipseMode(RADIUS);
    ellipse(0,0,conDist,conDist);
    ellipse(0,0,r,r);
    
    popMatrix();
    Object[] con = connected.toArray();
    for(int i = 0; i < con.length; i++) {
      Bubble b = (Bubble) con[i];
      stroke(0);
      line(loc.x,loc.y,b.loc.x,b.loc.y);
    }
  }

  String toString() {
    return("Bubble: "+loc.x+","+loc.y+":"+r+","+maxConnects);
  }

  public void mouseDragTo(float x, float y) {
    loc.x = x;
    loc.y = y;
  }
}

class MouseBubble extends Bubble {
  MouseBubble(float x, float y) {
    super(x,y);
  }
  void update() {
    loc.x = mouseX;
    loc.y = mouseY;
    vel.set(mouseX,mouseY,0);
    acc.set(0,0,0);
    borders();
  }
  String toString() {
    return("MouseBubble: "+loc.x+","+loc.y+":"+r+","+maxConnects);
  }
}


