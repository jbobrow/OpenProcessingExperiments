
class Sprite {
  PVector loc;
  PVector vel;

  Sprite(PVector loc) {
    this.loc = loc.get();
    this.vel = new PVector();
  }

  void update() {
    this.vel.limit(5);
    this.loc.add(this.vel);
  }

  void render() {
    fill(#FF0000);
    noStroke();
    ellipse(this.loc.x, this.loc.y, 20, 20);
  }
}

class Explosion extends Sprite {
  int timer;
  int timerTop;
  int radius;

  Explosion(PVector loc, int timer, int radius) {
    super(loc);
    this.timer = timer;
    this.timerTop = timer;
    this.radius = radius;
  }

  void update() {
    this.timer --;
    for (int i = enemies.size() - 1; i > -1; i --) {
      PVector enemyLoc = ((Enemy) enemies.get(i)).loc;
      PVector d = PVector.sub(enemyLoc, this.loc);
      if (d.mag() < this.radius) {
        enemies.remove(i);
        score += 2;
        energy += 1;
        explosions.add(new Explosion(enemyLoc, 20, 50));
      }
    }
  }

  void render() {
    fill(0xFF, 0x77, 0, this.timer * 200 / this.timerTop);
    noStroke();
    ellipse(this.loc.x, this.loc.y, this.radius * 2, this.radius * 2);
  }
}

class Enemy extends Sprite {
  Enemy(PVector loc) {
    super(loc);
    this.vel = new PVector(random(-1, 1), random(0.5, 2));
  }

  void update() {
    if (this.loc.x < 10) {
      this.loc.x = 10;
      this.vel.x = -this.vel.x;
    }
    if (this.loc.x > width - 10) {
      this.loc.x = width - 10;
    }
    super.update();
  }

  void render() {
    super.render();
  }
}

ArrayList enemies;
ArrayList explosions;

int spawnTimeout = 10;
float maxEnergy = 100;
float energyInc = 0.3;
float zoffInc = 0.1;

PFont font;
boolean circleDown = false;
int sx = 0;
int sy = 0;
int score = 0;
float energy = 0;
int timer1 = 0;
float zoff = 0;

PVector f(float x, float y) {
  return new PVector(0.5 - noise(x * 2, y * 2, zoff) * 2 + sin(PI * 2.5 + x * PI), noise(x, y));
}

void setup() {
  enemies = new ArrayList();
  explosions = new ArrayList();
  energy = maxEnergy;
  font = loadFont("font.vlw");
  textFont(font);
  size(600, 600);
  ellipseMode(CENTER);
  smooth();
}

void draw() {
  background(50);
  timer1 ++;
  zoff += zoffInc;
  energy += energyInc;

  energy = constrain(energy, 0, maxEnergy);

  stroke(0x33FFFFFF);
  for (int x = 0; x < width; x += 30) {
    for (int y = 0; y < height; y += 30) {
     PVector v = f((float) x / width, (float) y / height);
     v.mult(5);
     v.limit(1);
     line(x, y, x + v.x * 15, y + v.y * 15);
    }
  }

  if (timer1 > spawnTimeout - constrain((int) zoff / 20, 0, spawnTimeout - 2)) {
    timer1 = 0;
    switch ((int) random(1, 4)) {
      case 1:
        enemies.add(new Enemy(new PVector(0, random(0, height / 2))));
      case 2:
        enemies.add(new Enemy(new PVector(width, random(0, height / 2))));
      default:
        enemies.add(new Enemy(new PVector((int) random(10, width - 10), -20)));
    }
  }

  for (int i = enemies.size() - 1; i > -1; i --) {
    Enemy enemy = (Enemy) enemies.get(i);
    if (enemy.loc.y > height) {
      enemies.remove(i);
      score -= 8;
    }
    PVector v = f(enemy.loc.x / width, enemy.loc.y / height);
    enemy.vel.add(v);
    enemy.update();
    enemy.render();
  }

  for (int i = explosions.size() - 1; i > -1; i --) {
    Explosion explosion = (Explosion) explosions.get(i);
    if (explosion.timer < 1) {
      explosions.remove(i);
    }
    explosion.update();
    explosion.render();
  }

  if (circleDown) {
    fill(0x6677AAFF);
    stroke(0xEEFFFFFF);
    int dx = mouseX - sx;
    int dy = mouseY - sy;
    int d = (int) sqrt(dx * dx + dy * dy);
    ellipse(sx, sy, d * 2, d * 2);
    line(sx, sy, mouseX, mouseY);
  }

  fill(255 * energy / maxEnergy, 255, 255);
  noStroke();
  rect(0, height - 10, energy * width / maxEnergy, 10);
  fill(255);
  text(String.format("Energy: %.1f/%.0f | Score: %d", energy, maxEnergy, score), 0, height - 12);
}

void mousePressed() {
  if (!circleDown) {
    circleDown = true;
    sx = mouseX;
    sy = mouseY;
  }
}

void mouseReleased() {
  if (circleDown) {
    circleDown = false;
    int dx = mouseX - sx;
    int dy = mouseY - sy;
    int d = (int) sqrt(dx * dx + dy * dy);
    if (energy < d) {
      d = (int) energy;
    }
    explosions.add(new Explosion(new PVector(sx, sy), 40, d));
    energy -= d;
  }
}


