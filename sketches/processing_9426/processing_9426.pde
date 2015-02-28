
class Osc {
  private float origTheta;
  private float theta;
  private float thetaStep;
  private float radius;
  
  Osc(float theta, float thetaStep, float radius) {
    this.origTheta = theta;
    this.theta = theta;
    this.thetaStep = thetaStep;
    this.radius = radius;
  }
  Osc() {
    this(0, 0.1, 1);
  }
  
  float next() {
    theta += thetaStep;
    return cos(theta);
  }
  
  void reset() {
    theta = origTheta;
  }
}

