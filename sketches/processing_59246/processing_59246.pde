
class Agent {
  public color c;
  protected color nextC;
  public Vector position;
  public Vector speed;
  public Vector distanceToPoint;
  int gLocX = 0;
  int gLocY = 0;
  String tag = "A";
  Vector vel = new Vector(random(-1, 1), random(-1, 1));
  //Vector sum = new Vector(random(0, 10000), random(0, 10000));

  Agent() {
    this.position = new Vector(random(width), random(height));
    this.speed = new Vector(random(-10, 10), random(-10, 10));
    this.c = color(floor(random(255)), floor(random(255)), floor(random(255)));
    //this.sum = new Vector(random(0, 10000), random(0, 10000));
  }

  float colorDistance(color c2) {
    float distR = red(this.c) - red(c2);
    float distG = green(this.c) - green(c2);
    float distB = blue(this.c) - blue(c2);
    return(sqrt(pow(distR, 2) + pow(distG, 2) + pow(distB, 2)));
  }



  boolean attractionLaw(Agent other) {
    float COEFF = 0.09;
    float d = dist(this.position.x, this.position.y, other.position.x, other.position.y);
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
    Vector attractionForce = new Vector(f*((other.position.x-this.position.x)/d), f*((other.position.y-this.position.y)/d));
    this.speed.x += attractionForce.x;
    this.speed.y += attractionForce.y;
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
  }

  void changeColor() {
    this.c = color(floor(random(255)), floor(random(255)), floor(random(255)));
  }

  void run() {
    pointBelow(position, 2);
    addPheToPoint();
    //evalPheromone();
  }

  void pointBelow(Vector position, int t) {
    gLocX = int(position.x/gridSize);
    gLocY = int(position.y/gridSize);
    if (gLocX < 0 ) gLocX = 0;
    if (gLocY < 0 ) gLocY = 0;
    if (gLocX > resX-1 ) gLocX = resX-1;
    if (gLocY > resY-1 ) gLocY = resY-1;
    terrain [gLocX][gLocY].type = t;
  }

  void addPheToPoint() {
    if (tag == "A") {
      if (terrain [gLocX][gLocY].type == 2) {
        terrain [gLocX][gLocY].phe += 50;
      }
    }
    if (tag == "B") {
      if (terrain [gLocX][gLocY].type == 2) {
        terrain [gLocX][gLocY].phe += 100;
      }
    }
  }

  void curiosityLaw() {
    PVector distanceToPoint= new PVector ( (gLocX - this.position.x), (gLocY - this.position.y));
    float COEFF = 50;
    float maxRange = 1000;
    float d = distanceToPoint.mag();
    for (int i = 0; i < resX; i++) {
      for (int j = 0; j < resY; j++) {
        float pheAmount = map(terrain[i][j].phe, 0, 1000, 0, 1);
        if (d > maxRange) {
          //return false;
        }
        if (pheAmount >200) {
          float f = (10 - 0.1*d)*COEFF;
          if (f < (-10.0)*COEFF) {
            f = (-10.0)*COEFF;
          }
          if (d < 20) {
            f = (-5.0)*COEFF;
          }
          Vector curiosityForce = new Vector(f*((position.x-this.position.x)/d), f*((position.y-this.position.y)/d));
          this.speed.x += curiosityForce.x;
          this.speed.y += curiosityForce.y;
          if (d < 40) {
            //return true;
          }
          //return false;
        }
      }
      }
    }
  }


