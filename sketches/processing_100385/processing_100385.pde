

PShape s;
PShape t;

int x = 35;
int y = 180;

int orbs = 0;

int oX = 250;
int oY = 150;

color black = color(0, 0, 0);

void setup() {
  size(500, 300);
  s = loadShape("Week03.svg");
  t = loadShape("Pacman.svg");
  smooth();
}

void draw() {
  background(255);
  shapeMode(CORNER);
  shape(s, 0, 0);
  collisions(x, y);
  orb();
}

void collisions(int cx, int cy) {
  if (keyPressed) { //up
    if (key =='w') {
      if (get(cx + 20, cy - 20)!=black && get(cx - 20, cy - 20)!=black) {
        y--;
      }
    }
  }
  if (keyPressed) { //down
    if (key =='s') {
      if (get(cx + 20, cy + 20)!=black && get(cx-20, cy+20)!=black) {
        y++;
      }
    }
  }
  if (keyPressed) { //left
    if (key =='a') {
      if (get(cx - 20, cy - 20)!=black && get(cx-20, cy+20)!=black) {
        x--;
      }
    }
  }
  if (keyPressed) { //right
    if (key =='d') {
      if (get(cx + 20, cy - 20)!=black && get(cx+20, cy+20)!=black) {
        x++;
      }
    }
  }
  shapeMode(CENTER);
  shape(t, x, y, 30, 30);
}



void orb() {
  fill(255);
  text("Orbs =" + orbs,30,40);
  float oDist = dist(x,y,oX,oY);
  if(oDist < 20){
    orbs = 1;
  }else if (oDist > 20 && orbs !=1){
    rectMode(CENTER);
    fill(255, 60, 20);
    rect(oX,oY,30,30);
  }
}



