
int numParticles = 500;
GenParticle[] s = new GenParticle[numParticles];

PImage hall;


void setup() {
  size(500, 500);
  hall = loadImage("darkhallway.jpg");
  noStroke();
  smooth();
  for (int i = 0; i < s.length; i++) {
    float velX = random(-1, 2);
    float velY = -i;
     s[i] = new GenParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
}}

void draw() {
  background(hall);
  fill(255,230,40);
  
  for (int i = 0; i < s.length; i+=2) {
    s[i].update();
    s[i].regenerate();
    s[i].display();
  }
}


class Particle {
  float x, y; 
  float vx, vy; 
  float radius; 
  float gravity = 0.7;

  Particle(float xpos, float ypos, float velx, float vely, float r) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    radius = r;
  }



 void update() {
    vy = vy + gravity;
    y += vy;
    x += vx;
    if (x > width*.67 + radius) {
     vy = vy + gravity;
    y += vy;
    x -= vx;
    }
  }
  
  
   void display() {
    ellipse(x,y/3 , radius/2, radius/2);
  }
}


//---------



class GenParticle extends Particle {
  float originX, originY;

  GenParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r);
    originX = ox;
    originY = oy;
  }

  void regenerate() {
    
    if ((x > width + radius) || (x < -radius) ||
        (y > height*3 + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(0, 3);
      vy = random(2.0, 6.0);
    }
    
    }
  }


