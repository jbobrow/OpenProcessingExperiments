
Worm[] worms;
int numWorms = 100;
PVector pulse;
boolean pulsed;

void setup() {
  size(640,360);
  smooth();
  noStroke();
  colorMode(HSB,255);
  worms = new Worm[numWorms];
  for (int i=0; i<numWorms; i++) {
    worms[i] = new Worm(random(50,430),random(50,750),random(0,2*PI)); 
  }
  pulsed = false;
}

void draw() {
    fill (20, 40);
    noStroke ();
    rect (0, 0, width, height);
  //background(0);
  for (int i=0; i<numWorms; i++) {
    fill(map(noise(0.01*worms[i].loc.x,0.01*worms[i].loc.y),0,1,0,255),255,255);
    ellipse(worms[i].loc.x,worms[i].loc.y,3,3);
    if (pulsed) {
      worms[i].move(pulse);
    }
    else 
      worms[i].move();
  }
  pulsed = false;
}

void mousePressed() {
  pulse = new PVector(mouseX, mouseY);
  pulsed = true; 
}

class Worm {
  PVector dir;
  PVector loc;
  float angle;
  float speed=4;
  float agility = 0.2;
 
  public Worm(float x, float y, float angle) {
    this.angle = angle;
    loc = new PVector(x,y);
    dir = new PVector(cos(angle),sin(angle));
    dir.normalize();
    dir.mult(speed);
  } 

  void move() {
    angle += random(-agility,agility);
    updateDir();
  }
  void updateDir() {
    dir = new PVector(cos(angle),sin(angle));
    dir.normalize();
    dir.mult(speed);
    if (loc.x+dir.x<0 || loc.x+dir.x>width) { 
      angle = PI-angle;
      //move();
    }
    else if (loc.y+dir.y<0 || loc.y+dir.y>height) { 
      angle = 2*PI-angle;
      //move();
    }
    else 
      loc.add(dir);  
  }
 void move(PVector pulse) {
    if (PVector.dist(pulse,loc)<100) {
      PVector d = new PVector(loc.x,loc.y);
      d.sub(pulse);
      angle = atan(d.y/d.x);
      //angle = PVector.angleBetween(d,new PVector(1,0));
      //println(angle);
    }
   updateDir();    
 } 
}


