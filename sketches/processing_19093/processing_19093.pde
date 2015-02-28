
int NUM_OF_AGENTS = 1080;
int HORIZON = 20;
Agent[] agents = new Agent[NUM_OF_AGENTS];
 
 
void setup() {
  size(900, 700, P2D);
   
  noStroke();
  ellipseMode(CENTER);
  for(int i = 0; i < NUM_OF_AGENTS; i++) {
    agents[i] = new Agent();
  }
}
 
void draw() {
  background(#000000);
  float sumR = 0.0;
  float sumG = 0.0;
  float sumB = 0.0;
  float sumA = 0.0;
   
  int numNeighbors = 1;
   
  for(int i = 0; i < NUM_OF_AGENTS; i++) {
    color cs = agents[i].getColor();
    sumR = red(cs)+0.0;
    sumG = green(cs)+0.0;
    sumB = blue(cs)+0.0;
    sumA = alpha(cs)+0.0;
    
    numNeighbors = 1;
    for(int j = 0; j < NUM_OF_AGENTS; j++) {
      if(j != i) {
        boolean b = agents[i].attractionLaw(agents[j]);
        if (b == true) {
          color c = agents[j].getColor();
          sumR += red(c);
          sumG += green(c);
          sumB += blue(c);
          sumA += alpha(c);
          
          numNeighbors += 1;
        }
      }
    }
    if(numNeighbors > 1) {
      agents[i].colorConvergenceLaw(color(round(sumR/numNeighbors), round(sumG/numNeighbors), round(sumB/numNeighbors), round(sumA/numNeighbors)));
      agents[i].updateColor();
    }
    // border collision avoiding
    if(agents[i].position.x < 0.0) {
      agents[i].speed.x += 5;
    }
    else if(agents[i].position.x > width) {
      agents[i].speed.x -= 5;
    }
    if(agents[i].position.y < 0.0) {
      agents[i].speed.y += 5;
    }
    else if(agents[i].position.y > height) {
      agents[i].speed.y -= 5;
    }
     
    
    // end border collision avoiding
    // drag force
    agents[i].speed.x -= agents[i].speed.x*0.23;
    agents[i].speed.y -= agents[i].speed.y*0.23;
    
    // end drag force
    agents[i].updatePosition();
    fill(agents[i].getColor());
    ellipse(agents[i].position.x, agents[i].position.y, 13, 13);
  }
}
 
void mouseClicked() {
  for(int i = 0; i < NUM_OF_AGENTS; i++) {
    agents[i].c = color(floor(random(255)), floor(random(255)), floor(random(255)), floor(random(255)));
  }
}
 
class Agent {
  public color c;
  protected color nextC;
  public Vector position;
  public Vector speed;
   
   
  Agent() {
    this.position = new Vector(random(width), random(height));
    this.speed = new Vector(random(-10, 10), random(-10, 10));
    this.c = color(floor(random(255)), floor(random(255)), floor(random(255)), floor(random(255)));
  }
   
  float colorDistance(color c2) {
    float distR = red(this.c) - red(c2);
    float distG = green(this.c) - green(c2);
    float distB = blue(this.c) - blue(c2);
    float distA = alpha(this.c) - alpha(c2);
    
     
    return(sqrt(pow(distR, 2) + pow(distG, 2) + pow(distB, 2) + pow(distA, 2)));
  }
   
  boolean attractionLaw(Agent other) {
    float COEFF = 0.12;
    float d = dist(this.position.x, this.position.y, other.position.x, other.position.y);
    if(d > HORIZON) {
      // return false if other is over the horizon
      return false;
    }
     
    float f = (10 - 0.1*colorDistance(other.c))*COEFF;
    if(f < (-10.0)*COEFF) {
      f = (-10.0)*COEFF;
    }
    if(colorDistance(other.c) < 12) {
      f = (-5.0)*COEFF;
    }
     
    // collision avoiding
    if(d < 14) {
      f -= (100/(d+1)-(100/21))*COEFF;
    }
    Vector attractionForce = new Vector(f*((other.position.x-this.position.x)/d), f*((other.position.y-this.position.y)/d));
    this.speed.x += attractionForce.x;
    this.speed.y += attractionForce.y;
     
     
    if(d < 8) {
      return true;
    }
    return false;
  }
   
  void colorConvergenceLaw(color averageColor) {
    float COEFF = 0.05;
    float distR = red(averageColor) - red(this.c);
    float distG = green(averageColor) - green(this.c);
    float distB = blue(averageColor) - blue(this.c);
    float distA = alpha(averageColor) - alpha(this.c);
     
    int r = round(red(this.c) + COEFF*distR);
    int g = round(green(this.c) + COEFF*distG);
    int b = round(blue(this.c) + COEFF*distB);
    int a = round(alpha(this.c) + COEFF*distA);
    
    this.nextC = color(r, g, b, a);
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
}
 
class Vector {
  public float x;
  public float y;
   
   
  Vector(float x, float y) {
    this.x = x;
    this.y = y;
  }
}
