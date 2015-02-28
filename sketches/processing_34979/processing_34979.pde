
//Class objectAttractor 'A'

class objectA {

  PVector objectALocation;
  PVector objectAVelocity;
  PVector locAgent, velAgent, turn, dir, mouseLoc;
  float distAgent, sensitivity, attraction, pastDist;
  float objectASize;
  int objectAColour;

  objectA (PVector OBJECTALOCATION, PVector OBJECTAVELOCITY, float OBJECTASIZE, int OBJECTACOLOUR) {
    objectALocation = OBJECTALOCATION;
    objectAVelocity =  OBJECTAVELOCITY;
    objectASize = OBJECTASIZE;
    objectAColour =   OBJECTACOLOUR;
  }


  void run () {
    render();
    updatePos();
    calculate();
  }

  void render () {
    noStroke ();
    fill (255, 50);
    ellipse (objectALocation.x, objectALocation.y, 15, 15);
  }

  void updatePos () {
    objectALocation.add(objectAVelocity); 
    if (objectALocation.x <0) {
      objectALocation.x= width;
    }
    if (objectALocation.x >width) {
      objectALocation.x = 0;
    }
    if (objectALocation.y <0) {
      objectALocation.y = height;
    }
    if (objectALocation.y >height) {
      objectALocation.y = 0;
    }
  }

  void calculate() {

    if (distAgent < align) {
      if (distAgent < avoidance) { 
        objectAVelocity.set(random(1.0), random(1.0), 0);
      } 
      else { 
        turn = PVector.mult(dir, sensitivity*distAgent);
        objectAVelocity.add(turn);
      }
    } 
    else if (distAgent > pastDist) { 
      turn = PVector.mult(dir, sensitivity*distAgent);
      turn.add(random(0, 0.5), random(0, 0.5), 0);
      objectAVelocity.sub(turn);
    }

    objectAVelocity.normalize();
  }
}


