
int count = 400;
Swimmer [] swmr;

void setup() {
  size(800,600);
  noStroke();
  smooth();
  colorMode(HSB, 100,100,100);
  background(0);
  swmr = new Swimmer[count];
  for (int i=0; i<count; i++) swmr[i] = new Swimmer();
}

void draw() {
  fill(10,0,0,75);
  rect(0,0,width,height);
  for (int i=0; i<count; i++) swmr[i].check();
}

class Swimmer {
  color c;
  float age;
  PVector loc, vel;
  boolean bDead;
  
  Swimmer () {
    birth();
    age = random(7);
    if (age > 5) c = color(0,0,0,0);
  }
  
  void birth() {
    age = 0;
    c = color(random(100), random(50)+50, random(70)+30);
    loc = new PVector(int(random(width)), int(random(height)));
    vel = new PVector(0, 0);
    bDead = false;
  }
  
  void check() {
    //draw swimmer
    fill(c);
    ellipse(loc.x, loc.y, age, age);
    
    //move swimmer
    if (bDead) {
      PVector d = new PVector(loc.x+random(-1,1), height-1);
      PVector t = PVector.sub(d, loc);
      t.normalize();
      t.mult(.01*age);
      vel.add(t);
      vel.mult(.98);
      c = color(hue(c), saturation(c)*.97, brightness(c)*.99);
    } 
    else {
      float mr = age*0.22;
      PVector mv = new PVector(random(-mr, mr), random(-mr, mr));
      vel.add(mv);
      vel.limit(age);
      if (mousePressed) {
        PVector m = new PVector(mouseX, mouseY);
        if (mouseButton == RIGHT) 
          mv = PVector.sub(loc, m);
        else 
          mv = PVector.sub(m, loc);
        mv.normalize();
        mv.mult(.1);
        vel.add(mv);
        vel.limit(age);
      }
    }
    loc.add(vel);
    
    //boundry checking
    if (loc.x >= width) { loc.x = width-2; vel.x *= -.5; }
    if (loc.x < 0) { loc.x = 1; vel.x *= -.5; }
    if (loc.y >= height) { loc.y = height-2; vel.y *= -.5; }
    if (loc.y < 0) { loc.y = 1; vel.y *= -.5;}
    
    //age swimmer
    age+=random(.01);
    if (age>5) bDead = true;
    if (age > 7) birth();
  }
}

