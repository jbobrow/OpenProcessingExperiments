
SpaceRock[] rocks = new SpaceRock[0];
int score = 0;
 
void setup() {
  size(600, 400);
}
 
void draw() {
  background(0);
  fill(255);
  text("score:" + score, 10,40);
 
  if (frameCount % 40 == 0) {
    SpaceRock ship = new SpaceRock();
    rocks = (SpaceRock[]) append(rocks, ship);
  }
 
  if (rocks.length>10) {
 
    rocks = (SpaceRock[]) subset(rocks, 1);
  }
 
  for (int i = 0; i<rocks.length; i++) {
    rocks[i].update();
  }
}
 
void mousePressed() {
  for (int i = 0; i<rocks.length; i++) {
    SpaceRock ship = rocks[i];
 
    if ((mouseX>ship.x) && (mouseX<ship.x + ship.w) && (mouseY>ship.y) && (mouseY<ship.y+ship.h)) {
      ship.alive = false;
      score++;
    }
  }
}
 
 
class SpaceRock {
  float x;
  float y;
  float w;
  float h;
  float velX;
  float velY;
  boolean alive;
 
  SpaceRock() {
 
    y = random(0, height*0.7);
    w = 50;
    x = width;
    h = 20;
    velX = -4;
    velY = 0;
    alive = true;
  } 
 
  void update() {
    x+=velX;
    y+=velY;
     
    if(alive) {
      fill(255, 0, 0);
      stroke(255);  
    } else {
      fill(128,0,0); 
      noStroke();
      velY +=0.3;
    }
    rect(x, y, w, h);
  }
}
