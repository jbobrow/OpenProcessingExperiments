
//Danielle Scesney
//7.2
//?? comments sparse b/c im not 100% sure what im doing


int numParticles = 200; //number of particles.
GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size (300, 300);
  background(15);
  noStroke();
  smooth();
  for (int i=0; i< p.length; i++) {
    float velX = random(-1, 1);
    float velY = i;

    p[i] = new GenParticle(width/2, height, velX, velY, 5, width/2, height);

    if (random(10)>5) {
      //start of white particles.
      p[i] = new GrowParticle(width/2, height, velX, velY, 10, width/2, height);
    }
    else {
      //start of Gray particles.
      p[i] = new SliceParticle(width/2, 0, velX, velY, 1, width/2, 0);
    }
  }
}



void draw() {
  for (int i = 0; i<p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}




class GrowParticle extends GenParticle {
  GrowParticle (float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }

  void update() {
    // x and y variables.
    x = x + random(-1, 1);
    y = y + random(-1, 1);
    //radius increases gradually.
    radius+=.25;
  }

  void display() {
    //draws white particles.
    fill(255,50);
    ellipse(x, y, radius, radius);
  }

  void regenerate() {
    if (y<0) {
      //??
      x = originX;
      y = originY;
      radius = 5;
    }
  }
}

class SliceParticle extends GenParticle {
  SliceParticle (float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
  void update() {
   x = x + random(-1, 1);
    y = y + random(-1, 1);
    radius+=.25;
 
  }

  void display() {
    //draws gray particles.
    fill(50,50);
    ellipse(x, y, radius, radius);
  }
  void regenerate(){
    //??
    if(y>=300) {
      x = originX;
      y = originY;
      vx = random(-1.5,1.5);
      vy = random(-1,-.5);
    }
  }
}





class GenParticle extends Particle {
  float originX, originY;

  GenParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r);
    originX = ox;
    originY = oy;
  }

  void regenerate() { 
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) { 
      x = originX; 
      y = originY; 
      vx = random(-1.0, 1.0); 
      vy = random(-4.0, -2.0);
    }
  }
}


class Particle{
  float x,y;
  float vx,vy;
  float radius;
  float gravity = .1;
  
  Particle(float xpos, float ypos, float velx, float vely, float r) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    radius = r;
  }
  
  void update() {
    vy = vy + gravity;
    y += y;
    x+=vx;
  }
  
  void display(){
    ellipse(x,y,radius*2,radius*2);
  }
}




