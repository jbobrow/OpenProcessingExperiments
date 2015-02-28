
int r = 6;

int yoko_num = 450 / r ;
int tate_num = 450 / r;

Dot[][] dots = new Dot[yoko_num][tate_num];

color[] c = new color[yoko_num * tate_num];

int count = 0;


void setup() {
  size(450, 450);
  noLoop();
  colorMode(HSB, 360, 100, 100);
  background(360);
  frameRate(50);

  textSize(95);
  textAlign(CENTER, CENTER);

  text_draw();
  color_check();

  for (int i = 0; i < yoko_num;i++) {
    for (int j = 0; j < tate_num;j++) {
      dots[i][j] = new Dot(i, j, r);
    }
  }
}


void draw() {
  background(360);

  for (int i = 0; i < yoko_num;i++) {
    for (int j = 0; j < tate_num;j++) {
      if (c[count] != -1) {
        dots[i][j].display();
      }

      count++;
      if (count > c.length - 1) {
        count = 0;
      }
    }
  }
}

void text_draw() {
  //background(360);
  fill(0);
  text("Happy\nNew\nYear!\n2014", width/2, height/2);
}

void color_check() {
  for (int i = 0 ; i< yoko_num;i++) {
    for (int j = 0;j < tate_num;j++) {
      c[count] = get(i*r+r/2, j*r+r/2);

      count++;
      if (count > c.length - 1) {
        count = 0;
      }
    }
  }
}
class Dot {
  int i;
  int j;
  float goal_r;
  float r;
  float hue = random(360);

  Dot(int tmpI, int tmpJ, float tmpR) {
    i = tmpI;
    j = tmpJ;
    goal_r = tmpR;
  }

  void display() {
    r = goal_r;

    stroke(0);
    fill(hue, 80, 100);
    ellipse(i*goal_r, j*goal_r, r, r);

  }
}



