

  Snake[] snakes;
  int p; //myers-briggs
  int i, t, u;  //these are here just so the program doesn't have to redefine them in the for loops every time
  void setup() {
    size(1200, 700);
    noStroke();
    ellipseMode(CENTER);
    initializeSnakes();
  }
  void mousePressed() {
    initializeSnakes();
  }
  void draw() {
    background(4);
    for(i = 0; i < p; i++) {
      snakes[i].update();
      for(t = 0; t < 97; t += 2) {  
        fill(snakes[i].getR(t), snakes[i].getG(t), snakes[i].getB(t));
        ellipse(snakes[i].vTrail[t].x, snakes[i].vTrail[t].y, (int)(t * .1), (int)(t * .1));
        //updates the trail here so there's not another loop
        snakes[i].vTrail[t].x = snakes[i].vTrail[t + 2].x;
        snakes[i].vTrail[t].y = snakes[i].vTrail[t + 2].y;
      }  
      if(snakes[i].changeDir && !snakes[i].isOffscreen()) {
        for(u = 0; u < p; u ++){
          if(i!=u && snakes[i].isNear(snakes[u].vMidpoint.x, snakes[u].vMidpoint.y, snakes[u].angle)) {
            snakes[i].resetVars(snakes[u].angle);  //follow other snake
            u = p;  //exit loop
          }
        }
      }
      //this happens if the snake ends its cycle and there aren't other snakes around to borrow an angle from
      if(snakes[i].changeDir)
        snakes[i].resetVars(0);  
      //uncomment these if you want to see better how it works, and/or when they follow each other
//      stroke(255);
//      line(snakes[i].vStart.x, snakes[i].vStart.y, snakes[i].getCurrentX(), snakes[i].getCurrentY());
//      stroke(100);
//      line(snakes[i].vMidpoint.x, snakes[i].vMidpoint.y, snakes[i].vTrail[98].x, snakes[i].vTrail[98].y);
//      noStroke();
    }
  }
  void initializeSnakes() {
    p = 50;  //total snakes
    int g = 5;  //groups
    //there will be g groups of (p / g) spawning
    int perGroup = (p / g);
    int groupX, groupY;
    int red, green, blue;
    snakes = new Snake[p];
    for(int d = 0; d < g; d++) {
      //initialize variables for this group
      groupX = (int) random(width);
      groupY = (int) random(height);
      red = (int) random(30, 230);
      green = (int) random(30, 230);
      blue = (int) random(30, 230);
      for(i = 0; i < perGroup; i++) {
        snakes[d * perGroup + i] = new Snake(random(TWO_PI), groupX, groupY, red + random(-25, 25), green + random(-25, 25), blue + random(-25, 25));
      }
    }
  }

//---------------------------------------------------------

public class Snake {
  SVector[] vTrail;
  SVector vStart, vMidpoint, vVelocity;
  int r, g, b, curve;
  float magnitude, shift, cycle, radius;
  float angle, a;
  boolean changeDir;
  public Snake(float ang, int fedX, int fedY, float rr, float gg, float bb) {
    r = (int) rr;
    g = (int) gg;
    b = (int) bb;
    if(random(10) < 5)  //randomize if it curves left or right first
      curve = 1;
    else
      curve = -1;
    shift = 30;
    vStart = new SVector(fedX, fedY);
    vMidpoint = new SVector(0, 0);
    vVelocity = new SVector(0, 0);
    vTrail = new SVector[100];
    for(int i = 0; i < 99; i+=2){
      vTrail[i] = new SVector(vStart.x, vStart.y);
    }
    resetVars(ang);
  }
  void resetVars(float ang){
    //restart cycle
    changeDir = false;
    vStart.x += vVelocity.x * magnitude; 
    vStart.y += vVelocity.y * magnitude;
    magnitude = random(50, 250);
    cycle = 0;
    curve *= -1;  //switch direction of curve
    //check to see if it's off screen
    if(vStart.x < 0)
      angle = 0;
    else if(vStart.y < 0)
      angle = PI + HALF_PI;
    else if(vStart.x > width)
      angle = PI;
    else if(vStart.y > height)
      angle = HALF_PI;
    else if(ang != 0)  
      angle = ang;
    angle += random(-QUARTER_PI / 2, QUARTER_PI / 2);
    //velocity, etc
    vVelocity.x = cos(angle) * .6;
    vVelocity.y = -1 * sin(angle) * .6;
    radius = sqrt(pow((vVelocity.x * magnitude), 2) + pow((vVelocity.y * magnitude), 2)) / 2;  //a^2 + b^2 = c^2 gives length, divide by 2 to get radius
    vMidpoint.x = vStart.x + (vVelocity.x * magnitude) / 2;
    vMidpoint.y = vStart.y + (vVelocity.y * magnitude) / 2;
  }
  void update() {
    if(cycle > magnitude / 2 && shift < 35)
      shift++;
    else if(shift > 15)  //won't go below
      shift--;
    cycle += shift * .1;
    if(cycle >= magnitude) {
      cycle = magnitude;
      changeDir = true;
    }
    //the variable "angle" is the angle of the line
    //whereas "a" is the angle of the half-circle from the midpoint which forms the snake
    a = (float)(angle - HALF_PI + curve * (cycle / magnitude) * PI);
    //set newest point on snake
    vTrail[98].x = (int)(vMidpoint.x + radius * sin(a));
    vTrail[98].y = (int)(vMidpoint.y + radius * cos(a));
  }
  boolean isNear(float checkX, float checkY, float checkA) {
    if(abs(vStart.x - checkX) < magnitude && abs(vStart.y - checkY) < magnitude) {  //if other snake is near
      if(abs(angle - checkA) < HALF_PI)         //if the angle is similar (I guessed the 315)
        return true;
    }
    return false;
  }
  boolean isOffscreen() {
   if(vStart.x < 0 || vStart.x > width || vStart.y < 0 || vStart.y > height)
      return true;
   return false; 
  }
  //these return the color multiplied by the percentage that is their element number
  //it works because there are 100 elements in each snake
  float getR(int t) {return (float)(r * t * .01);}
  float getG(int t) {return (float)(g * t * .01);}
  float getB(int t) {return (float)(b * t * .01);}
  //only used to display the lines in Draw() that show you what's going on
  float getCurrentX() {return vStart.x + (vVelocity.x * cycle);}
  float getCurrentY() {return vStart.y + (vVelocity.y * cycle);}
}
class SVector {
  float x, y;
  public SVector(float xx, float yy) {
    x = xx;
    y = yy; 
  } 
}


