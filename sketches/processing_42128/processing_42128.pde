
int numParticles = 800;
GenParticle[] p = new GenParticle[numParticles]; 

void setup() {
  size(300, 500);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    if (random(2)>1) {
      float velX = random(-2, 2);
      float velY = random(-8, -4);
      p[i] = new Stars(width/2, -100, velX, velY, width/2, 0); //generates number of stars
    }
    else {
      float velX = random(-1, 1);
      float velY = random(10, 20);
      p[i] = new Fuel(width/2, 3*(width/4), velX, velY, width/2, 2*(width/3)); //generates number of fuel part.
    }
  }
}

void draw() {
  fill(0);
  rect(0, 0, width, height);
  stroke(255);

  for (int i = 0; i < p.length; i++) {//continuously draws 
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
  Rocket();//draws rocket
}


class Fuel extends GenParticle {  //rocket flames

  Fuel(float xIn, float yIn, float vxIn, float vyIn, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, ox, oy);
  }

  void update() {
    vy = vy + gravity; //velocity of particles due to gravity
    y += vy;  //possition of particles due to velocity vert. 
    x += vx;  //possition of particles due to velocity horiz.
  }

  void regenerate() {
    if ((x > width) ||(y > height) ) { //if particle goes beyond borders, reset
      x = originX;
      y = originY;
      vx = random(-1, 1);
      vy = random(10, 15); //fast verticle velocity
    }
  }
  void display() { //draw red color, and growing size
    stroke(255, y/2, 0, 100);
    strokeWeight(abs(1+ y/50));
    point(x, y);
  }
}


class Stars extends GenParticle { //passing stars
  Stars(float xIn, float yIn, float vxIn, float vyIn, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, ox, oy);
  }
  void update() {
    vy = vy + gravity/2; //velocity due to half gravity
    y += vy;
    x += vx;
  }
  void regenerate() {
    if ((x > width)||(y > height) ) {
      x = originX;
      y = originY;
      vx = random(-5, 5);
      vy = random(-4,-2); //slow vertical velocity
    }
  }
  void display() {//make point lighter as it falls, and slightly larger as well
    stroke(abs(y+50)); 
    strokeWeight(abs(1+ y/100));
    point(x, y);
  }
}


class GenParticle extends Particle { //regenerates mother particle
  float originX, originY;

  GenParticle(float xIn, float yIn, float vxIn, float vyIn, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn);
    originX = ox;
    originY = oy;
  }
}




class Particle { //mother particle sets up variables for all other classes
  float x, y;
  float vx, vy;
  float gravity = 0.05;

  Particle(float xpos, float ypos, float velx, float vely) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
  }

  void update() { // must exist to be seeded into draw
  }
  void display() {
  }
  void regenerate() {
  }
}
void Rocket() { //adapted form Kevin Keables Rocket on Open Processeing
  pushMatrix();
  rotate(radians(90));
  translate(50, -250);
  noStroke();

  fill(0, 50, 255);
  ellipse(75, 89, 13, 13);//window top

  fill(255, 50, 0);
  triangle(100, 100, 158, 80, 158, 120);//fins

  fill(200);
  ellipse(100, 100, 125, 25); //body

  fill(0, 50, 255);
  ellipse(75, 89, 13, 7); //window bottom

  fill(255, 50, 0);
  triangle(30, 100, 45, 94, 45, 106);//nose

  fill(60);
  rect(158, 95, 5, 10); //tail pipe

  popMatrix();
}


