
class Agent {
  public color c;
  protected color nextC;
  public Vector position;
  public Vector speed;

  Agent() {
    this.position = new Vector(random(-200, 200), random(-200, 200), random (-200, 200) );
    this.speed = new Vector(random(-5, 5), random(-5, 5), random (-5, 5));
    this.c = color(floor(random(255)), floor(random(255)), floor(random(255)));
  }

  float colorDistance(color c2) {
    float distR = red(this.c) - red(c2);
    float distG = green(this.c) - green(c2);
    float distB = blue(this.c) - blue(c2);
    return(sqrt(pow(distR, 2) + pow(distG, 2) + pow(distB, 2)));
  }

  boolean attractionLaw(Agent other) {
    float COEFF = 0.4;
    float d = dist(this.position.x, this.position.y, this.position.z, other.position.x, other.position.y, other.position.z);
    if (d > HORIZON) {
      // return false if other is over the horizon
      return false;
    }

    float f = (10 - 0.1*colorDistance(other.c))*COEFF;
    if (f < (-10.0)*COEFF) {
      f = (-10.0)*COEFF;
    }
    if (colorDistance(other.c) < 20) {
      f = (-5.0)*COEFF;
    }

    // collision avoiding
    if (d < 20) {
      f -= (100/(d+1)-(100/21))*COEFF;
    }
    Vector attractionForce = new Vector(f*((other.position.x-this.position.x)/d), f*((other.position.y-this.position.y)/d), f*((other.position.z-this.position.z)/d));
    this.speed.x += attractionForce.x;
    this.speed.y += attractionForce.y;
    this.speed.z += attractionForce.z;

    if (d < 40) {
      return true;
    }
    return false;
  }

  void colorConvergenceLaw(color averageColor) {
    float COEFF = 0.05;
    float distR = red(averageColor) - red(this.c);
    float distG = green(averageColor) - green(this.c);
    float distB = blue(averageColor) - blue(this.c);
    int r = round(red(this.c) + COEFF*distR);
    int g = round(green(this.c) + COEFF*distG);
    int b = round(blue(this.c) + COEFF*distB);
    this.nextC = color(r, g, b);
  }

  color getColor() {
    return this.c;
  }

  void updateColor() {
    this.c = this.nextC;
  }

  void updatePosition() {
    this.position.x += this.speed.x;
    this.position.y += this.speed.y;
    this.position.z += this.speed.z;
  }
}


