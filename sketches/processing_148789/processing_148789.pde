
Pendulum[] p;
float time = 0.0;

// How many pendulums do you want?
int pendulumCount = 30;

// The time it takes for everything to be lined up again
// depends on the sync factor.  
// Setting this value higher will make it take longer
float syncFactor = 60;

void setup() {
  size(600, 600);
  stroke(255);
  strokeWeight(1);
  p = new Pendulum[pendulumCount];
  float lengthInit = 450; // The length of the longest string

  for (int i = 0; i < p.length; i++) {
    float ratio =  syncFactor / (syncFactor + i);
    p[i] = new Pendulum(300, 0, ratio * ratio * lengthInit, .15*PI);
  }
}

void draw() {
  background(0);

  for (Pendulum pend : p)
    pend.drawIt(time);
  time += 1;
}

public class Pendulum {
  float gravity = 100;
  float stringLength;
  float thetaInit;
  float x;
  float y;

  public Pendulum(float x, float y, float stringLength, float thetaInit) {
    this.x = x;
    this.y = y;
    this.stringLength = stringLength;
    this.thetaInit = thetaInit;
  }

  public void drawIt(float time) {
    float theta = thetaInit*cos(sqrt(gravity/stringLength)*time);
    float bottomX = x + stringLength * sin(theta);
    float bottomY = y + stringLength * cos(theta);
    
    line(x, y, bottomX, bottomY);
    fill(255, 255, 0);
    stroke(0);
    ellipse(bottomX, bottomY, 40, 40);
    stroke(255);
  }
}


