
PFont font;

int val = 5;
int angle = 360 / val;
int radius = 35; 
float line_goal = 0;
float theta;
float circle_t;
float circle_r = 210;

float s = 0;

int flg = 0;

int r;

float text_alp;

int num = 10;

void setup() {
  size(550, 550);
  colorMode(HSB, 360, 100, 100);
  background(310, 28, 100);
  smooth();

  font = loadFont("font.vlw");
  textFont(font);
  textSize(50);
  textAlign(CENTER);
}

void draw() {
  background(360);

  for (int i = 0; i <num;i++) {
    pushMatrix();
    translate(circle_r  *  sin(radians(360 * i / num )+circle_t)+width/2, circle_r  * cos(radians(360 * i / num)+circle_t)+height/2);
    rotate(radians(theta));
    fill(360 * i/num, 60, 100);
    ume(0, 0, 53);
    popMatrix();
  }
  
  if (flg == 1) {
    theta += 0.3;
    circle_t += 0.0025;

    fill(0, 255*abs(sin(text_alp)));
    text("Happy New Year!!\n2013", width/2, height/2);

    text_alp += 0.02;
  }
}

void ume(int x, int y, float s_goal) {
  pushMatrix();
  translate(x, y);
  for (int i = 0; i < val ; i++) {
    pushMatrix();
    rotate(radians(i*angle -18));
    translate(radius, 0);
    noStroke();
    ellipse(0, 0, s, s);
    popMatrix();
  }

  fill(360);
  ellipse(0, 0, s/2, s/2);

  for (int j = 0; j < 4 ; j++) {
    rotate(radians(45 * j));
    ellipse(-(s/12)*5, 0, s/12, s/12);
    ellipse((s/12)*5, 0, s/12, s/12);
    stroke(360);
    line(-(s/12)*line_goal, 0, (s/12)*line_goal, 0);
  }
  popMatrix();


  line_goal += 0.2;
  s += 0.03;

  if (line_goal > 5) {
    line_goal = 5;
  }
  if (s > s_goal) {
    s = s_goal;
    flg = 1;
  }
}


