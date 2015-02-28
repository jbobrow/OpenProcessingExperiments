
PFont font;

int num = 8;

String[] name = {
  "薄紅梅", "猩々緋", "利休鼠", "萌黄", "藤黄", "天鵞絨", "紅桔梗", "紺碧"
};
color[] c = {
  #e597b2, #e2041b, #888e7e, #aacf53, #f7c114, #2f5d50, #4d4398, #007bbb
}; 
float[] x = new float[num];
float[] y = new float[num];

int now_c;

void setup() {
  size(500, 500);
  background(0);
  smooth();

  font = loadFont("font.vlw");
  textFont(font);
  textSize(50);

  for (int i = 0; i < num;i++) {
    x[i] = 60*i + 20;
  }
}

int val = 5;
int angle = 360 / val;
int radius = 40;
int r = 60;
int r2 = 5;

void draw() {
  background(0);

  for (int i = 0; i < num ; i++) {
    fill(c[i]);
    text(name[i], x[i], 160, 50, 200);
  }
  ume(80, 80, c[now_c], 60);
  ume(width-80, height-80, c[now_c], 60);

  if (mouseY > 160 && mouseY < 460 && mouseX > x[0] && mouseX < x[num-1] + 40) {
    now_c = (mouseX / 60);
  }
  else {
    now_c = now_c;
  }
}


void ume(int x, int y, color c, int s) {
  pushMatrix();
  translate(x, y);
  for (int i = 0; i < val ; i++) {
    pushMatrix();
    rotate(radians(i*angle-18));
    translate(radius, 0);
    fill(c);
    noStroke();
    ellipse(0, 0, s, s);
    popMatrix();
  }

  fill(255);
  ellipse(0, 0, s/2, s/2);

  stroke(255);
  for (int j = 0; j < 4 ; j++) {
    rotate(radians(45 * j));

    ellipse(-(s/12)*5, 0, s/12, s/12);
    ellipse((s/12)*5, 0, s/12, s/12);
    line(-(s/12)*5, 0, (s/12)*5, 0);
  }
  popMatrix();
}

