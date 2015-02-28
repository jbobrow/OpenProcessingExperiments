
PShape s;
PShape t;
 
int x = 40;
int y = 150;
int timer = 0;
 
 
int orbs = 0;
float oX = 250;
float oY = 150;
 
color black = color(4, 0, 0);
 
void setup() {
  size(553, 500);
  s = loadShape("bkgd.svg");
  t = loadShape("meow.svg");
  smooth();
}
 
void draw() {
  background(255);
  shapeMode(CORNER);
  shape(s, 0, 0);
  collisions(x, y);
  orb();
  nip();
}
 
void collisions(int cx, int cy) {
  if (keyPressed) { //UP
    if (key == 'w') {
      if (get(cx + 100, cy - 100) != black  && get(cx - 100, cy - 100) != black) {
        y--;
      }
    }
  }
 
 
  if (keyPressed) { //DOWN
    if (key == 's') {
      if (get(cx + 100, cy + 100) != black  && get(cx - 100, cy + 100) != black) {
        y++;
      }
    }
  }
 
 
  if (keyPressed) { //LEFT
    if (key == 'a') {
      if (get(cx - 100, cy - 100) != black  && get(cx - 100, cy + 100) != black) {
        x--;
      }
    }
  }
 
 
  if (keyPressed) { //RIGHT
    if (key == 'd') {
      if (get(cx + 100, cy - 100) != black  && get(cx + 100, cy + 100) != black) {
        x++;
      }
    }
  }
  shapeMode(CENTER);
  shape(t, x, y, 65, 65);
}
 
void orb() {
  fill(#006400);
  text("Catnip =" + orbs, 10, 30);
    float oDist = dist(x, y, oX, oY);
  if (oDist < 20) {
    orbs = 1;
  }  else if (oDist > 20 && orbs != 1) {
    rectMode(CENTER);
    fill(random(255), random(255), random(255));
    rect(oX, oY, 10, 10);
  }
}

void nip() {
  //respawn
  timer++;
 if (timer>=200) {
    oX = random(width);
    oY = random(height);
    timer = 0;
   float oDist = dist(x, y, oX, oY);
    if (oDist < 20) {
    orbs = 1;
  }  else if (oDist > 20 && orbs != 1) {
    rectMode(CENTER);
    fill(random(255), random(255), random(255));
    rect(oX, oY, 10, 10);
  }
} 
}
  



