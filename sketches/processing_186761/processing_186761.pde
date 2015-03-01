
int n;

ArrayList<Particle> particles;

int oX;
int oY;

float v;

int posY = mouseY;
int posX = mouseX;

void setup() {
  size(800, 800);
  background(0);
  smooth();
  frameRate(60);
  noCursor();
  particles = new ArrayList();

  for (int i = 0; i < 500; i++) {
    particles.add(new Particle(random(250, 550), random(250, 550)));
  }

  v = 4;
}

void draw() {
  fill(255, 50); // semi-transparent white
  rect(0, 0, width, height);

  noStroke();
  fill(19, 128, 207, 20);
  ellipse(mouseX, mouseY, 50, 50);

  oX = 0;
  oY = 0;
  for (Particle p : particles) {
    oX += p.x;
    oY += p.y;
  }
  oX = ((oX/particles.size())+posX)/2;
  oY = ((oY/particles.size())+posY)/2;



  for (Particle p : particles) {
    p.move();
    p.draw();
  }
}

void mouseClicked() {
  posY = mouseY;
  posX = mouseX;
  noStroke();
  fill(19, 128, 207, 80);
  ellipse(mouseX, mouseY, 80, 80);
}

class Particle {
  float x;
  float y;

  float vX;
  float vY;

  float t;

  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    this.t = random(TWO_PI);
  }

  void move() {
    if (x <= 0 || x >= 800 || y <= 0 || y >= 800) t += PI;

    //else t += 0.2-random(0.4);
    float dA;
    float dX = x - oX;
    float dY = y - oY;

    t = t%TWO_PI;

    float a = atan2(dX, dY)+PI;

    dA = abs(t-a);


    //text("t = " + t.toFixed(2) + " a = " + a.toFixed(2), x+10, y+10);


    if (abs(a-t) > 1) {
      t += random(v)/random(20, 40);
    }

    vX = sin(t);
    vY = cos(t);

    x += vX*v;
    y += vY*v;
  }

  void draw() {
    noStroke();
    fill(123, 214, 54, 65);
    ellipse(x, y, 5, 5);
    stroke(255, 50);
    line(x, y, x+vX*10, y+vY*10);
  }
}

