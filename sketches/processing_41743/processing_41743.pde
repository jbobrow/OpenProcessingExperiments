
//Color changing balls

int numParticles = 1000;
GenParticle[] p = new GenParticle[numParticles];


void setup() {
  size(400, 400);
  smooth();
  noStroke();
  for (int i=0; i<p.length; i++) {
    float velX = random(-1, 1);
    float velY = -1;

    if (random(10) > 5) {
      //blue
      p[i] = new blueParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
    }
    else {
      //red, green, yellow
      p[i] = new redParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
      p[i] = new greenParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
      p[i] = new yellowParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
    }
  }
}
//Black background
void draw() {
  fill(20);
  rect(0, 0, width, height);
  for (int i=0; i<p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}



//blue particle

class blueParticle extends GenParticle {
  float age;


  blueParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0;
  }

  void display() {
    fill(0, 0, 255);
    ellipse(x, y, radius, radius);
    radius+=0.20;
    age++;
  }


  //resets origin
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-5, 5);
      vy = random(-10, -5);
      radius = 1.0;
      age = 0;
    }
  }
}


//red particle

class redParticle extends GenParticle {
  float age;

  redParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0;
  }

  void display() {
    //blue-yellow
    color c = lerpColor(color(0, 0, 255), color(255, 255, 0), age * 0.005);
    fill(c);
    ellipse(x, y, radius, radius);
    radius+=0.20;
    age++;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-5, 5);
      vy = random(-10, -5);
      radius = 1.0;
      age = 0;
    }
  }
}



//green particle

class greenParticle extends GenParticle {
  float age;

  greenParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0;
  }

  void display() {
    //yellow-blue
    color c = lerpColor(color(255, 255, 0), color(0, 0, 255), age * 0.02);
    fill(c);
    ellipse(x, y, radius, radius);
    radius+=0.20;
    age++;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-5, 5);
      vy = random(-10, -5);
      radius = 1;
      age = 0;
    }
  }
}



//yellow particle

class yellowParticle extends GenParticle {
  float age;

  yellowParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0;
  }

  void display() {
    //red-green
    color c = lerpColor(color(255, 0, 0), color(0, 255, 0), age * 0.01);
    fill(c);
    ellipse(x, y, radius, radius);
    radius+=0.20;
    age++;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-5, 5);
      vy = random(-10, -5);
      radius = 1.0;
      age = 0;
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


class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0.1; //change tragectory from center up and outward

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


