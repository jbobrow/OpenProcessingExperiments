
int numParticles = 200;
GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size(300, 300);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    if(random(2)< 1){
    float velX = random(-3, 3);//makes dots begin by throwing at all sides
    float velY = random(-3,3);
    p[i]=new HotParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
    }
    else{
      float velX = random(-3, 3);//makes dots begin by throwing at all sides
    float velY = random(-3,3);
    p[i]=new ColdParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
    }
  }
}

void draw() {
  fill(255, 36);//background
  rect(0, 0, width, height);//basically makes a rectangle the size of the background
  fill(255,0,0, 60);//color of the dots
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}


class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = random(0,.1);

  Particle(float xpos, float ypos, float velx, float vely, float r) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    radius = r;
  }

  void update() {//play with gravity and velocities here
    vy = vy + gravity;
    y += vy;
    x += vx;
  }

  void display() {//play with what you are displaying and its characteristics here
    ellipse(x, y, radius*2, radius*2);
  }
}


class GenParticle extends Particle {//brings in data from other fields, Particle becomes the superclass of genParticle
  float originX, originY;

  GenParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {//creating new data in this field
    super(xIn, yIn, vxIn, vyIn, r);
    originX = ox;
    originY = oy;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||//what are these lines between the statements and how do we make them?
        (y > height + radius) || (y < -radius)) {
      x = originX;//if x=originX and above originX=ox, then what does ox equal? just a variable?
      y = originY;//same question
      vx = random(-1.0, 1.0);
      vy = random(-4.0, -2.0);
    }
  }
}
class HotParticle extends GenParticle{
  HotParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    //x=random();
    //y=random();
    gravity = .1;
  }
void regenerate() {
    if ((x > width + radius) || (x < -radius) ||//what are these lines between the statements and how do we make them?
        (y > height + radius) || (y < -radius)) {
     x=random(width);
     y=height/2;
      vx = random(-1.0, 1.0);
      vy = random(0, -.2);//creates a line at mid-height and shoots them down
    }
  }
  void update() {//play with gravity and velocities here
    vy = vy + gravity;
    y += vy;
    x += vx;
  }

  void display() {//play with what you are displaying and its characteristics here
    noFill();
    stroke(255,0,0); 
    rect(x,y,random(2,50),random(2,10));
  }
}
class ColdParticle extends GenParticle {
  
  ColdParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    gravity = .1;//tries to pull them down but the velocity overpowers and pulls them back up
  }
  
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX +random(-300,300);
      y = originY + random(-100,100);
      vx = random(-3, 3.0);    // bubbles are thrown in all directions, left, right, up, down
      vy = random(-3.0, 3.0);
    }
  }
  void update() {
    vy = vy - gravity;//by subtracting gravity the coldParticles go up
    y += vy;
    x += vx;
  }
  void display() {
    noFill();
    stroke(0,0,255,60);
    ellipse(x, y, radius, radius);
  }
}




