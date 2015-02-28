
final static float PACMAN_SIZE = 5.5;
final static float FOOD_SIZE = 1.5;
final static int BITE_SPEED = 15;
final static float PACMAN_SPEED = .20;
final static float EPSILON = .1;
boolean moving, paused;
boolean autorun = false;
boolean alwaysShowGrid = true;
int round;
Coordinate[] dots, covers;
Pacman p;

void setup() {
  size(800, 600);
  background(0);
  p = new Pacman(0, 0);
  moving = true;
  paused = true;
  dots = new Coordinate[16];
  covers = new Coordinate[16];
  for (int n=0; n<covers.length; n++) {
    covers[n] = new Coordinate(0, 0);
  }
  dots[0] = new Coordinate(-10, -18);
  dots[1] = new Coordinate(32, -22);
  dots[2] = new Coordinate(-15, 21);
  dots[3] = new Coordinate(32, 23);
  dots[4] = new Coordinate(-4, 18);
  dots[5] = new Coordinate(27, -3);
  dots[6] = new Coordinate(4, -20);
  dots[7] = new Coordinate(-31, 5);
  dots[8] = new Coordinate(-5, 5);
  dots[9] = new Coordinate(-22, -21);
  dots[10] = new Coordinate(15, -22);
  dots[11] = new Coordinate(-17, -6);
  dots[12] = new Coordinate(19, -24);
  dots[13] = new Coordinate(18, 17);
  dots[14] = new Coordinate(-21, 23);
  dots[15] = new Coordinate(16, -10);
  round = 0;
  p.setDestination(applyMovementRule(round, p.center));
}

int time = BITE_SPEED;
void draw() {
  translate(width/2+1, height/2);
  scale(11);
  scale(1, -1);
  background(0);
  for (int n=0; n<dots.length; n++)
  {
    fill(255);
    noStroke();
    ellipse(dots[n].x, dots[n].y, FOOD_SIZE, FOOD_SIZE);
    fill(0);
    ellipse(covers[n].x, covers[n].y, FOOD_SIZE, FOOD_SIZE);
  }
  if (autorun) {
    if (random(1)<0.01)
      p.setDestination(new Coordinate(random(-width/20, width/20), random(-height/20, height/20)));
  }
  if (alwaysShowGrid) {
    stroke(255);
    strokeWeight(.3);
    line(0, height/2, 0, -height/2);
    line(-width/2, 0, width/2, 0);
    rectMode(CENTER);
    fill(255);
    for (int j=-height/2; j<height/2; j += 5)
      rect(0, j, FOOD_SIZE, .2);
    for (int i=-width/2; i<width/2; i += 5)
      rect(i, 0, .2, FOOD_SIZE);
  }
  if (!paused)
    p.takeStep();

  p.display(time);
  time = (time + 1)%BITE_SPEED;

  if (p.atDestination()) {
    covers[round] = new Coordinate(p.center.x, p.center.y);
    round++;
    Coordinate dest = applyMovementRule(round, p.center);
    if (!autorun)
      p.setDestination(dest);
    else
      p.setDestination(new Coordinate(random(-width/20, width/20), random(-height/20, height/20)));
  }
  if (round >= dots.length) {
    autorun = true;
    round = 0;
  }
}



Coordinate applyMovementRule(int moveNumber, Coordinate old_A) {
  Coordinate new_A = new Coordinate(0, 0);

  switch(moveNumber) {
  case 0: //From (0,0) to (-10, -18)
    new_A.x = old_A.x;
    new_A.y = old_A.y;
    break;           

  case 1: //From (-10, -18) to (32, -22)
    new_A.x = old_A.x;
    new_A.y = old_A.y;
    break;           

  case 2: //From (32, -22) to (-15, 21)       
    new_A.x = old_A.x;
    new_A.y = old_A.y;
    break;           

  case 3://From (-15, 21) to (32, 23)
    new_A.x = old_A.x;
    new_A.y = old_A.y;
    break;           
  case 4://From (32, 23) to (-4, 18)
    new_A.x = old_A.x;
    new_A.y = old_A.y;
    break;            
  case 5://From (-4, 18) to (27, -3)
    new_A.x = old_A.x;
    new_A.y = old_A.y;
    break;            
  case 6://From (27, -3) to (4, -20)
    new_A.x = old_A.x;
    new_A.y = old_A.y;
    break;             

  case 7://From (4, -20) to (-31, 5)
    new_A.x = old_A.x;
    new_A.y = old_A.y;
    break;             

  case 8://From (-31, 5) to (-5, 5)
    new_A.x = old_A.x;
    new_A.y = old_A.y;
    break;             

  case 9://From (-5, 5) to (-22, -21)
    new_A.x = old_A.x;
    new_A.y = old_A.y;
    break;             

  case 10://From (-22, -21) to (15, -22)
    new_A.x = old_A.x;
    new_A.y = old_A.y;
    break;             

  case 11://From (15, -22) to (-17, -6)
    new_A.x = old_A.x;
    new_A.y = old_A.y;
    break;             

  case 12://From (-17, -6) to (19, -24)
    new_A.x = old_A.x;
    new_A.y = old_A.y;
    break;             

  case 13://From (19, -24) to (18, 17)
    new_A.x = old_A.x;
    new_A.y = old_A.y;
    break;             

  case 14://From (18, 17) to (-21, 23)
    new_A.x = old_A.x;
    new_A.y = old_A.y;
    break;             

  case 15://From (-21, 23) to (16, -10)
    new_A.x = old_A.x;
    new_A.y = old_A.y;
    break;
  }
  return new_A;
}

void keyPressed() {
  if (key == ' ') {
    paused = !paused;
  }
  else if (key == 'c') 
    println(p.center);
  else if (key =='p')
    println(dots);
  else if (key == 'a')
    autorun = !autorun;
  else if (key == 'g')
    alwaysShowGrid = !alwaysShowGrid;
}

class Coordinate { //essentially just PVector...
  float x, y;
  Coordinate(float _x, float _y) {
    x = _x; 
    y = _y;
  }
  boolean equals(Coordinate other) {
    return (this.x == other.x && this.y == other.y);
  }

  String toString() {
    return "("+x+", "+y+")";
  }

  float angleTo(Coordinate other) {
    float dy = (other.y - this.y);
    float dx = other.x - this.x;
    if (dx == 0)
      return (dy == 0)? 0: -PI/2;
    if (dx == abs(dx))
      return atan(dy/dx);
    else
      return atan(dy/dx) + PI;
  }
  float distanceTo(Coordinate other) {
    return sqrt((other.x-this.x)*(other.x-this.x) + (other.y-this.y)*(other.y-this.y));
  }
}

class Pacman {
  Coordinate center;
  Coordinate destination;
  int health;
  float angleToDestination;

  Pacman(float _x, float _y) {
    center = new Coordinate(_x, _y);
    destination = center;
    health = 0;
    angleToDestination = 0;
  }

  void takeStep() {

    float ang = center.angleTo(destination);

    center.x += PACMAN_SPEED*cos(ang);
    center.y += PACMAN_SPEED*sin(ang);
  }
  void display(float t) {
    fill(255, 255, 0);
    noStroke();
    float ang = center.angleTo(destination);
    arc(center.x, center.y, PACMAN_SIZE, PACMAN_SIZE, ang+t*PI/(6*BITE_SPEED), 2*PI+(ang-t*PI/(6*BITE_SPEED)));
    //Eye:
    stroke(255);fill(0);strokeWeight(.1);
    ellipse(center.x+PACMAN_SIZE*cos(ang+PI/2)/2.5, center.y+PACMAN_SIZE*sin(ang+PI/2)/3, .6*FOOD_SIZE, .6*FOOD_SIZE);
  }
  void setDestination(Coordinate A) {
    destination = A;
  }
  boolean atDestination() {
    return center.distanceTo(destination)<EPSILON;
  }
}



