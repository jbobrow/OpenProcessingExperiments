
PImage bg;
PImage cha;
int timer = 0;
int x = 700;
int y = 500;
int orbs = 0;
float oX = 300;
float oY = 200;

color black = color(0, 0, 0);

void setup() {
  size(800, 600);
  imageMode(CORNER);
  bg = loadImage("bGr.jpg");
  cha = loadImage("cha.jpg");
 
}

void draw() {
  image(bg, 0, 0);
  collision(x, y);
  orb();
}

void collision(int cx, int cy) {
  if (keyPressed) {//up
    if (key == 'w') {
      if (get(cx + 10, cy - 10) != black && get(cx - 10, cy - 10) != black) {
        y -= 3;
      }
    }
  }

  if (keyPressed) {//down
    if (key == 's') {
      if (get(cx + 10, cy + 10) != black && get(cx - 10, cy + 10) != black) {
        y += 3;
      }
    }
  }
  if (keyPressed) {//left
    if (key == 'a') {
      if (get(cx - 10, cy - 10) != black && get(cx - 10, cy + 10) != black) {
        x -= 3;
      }
    }
  }
  if (keyPressed) {//right
    if (key == 'd') {
      if (get(cx + 10, cy - 10) != black && get(cx + 10, cy + 10) != black) {
        x += 3;
      }
    }
  }
  image(cha, x, y, 40, 40);
}

void orb(){
  timer++;
  if(timer >= 120){
        oX = random(width);
    oY = random(height);
    timer = 0;
  }
  fill(0,0,0);
  text("orbs =" + orbs, 10, 30);
  float oDist = dist(x,y,oX,oY);
  if(oDist < 20){
    orbs = 1;
  }else if (oDist > 20 && orbs != 1){
    ellipseMode(CENTER);
    fill(#FF0808);
    ellipse(oX,oY,15,15);
}
}


