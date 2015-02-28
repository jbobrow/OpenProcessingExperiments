
PShape s;
PShape t;

int x = 40;
int y = 250;
int coffee = 0;
int cX= 350;
int cY = 200;

color black = color(0, 0, 0);

void setup() {
  size(500, 300);
  s = loadShape("Studio.svg");
  t = loadShape("Grrrr.svg");
  smooth();
}

void draw() {
  background(255);
  shapeMode(CORNER);
  shape(s, 0, 0);
  collisions(x, y);
  coffee();
}

void collisions(int cx, int cy) {
  if (keyPressed) { //UP
    if (key == 'w') {
      if (get(cx + 10, cy - 10) != black && get(cx - 10, cy - 10) != black) {
        y--;
      }
    }
  }
  if (keyPressed) { //DOWN
    if (key == 's') {
      if (get(cx + 10, cy + 10) != black  && get(cx - 10, cy + 10) !=black) {
        y++;
      }
    }
  }
  if (keyPressed) { //LEFT
    if (key == 'a') {
      if (get(cx - 10, cy - 10) != black  && get(cx - 10, cy + 10) !=black) {
        x--;
      }
    }
  }
  if (keyPressed) { //RIGHT
    if (key == 'd') {
      if (get(cx + 10, cy - 10) != black  && get(cx + 10, cy + 10) !=black) {
        x++;
      }
    }
  }

  shapeMode(CENTER);
  shape(t, x, y, 200, 200);
}

void coffee() {
  fill(#FFD500);
  text("COFFEE:" + coffee, 10, 30); 
  float cDist = dist(x, y, cX, cY);
  if (cDist < 20) {
    coffee = 1;
  }
  else if (cDist > 20 && coffee != 1) {
    rectMode(CENTER);
    fill(random(255), random(255), random(255));
    rect(cX, cY, 10, 15);
  }
  }



