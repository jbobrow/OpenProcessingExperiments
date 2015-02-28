
/*I had a hard time even getting this to work but I think I'm beginning to understand
 the basic principle of object/classes but it's still confusing
 Code borrowed/modified from Nick Senske and Eddie Winn(the bounce part)*/


int numParticles = 600;
GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size(300, 300);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = -i;
    if (random(5)>2) {
      p[i]= new TopParticle(width/2, 30, velX, velY, 8, width/2, 30);
    }
    else {
      p[i]=new BottomParticle(width/2, 270, velX, velY, 8, width/2, 270);
    }
  }
}

void draw() {
  background(20, 80);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}

//2ND SUBCLASS ______________________________________________________________

class BottomParticle extends GenParticle {

  BottomParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
  void display() {
    fill(189, 242, 32, 80);
    ellipse(x, y, radius*3, radius*3); //ellipses start big
    if (y>height-10) {
      if (x<1 || x<299) {
        vy=-2;
      }
    }
  }
  void regenerate() {
    if (y>300) {
      x=width/2;
      y=270;
      vx=random(-5, 5);
      vy=random(-3, -1);
      radius=2.0; //after initial launch the ellipses are smaller
    }
  }
}

//1ST SUBCLASS________________________________________________________________

class TopParticle extends GenParticle {

  TopParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }

  void display () {
    fill(188, 19, 78, 80);
    ellipse(x, y, radius*3, radius*3); //ellipses start big
    if (y>height-10) {
      vy=-2;
    }
  }

  void regenerate() {
    if (y>300) {
      x=originX;
      y=originY;
      vx=random(-2, 2);
      vy= random(-1, -.05);
      radius=2.0;  //after inital launch the ellipses are smaller
    }
  }
}

//GENPARTICLE SUBCLASS________________________________________________________

class GenParticle extends Particle {
  float originX, originY;

  GenParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super (xIn, yIn, vxIn, vyIn, r);
    originX=ox;
    originY=oy;
  }

  void regenerate() {
    if ((x>width+ radius ) || (x<-radius) ||
      (y>height+radius) || (y<-radius)) {
      x=originX;
      y=originY;
      vx=random(-1.0, 1.0);
      vy=random(-4.0, -.0);
    }
  }
}

//PARTICLE CLASS________________________________________________________________

class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0.1;

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
  }

  void display() {
    ellipse(x, y, radius*2, radius*2);
  }
}


