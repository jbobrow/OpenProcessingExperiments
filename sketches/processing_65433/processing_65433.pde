
PFont num;

int s_size = 15;

void setup() {
  size(300, 300);
  background(0);
  smooth();

  num = loadFont("num.vlw");
  textFont(num);

  frameRate(10);
}

void draw() {
  PImage preImage = get();  
  background(0);
  blend(preImage, 0, 0, width, height, 0, 0, width, height-15, ADD);

  textSize(s_size);
  for (int p = 0;p <= width/s_size;p++) {
    for (int q = 0;q <= height/s_size;q++) {
      fill(255, 155, 0);
      String r_num = hex((int)random(15.99), 1);
      text(r_num, 5+ p*s_size, q*s_size -2);
    }
  }

  filter(BLUR, 1.5);
}

