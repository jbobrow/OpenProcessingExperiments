
PShape s;
PShape t;

int x = 125;
int y = 325;

color black = color(0, 0, 0);

int orbs = 0;
int oX = 300;
int oY = 300;



void setup() {
  size(600, 600);
  s = loadShape("space.svg");
  t = loadShape("face.svg");
  smooth();
}

void draw() {
  background(255);
  shapeMode (CORNER);
  shape(s, 0, 0);
  collisions(x, y);
  orb();
}

void collisions(int cx, int cy) {
  if (keyPressed) {//UP
    if (key =='w') {
      if (get(cx +20, cy - 20) != black  && get(cx -20, cy - 20) != black) {
        y--;
      }
    }
  }

  if (keyPressed) { //DOWN
    if (key == 's') 
      if (get(cx + 20, cy + 20) != black  && get(cx - 20, cy + 20) != black) {
        y++;
      }
  }



  if (keyPressed) { //LEFT
    if (key == 'a') {
      if (get(cx - 20, cy - 20) != black  && get(cx - 20, cy + 20) != black) {
        x--;
      }
    }
  }



  if (keyPressed) { //RIGHT
    if (key == 'd') {
      if (get(cx + 20, cy - 20) != black  && get(cx + 20, cy + 20) != black) {
        x++;
      }
    }
  }



  shapeMode(CENTER);
  shape(t, x, y, 150, 150);
}

void orb() {
  fill(255);
  text("Orbs =" + orbs, 10, 30);
  float oDist = dist(x, y, oX, oY);
  if (oDist < 20) {
    orbs = 1;
  } 
  else if (oDist > 20 && orbs != 1) {
    rectMode(CENTER);
      fill(random(255), random(255), random(255));
    rect(oX, oY, 30, 30);
  }
}



