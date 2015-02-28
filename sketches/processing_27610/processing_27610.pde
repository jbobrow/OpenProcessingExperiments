

//PARTICLE
class Particle {
  float x = width;
  float y = height;
  float xv = -3.2+random(6); //b4= balls go left/right... after how hard left/right
  float yv = -random(8); // end numbers make it more explody 
  float maxYV = 20;
  float gravity = 0.3; // how strong is the gravity?
  float friction = 1; //how does the air slow them down?
  float radius = random(15,35);
  color Pcolor = color(0,0,0);
 
  /*color R = color(255, 0, random(0,255));
  color Y = color(255, random(115,250), 0);
  color G = color(0,255, random(0,140));
  color B = color(0, random(0,255), 255);*/
 
  Particle(float xp,float yp, color tempColor){
    x = xp;
    y = yp;
    Pcolor = tempColor;
  }
 
  Particle(float xp,float yp,float xvel,float yvel) {
    xv = xvel;
    yv = yvel;
  }
 
  void run() {
    update();
    render();
  }
 
  void update() {          // keeps balls in their circle
    if(x <= radius) {
      xv = abs(xv);
    }
    else if(x >= width - radius) {    // keeps boundaries
      xv = -abs(xv);
    }
 
    if(y + radius >= height) {       // makes the bounce up
      yv = -abs(yv);
      if(y + radius - height >= 0.15) {
        y = height - radius;
        if(yv > -0.1) {
          xv *= 0.96;
        }
      }
    }
 
    if((yv < maxYV)) { // makes the balls move
      yv += gravity;
    }
    yv *= friction;
    y += yv;
 
    x += xv;
  }
 
  void render() {
    fill(Pcolor);
    ellipse(x,y,radius,radius);
  }
}

// PARTICLE SYSTEM
class ParticleSystem {
  ArrayList particles = new ArrayList();
   
   void add(Particle p) {
    particles.add(p);
  }
   
  void removeAll() {
    particles.clear();
  }
   
  void run() {
    for(int i = 0; i < particles.size(); i++) {
      Particle p = (Particle)particles.get(i);
      p.run();
    }
  }
}


int oneX = 300;
int oneY = 300;

int changeX = 10;
int changeY = 7;
int ChangeX = 10;
int ChangeY = 7;

ParticleSystem ps;
color ballcolor = color(0,0,0);

void setup() {
  size(700, 700);
  ps = new ParticleSystem();
  smooth();
  frameRate(30);
}

void draw() {
  background(255);
  ellipseMode(CORNER);
  noStroke();
  ellipse(oneX, oneY, 100, 100);
  oneX += changeX;
  oneY += changeY;
  if(oneX >= 600 || oneX <= 0) {
    changeX *= -1;
  }
  if(oneY >= 600 || oneY <= 0) {
    changeY *= -1;
  }
  if(oneX >= 600) {
    for(int i = 0; i < random(1,5); i++) {
      color newColor = color(255, 0, random(0,255));
      ps.add(new Particle(mouseX, mouseY, newColor));
    }
  }
  if(oneX <= 0) {
    for(int i = 0; i < random(1,5); i++) {
      color newColor = color(0,random(95,255),0);
      ps.add(new Particle(mouseX, mouseY, newColor));
    }
  }
  if(oneY >= 600) {
    for(int i = 0; i < random(1,5); i++) {
      color newColor = color(255, random(115,250), 0);
      ps.add(new Particle(mouseX, mouseY, newColor));
    }
  }
  if(oneY <= 0) {
    for(int i = 0; i < random(1,5); i++) {
      color newColor = color(0, random(0,255), 255);
      ps.add(new Particle(mouseX, mouseY, newColor));
    }
  }
      ps.run();
}

void keyPressed() {
  if(key != CODED) {
    switch(key) {
      case 'x' : ps.removeAll(); break;
    }
  }
}
      
                
