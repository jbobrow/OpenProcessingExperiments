
static class GameState {
  static int PLAYING = 1;
  static int DEAD = 2;
}

ArrayList ENEMIES = new ArrayList();
color COLORS[] = {#F50233, #2202F5, #F002F5, #F5DD02, #02EBF5, #8A43FF};
int GAME_STATE = GameState.PLAYING;
int ticks = 0;

class Enemy {
  PVector pos;
  PVector dir;
  color colour;
  int size;
  int vel;
  
  Enemy(float x, float y, int dx, int dy, int vel, int size, color colour) {
    this.pos = new PVector(x,y);
    this.dir = new PVector(dx,dy);
    this.size = size;
    this.vel = vel;
    this.colour = colour;
  }
  void draw() {
    noStroke();
    fill(this.colour);
    ellipse(this.pos.x, this.pos.y, this.size, this.size);
  }
  void move() {
    this.pos.x += (this.vel*this.dir.x);
    this.pos.y += (this.vel*this.dir.y);
  }
  boolean collidesWithPlayer() {
    return (this.pos.dist(new PVector(mouseX, mouseY)) - (this.size/1.7)) <= 0;
  }
}
Enemy randomEnemy() {
  color colour = COLORS[int(random(COLORS.length-1))];
  int size = int(random(100))+11;
  int vel = int(random(8)+1);
  Enemy e;
  
  switch(int(random(4))) {
    case 0:
      // left
      e = new Enemy(0, random(height), 1, 0, vel, size, colour);
      break;
    case 1:
      // top
      e = new Enemy(random(width), 0, 0, 1, vel, size, colour);
      break;
    case 2:
      // right
      e = new Enemy(width, random(height), -1, 0, vel, size, colour);
      break;
    case 3:
      // bottom
      e = new Enemy(random(width), height, 0, -1, vel, size, colour);
      break;
    default:
      throw new Error("never gonna happen.");
  }
  return e;
}
void resetEnemies() {
  for (int i = ENEMIES.size()-1; i >= 0; i--) { ENEMIES.remove(i); }
  for(int i = 0; i<12; i++) { ENEMIES.add(randomEnemy()); }
}
void setup() {
  size(640,480);
  resetEnemies();
  drawPlayer();
  drawEnemies();
}
void drawPlayer() {
  noStroke();
  fill(#2AF502);
  ellipse(mouseX, mouseY, 20, 20);
}
void drawEnemies() {
  for (int i = ENEMIES.size()-1; i >= 0; i--) { 
    Enemy e = (Enemy) ENEMIES.get(i);
    e.draw();
  }
}
void moveEnemies() {
  for (int i = ENEMIES.size()-1; i >= 0; i--) { 
    Enemy e = (Enemy) ENEMIES.get(i);
    e.move();
    if(e.collidesWithPlayer()) {
      GAME_STATE = GameState.DEAD;
      break;
    }
  }
}
void spawnMoreEnemies() {
  if((ticks % 40) == 0)
    for(int i = 0; i<=int(random(6)); i++) { ENEMIES.add(randomEnemy()); }     
}
void draw() {
  background(0);  
  if(GAME_STATE == GameState.PLAYING) {
    ticks++;
    moveEnemies();
    drawPlayer();
    drawEnemies();
    spawnMoreEnemies();
  } else if(GAME_STATE == GameState.DEAD) {
    fill(255);
    text("You are dead.", height/1.5, width/1.5);
  }
}

void mouseClicked() {
  if(GAME_STATE == GameState.DEAD) {
    setup();
    GAME_STATE = GameState.PLAYING;
  }
}
