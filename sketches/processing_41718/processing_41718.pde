
int numParticles = 10000;

GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size(700, 300);
  noStroke();
  smooth();
  for (int a = 0; a < p.length; a++) {
    float velX = random(-1, 100);
    float velY = random(-150, 30);

    if (random(10) > 5) {
      p[a] = new Rect1Particle(width/2, height, velX*10, velY*100, width/5.0, random(width), width/25);
    }
    else {
      p[a] = new Rect2Particle(width/2, height/2, velX, velY, 15.0, width/2, height);
    }
  }
}

void draw() {
  fill(0, 50);
  rect(0, 0, width, height);
  for (int a = 0; a < p.length; a++) {
    p[a].update();
    p[a].regenerate();
    p[a].display();
  }
}


class Rect2Particle extends GenParticle {
  float age;

  Rect2Particle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0;
  }

  void display() {
    //sets up color gradient change for rectangle 2
    color c = lerpColor(color(174, 229, 160, 10), color(206, 160, 229, 50), age * 1);
    fill(c);
    //random width and height for origin of rectangle which then extends from origin to the sides of the sketch
    rect(random(width), random(height), width, height);
    radius+= 25;
    age++;
  }

  void regenerate() {
    if ((x > random(width + radius)) || (x < -radius/width) ||
      (y > random(height) + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(5, 50);
      vy = random(-100.0, 150.0);
      radius = 5.0;
      age = 0;
    }
  }
}


class Rect1Particle extends GenParticle {
  float age;

  Rect1Particle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = random(200);
  }

  void update() {
    if (y >= height +radius) {
      y = width + radius;
      vy = .001 * vy;
      radius =height/random(width);
      vy = vy + gravity;
      y += vy;
      x += vx;
      age++;
    }
  }

  void display() {
    //sets up gradient change for rectangle 1
    color c = lerpColor(color(255, 255, 255, 10), color(225, 255, 255, 10), age * 0.5); // create the changing color effect
    fill(random(c));
    //changes origin and the size of the rectangle
    rect(random(width), random(height*radius), random(radius), random(radius));
  }

  void regenerate() {
    if (age > 5000) {  
      x = originX;
      y = originY;
      vx = random(-1.5, 15); 
      vy = random(-1, 50);
      age = 0;
      radius =7.0;
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
      vx = random(-1.0, 10.0);
      vy = random(-4.0, 2.0);
    }
  }
}


class Particle {
  float x, y; 
  float vx, vy;
  float radius; 
  float gravity = 10;

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
    rect(random(width), random(height), radius*2, radius*2);
  }
}


