
PShape s;
PShape t;
PShape b;
PShape m;
PFont font;


int startX = 500; //tween
int stopX = 500;
int startY = 300; 
int stopY = 300;

float startrandX = random(10,startX);
float startrandY = random(10,startY);
float stoprandX = random(10,stopX);
float stoprandY = random(10,stopY);

float mX = startrandX;//startX
float mY = startrandY;//startY
float step = 0.005;
float pct = 0.0;


float bY = random(0, 300);//across the screen
float bX = -bY;
float bspeed = 1.0;


int x = 30; //character
int y = 100;
int mushrooms = 0;
int bones= 0;


color green = color(115, 192, 73);



void setup() {
  size(500, 300);
  //frameRate(30);
  s = loadShape("bground.svg");
  t = loadShape("gamecharacter.svg");
  b = loadShape("bones.svg");
  m = loadShape("mushroom.svg");
  smooth();
  shapeMode(RADIUS); //wrap around
  font = loadFont("TektonPro-Bold-48.vlw");
  textFont(font);
}

void draw() {
  background(255);
  shapeMode(CORNER);
  shape(s, 0, 0);
  collisions(x, y);
  tbones();
  tmush();
  
//  shapeMode(CENTER);
//  shape(m, mX, mY);
//  shape(b, bX, bY);
//  shape(t, x, y);
  
  
}

void collisions(int cx, int cy) {
  if (keyPressed) { 
  if (keyCode == UP) { //UP
      if (get(cx + 20, cy - 20) != green && get(cx - 20, cy - 20) != green) {
        y--;
      }
    }
  }

  if (keyPressed) { 
    if (keyCode == DOWN) {
      if (get(cx + 20, cy + 20) != green && get(cx - 20, cy + 20) != green) {
        y++;
      }
    }
  }

  if (keyPressed) { //LEFT
    if (keyCode == LEFT) {
      if (get(cx - 20, cy - 20) != green && get(cx - 20, cy + 20) != green) {
        x--;
      }
    }
  }

  if (keyPressed) { //Right
    if (keyCode == RIGHT) {
      if (get(cx + 20, cy - 20) != green && get(cx + 20, cy + 20) != green) {
        x++;
      }
    }
  }
  shapeMode(CENTER);
  shape(t, x, y, 50, 50);
}
void tbones() {
  fill(0);
  textSize(24);
  text("Bones =" + bones, 10, 30);
  float bDist = dist(x, y, bX, bY);
  if (bDist < 20) {
    bones = 1;
  } 
  else if (bDist > 20 && bones != 1) {
    bX += random(0, 2.0);
    if (bX >width + bY) {
      bX = -bY;
    }
    shapeMode(CENTER);
    shape(b, bX, bY, 50, 50);
  }
}

void tmush() {
  
  if (pct < 1.0) { // tween
    mX = startrandX + ((stoprandX - startrandX) * pct);
    mY = startrandY + ((stoprandY - startrandY) * pct);
    pct += step;
  }

  fill(0);
  textSize(24);
  text("Mushrooms =" + mushrooms, 200, 30);
  float mDist = dist(x, y, mX, mY);
  if (mDist < 20) {
    mushrooms = 1;
  } 
  else if (mDist > 20 && mushrooms != 1) {
    shapeMode(CENTER);
    shape(m, mX, mY, 50, 50);

  }
  
}




