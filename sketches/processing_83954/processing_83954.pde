
/*
  NOTES:  
 - Added Cannon
 - Modified missiles to move diagonally
 - Added ArrayList of bullets
 */

Cannon cannon = new Cannon();
ArrayList<City> cities = new ArrayList<City>();
ArrayList<Missile> missiles = new ArrayList<Missile>();
ArrayList<Explosion> explosions = new ArrayList<Explosion>();
ArrayList<Particle> particles = new ArrayList<Particle>();

int counter = 0;
float addMissileTimer = 60;


void setup() {
  size(600, 400);

  cities.add(new City(100, height));
  cities.add(new City(200, height));
  cities.add(new City(400, height));
  cities.add(new City(500, height));

  missiles.add(new Missile());
  missiles.add(new Missile());
}

void draw() {
  background(30);
  displayAllGameElements();
  moveMissiles();
  updateExplosions();
  checkHit();
  addNewMissiles();
  cannon.display();
}

void displayAllGameElements() {
  displayCities();
  displayMissiles();
  displayExplosions();
  displayParticles();
}

void updateExplosions() {
  for (int i = 0; i < explosions.size(); i++) {
    Explosion e = explosions.get(i);
    e.radius++;
    if (e.radius > 40) {
      explosions.remove(i);
      i--;
    }
  }
}
void checkHit() {
  for (int i = 0; i < explosions.size(); i++) {
    Explosion e = explosions.get(i);

    for (int j = 0; j < cities.size(); j++) {
      City c = cities.get(j);
      if (dist(e.x, e.y, c.x, c.y)< 25) {
        cities.remove(j);
        j--;
        particles.add(new Particle(c.x, c.y));
        particles.add(new Particle(c.x, c.y));
        particles.add(new Particle(c.x, c.y));
        particles.add(new Particle(c.x, c.y));
        particles.add(new Particle(c.x, c.y));
      }
    }
  }
}


void displayCities() {
  for (int i = 0; i < cities.size(); i++) {
    City c = cities.get(i);
    c.display();
  }
}

void displayMissiles() {
  for (int i = 0; i < missiles.size(); i++) {
    Missile m = missiles.get(i);
    m.display();
  }
}

void displayParticles() {
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.move();
    p.display();
    if (p.a <=0) {
      particles.remove(i);
      i--;
    }
  }
}

void displayExplosions() {
  for (int i = 0; i < explosions.size(); i++) {
    Explosion e = explosions.get(i);
    e.display();
  }
}

void moveMissiles() {
  for (int i = 0; i < missiles.size(); i++) {
    Missile m = missiles.get(i);
    m.move();
    if (m.y >= height) {
      explosions.add(new Explosion(m.x, m.y));
      missiles.remove(i);
      i--;
    }
  }
}

void addNewMissiles() {
  counter++;
  if (counter > addMissileTimer) {
    counter = 0;
    addMissileTimer -= 1;
    if (missiles.size()<200) {
      missiles.add(new Missile());
    }
  }
}

class Cannon {

  float x, y;
  float x2, y2;

  Cannon() {
  }

  void display() {
    float ang = atan2(mouseY-height, mouseX-width/2);
    x = cos(ang)*50+width/2;
    y = sin(ang)*50+height;
    
    stroke(255);
    strokeWeight(10);
    fill(255);
    line(x, y, width/2, height);
    ellipse(width/2, height, 50,50);
    strokeWeight(1);
  }
} 

class City {
  float x, y;
  
  City(float nx, float ny){
    x = nx;
    y = ny;
  }

  void display() {
    stroke(255);
    fill(255);
    rect(x-10, y-50, 10, 50);
    rect(x, y-30, 5, 30);
    rect(x+5, y-60, 10, 60);
    rect(x+15, y-20, 10, 20);
  }
}

class Missile {
  float x, y;
  float moveX, moveY;
  Missile() {
    x = random(width);
    y = random(-100);
    moveX = random(-2,2);
    moveY = random(1, 3);
  }
  void display() {
    fill(255);
    strokeWeight(2);
    line(x, y, x-moveX, y - moveY*5);
  }
  void move() {
    x += moveX;
    y += moveY;
  }
}

class Explosion {
  float x, y;
  float radius;
  Explosion(float nx, float ny) {
    x = nx;
    y = ny;
    radius = 2;
  }
  void display() {
    noFill();
    int r=10;
    for (int a = 100; a > 0; a-=20) {    
      stroke(255, a);
      r-=4;
      ellipse(x, y, radius+r, radius+r);
    }
  }
}

class Particle {
  float x, y;
  float mx, my;
  float r;
  float a;
  Particle(float nx, float ny) {
    x = nx;
    y = ny;
    mx = random(-3, 3);
    my = random(-3, -.5);
    r = random(5, 15);
    a = 255;
  }
  void display() {
    fill(255,a);
    a--;
    noStroke();
    ellipse(x, y, r, r);
  }
  void move() {
    x += mx; 
    y += my;
    mx *= .98;
    my += .05;
    if (x < 0 || x > width) {
      mx*=-1;
      x += mx;
    }
    if (y < 0 || y > width) {
      my *= -.9;
      y+= my;
    }
  }
}



