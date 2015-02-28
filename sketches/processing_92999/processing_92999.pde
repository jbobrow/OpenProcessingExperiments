
class Force {
  PVector pos;
  float mass, multiplier;
  boolean forceOn;
  
  Force(PVector p, float ms, boolean attract, boolean on){
    pos = p;
    mass = ms;
    if(attract){
      multiplier = 1.0;
    } else {
      multiplier = -1.0;
    }
    forceOn = on;
  }
  
  PVector calculateForce(PVector pPos, float pMass){
    PVector f = PVector.sub(pos, pPos);
    float d = f.mag();
    d = constrain(d, 20.0, 50000.0);
    f.normalize();
    float force = (G * mass * pMass) / (d * d);
    f.mult(force * multiplier);
    return f;
  }

  void setAttract(boolean attract){
    if(attract){
      multiplier = 1.0;
    } else {
      multiplier = -1.0;
    }
  }
  
  void render(){
    if(forceOn){
      stroke(255);      
      noFill();
      ellipse(pos.x, pos.y, mass/2, mass/2);
    }

    if(forceOn){    
      stroke(255);
      fill(200);
    } else {
      stroke(200);
      fill(255, 0, 0);
    }
    ellipse(pos.x, pos.y, 10, 10);
  }
    
}

