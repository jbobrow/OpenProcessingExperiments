
int num = 200;
GenParticle[] p = new GenParticle[num];

void setup() {
  size(300, 300);
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-10, 10);
    float velY = random(-i);
    if (random(10) > 1) {
      p[i] = new Snowflake(random(width), 0, velX, velY, 8, random(width), 0);
    }
    else {
      p[i] = new Tennisball(width/8, height/8, velX, velY*2, 15, random(width), random(height));
    }
  }
}

void draw() {
  background(0);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}




class Snowflake extends GenParticle {
  float age;

  Snowflake(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = random(100);
  }

  void update() {
    if (y >= height - radius) { //snowflakes melting as they reach the ground
      vy = -0.06 * vy;
    }

    vy = vy + gravity;
    y += vy;
    x += vx;
    age++;
  }

  void display() {
    strokeWeight(3);
    stroke(255);
    line(x, y, x+5, y+5);
    line(x+2, y, x+2, y+5);
    line(x+5, y, x, y+5);
  }

  void regenerate() {
    if (age > 100) {
      x = originX;
      y = originY;
      vx = random(-1.5, 1.5); 
      vy = random(-1, -0.5);
      age = 0;
      radius = 5.0;
    }
  }
}

class Tennisball extends GenParticle {
  float age;

  Tennisball(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0;
  }

  void display() {
    fill(255, 230, 0);
    ellipse(x, y, radius, radius);
    radius+=0.25;
    age++;
  }

  void update() {
    if (y >= height) { //bounces
      y = height - radius;
      vy = -0.9 * vy;
      radius = radius * 1.001;//the tennisballs are growing
    }
    vy = vy + gravity;
    y += vy;
    x += vx;
    age++;
  }

  void regenerate() {

    if (age > 300) {
      x = originX;
      y = originY;
      vx = random(-1.5, 1.5); 
      vy = random(-1, -0.5);
      radius = 5.0;
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
  float x, y;
  float vx, vy;
  float radius;
  float gravity = 0.15;

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


