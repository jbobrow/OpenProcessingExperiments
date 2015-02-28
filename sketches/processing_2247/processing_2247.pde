
class Ball {
  int camp = 0;
  int state = 0;
  boolean dead = false;
  boolean colliding = false;
  color c;
  float cAlpha = 20;
  float r;
  float theta = 0.00;
  PVector loc = new PVector(0, 0);
  PVector vel = new PVector(0, 0);

  Ball(float $R) {
    r = $R/2;
    loc.x = random(r,width-(r));
    loc.y = random(r,height-(r));
    vel.x = 0.05*random(-5,5);
    vel.y = 0.05*random(-5,5);
  }

  Ball(float $R, int $camp) {
    r = $R/2;
    loc.x = random(r,width-(r));
    loc.y = random(r,height-(r));
    vel.x = 0.05*random(-5,5);
    vel.y = 0.05*random(-5,5);
    camp = $camp;
  }

  Ball(float $R, PVector $v, PVector $l) {
    r = $R/2;
    vel = $v.get();
    loc = $l.get();
  }

  Ball(float $R, PVector $v, PVector $l, int $camp) {
    r = $R/2;
    vel = $v.get();
    loc = $l.get();
    camp = $camp;
  }

  void go(float $i) {
    cAlpha = constrain(cAlpha, minAlpha, maxAlpha);
    removeDead();
    if (!pause) {
      move();
    }
    display(); 
  }

  void move(){
    if (dead == false) {
      border();
      loc.add(vel);
      if (gravityOn) {
        vel.add(gravity);
      }
    }
  }

  void moveTo(float $x, float $y){
    if (dead == false) {
      border();
      loc = new PVector($x, $y);
    }
  }

  private void border(){
    if (loc.y > height-r) {
      vel.y *= -bounce;
      loc.y = height-r;
    }
    else if (loc.y < r) {
      vel.y *= -bounce;
      loc.y = r;
    }
    if (loc.x > width-r) {
      vel.x *= -bounce;
      loc.x = width-r;
    }
    else if (loc.x < r) {
      vel.x *= -bounce;
      loc.x = r;
    }
  }

  void display(){
    if (dead == false) {
      noStroke();
      r = constrain(r, 0, width+height/8);
      fillAs();
      fill(c);
      ellipse(loc.x, loc.y, r*2, r*2);
    }
  }

  void fillAs() {
    switch (camp) {
    case 1:
      c = color(255, 100, 100, cAlpha);
      break;
    case 2:
      c = color(255, 240, 100, cAlpha);
      break;
    case 3:
      c = color(50, 144, 255, cAlpha);
      break;
    case 0:
      c = color(0, cAlpha);
      break;
    }
  }

  void removeDead() {
    if(r < 0.5) {
      dead = true;
      loc.x = -100;
      loc.y = -100;
    }
  }

  boolean isInRangeAndBigger(Ball $b1, Ball $b2, float range){
    if ($b1.dead == false && $b2.dead == false) {
      float distance = dist($b1.loc.x, $b1.loc.y, $b2.loc.x, $b2.loc.y);
      if (distance < $b1.r*range + $b2.r*range) {
        if($b1.r > $b2.r) {
          return true;
        }
        else return false;
      }
      else return false;
    }
    else return false;
  }

  boolean isInRange(Ball $b1, Ball $b2, float $range){
    if ($b1.dead == false && $b2.dead == false) {
      float distance = dist($b1.loc.x, $b1.loc.y, $b2.loc.x, $b2.loc.y);
      if (distance < $b1.r*$range + $b2.r*$range) {
        return true;
      }
      else return false;
    }
    else return false;
  }

  void collideEqualMass(Ball $t) {
    float d = PVector.dist(loc, $t.loc);
    float sumR = r + $t.r;
    if (!colliding && d < sumR) {
      colliding = true;
      PVector n = PVector.sub($t.loc, loc);
      n.normalize();
      PVector u = PVector.sub(vel, $t.vel);
      PVector un = componentVector(u,n);
      u.sub(un);
      vel = PVector.add(u, $t.vel);
      $t.vel = PVector.add(un, $t.vel);
    } 
    else if (d > sumR) {
      colliding = false;
    }
  }

}

PVector componentVector (PVector vector, PVector directionVector) {
  directionVector.normalize();
  directionVector.mult(vector.dot(directionVector));
  return directionVector;
}

