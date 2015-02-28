
//initialize pos and vel arrays
int numBalls = 300;
float maxSpeed = 1.0;
int iter = 3;
PVector[] pos = new PVector[numBalls];
PVector[] vel = new PVector[numBalls];
float[] mass = new float[numBalls];
float ballSize = 12.0;
void setup() {
  //  standard setup
  size(500, 500);
  stroke(0);
  colorMode(HSB, 255, 255, 255, 255);
//  background(255, 255, 255, 255);
  noFill();

  //  initialize pos and vel PVectors

  //  draw circles
  for (int i=0; i<pos.length; i++) {
    pos[i] = new PVector(500*random(1.0), 500*random(1.0));
    vel[i] = new PVector(maxSpeed/iter*(1.0-random(2.0)), maxSpeed/iter*(1.0-random(2.0)));
    mass[i] = random(1.0);
    ellipse(pos[i].x, pos[i].y, ballSize, ballSize);
  }
}

int col = 0;

void draw() {
  //  wipe the slate
  for (int k=0; k<iter; k++) {
    background(255, 0, 255);
//    noFill();
    //  update position
    for (int i=0; i<vel.length; i++) {
      pos[i].add(vel[i]);
    }

    //  check collision
    for (int i=0; i<pos.length; i++) {
      for (int j=0; j<pos.length; j++) {
        if (j != i) {

          if (dist(pos[i].x, pos[i].y, pos[j].x, pos[j].y) <= ballSize) {
            PVector temp1 = pos[i];
            PVector temp2 = pos[j];
            //  find where they actually collided
            PVector theTan = new PVector(temp1.y-temp2.y, temp2.x-temp1.x);
            PVector theNorm = PVector.sub(temp1, temp2);
            float oneDVel1 = proj(vel[i], theNorm).mag();
            float oneDVel2 = proj(vel[j], theNorm).mag();
            float newOneDVel1 = (oneDVel1*(mass[0]-mass[1])+2*mass[1]*oneDVel2)/(mass[0]+mass[1]);
            float newOneDVel2 = (oneDVel2*(mass[1]-mass[0])+2*mass[0]*oneDVel1)/(mass[1]+mass[0]);
            theNorm.normalize();
            PVector newVel1 = PVector.add(proj(vel[i], theTan), PVector.mult(theNorm, newOneDVel1));
            PVector newVel2 = PVector.add(proj(vel[j], theTan), PVector.mult(theNorm, -1*newOneDVel2));
            //  find at what time they collided
            float time = (temp1.x-pos[i].x)/vel[i].x;
            pos[i] = PVector.add(temp1, PVector.mult(newVel1, 1.0-time));
            pos[j] = PVector.add(temp2, PVector.mult(newVel2, 1.0-time));
            vel[i] = newVel1;
            vel[j] = newVel2;
          }
        }
      }
      if (pos[i].x >= 500-ballSize/2.0 || pos[i].x <= ballSize/2.0) {
        vel[i].x *= -1;
        if (pos[i].x+vel[i].x >= 500-ballSize/2.0) {
          pos[i].add(PVector.mult(vel[i], ((pos[i].x+vel[i].x)-(500-ballSize/2.0))/vel[i].x));
        }
        if (pos[i].x+vel[i].x <= ballSize/2.0) {
          pos[i].add(PVector.mult(vel[i], (ballSize/2.0-(pos[i].x+vel[i].x))/vel[i].x));
        }
      }
      if (pos[i].y >= 500-ballSize/2.0 || pos[i].y <= ballSize/2.0) {
        vel[i].y *= -1;
        if (pos[i].y+vel[i].y >= 500-ballSize/2.0) {
          pos[i].add(PVector.mult(vel[i], ((pos[i].y+vel[i].y)-(500-ballSize/2.0))/vel[i].y));
        }
        if (pos[i].y+vel[i].y <= ballSize/2.0) {
          pos[i].add(PVector.mult(vel[i], (ballSize/2.0-(pos[i].y+vel[i].y))/vel[i].y));
        }
      }
    }
    //  draw the circles
    int tempCol = col;
    for (int i=0; i<pos.length; i++) {
      tempCol = (tempCol + 1)%255;
      ellipse(pos[i].x, pos[i].y, ballSize, ballSize);
    }
  }
  col++;
}


PVector proj(PVector theVec, PVector onto) {
  return PVector.mult(onto, theVec.dot(onto)/sq(onto.mag()));
}               
