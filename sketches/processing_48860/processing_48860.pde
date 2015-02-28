
int t;
float fls;

String moji = "臨兵闘者皆陣裂在前";
int len = moji.length();
int angle = 360 / len;
int radius = 50;

void setup() {
  size(320, 320);
  colorMode(HSB, 360, 100, 100);
  background(0);

  PFont font = loadFont("font.vlw");
  textFont(font, 40);
  textAlign(CENTER);

  smooth();
  noStroke();
  //noLoop();
}

void draw() {
  noStroke();
  fill(0, 100*abs(sin(fls)));
  rect(width/2, height/2, width, height);

  translate(width / 2, height / 2);
  for (int i = 0; i  < 9; i++) {
    pushMatrix();

    rotate(radians(i * angle));
    translate(radius*1.8, 0);
    rotate(radians(90));
    //fill(i * angle * 100 / 360, 100, 100);
    fill(179, 53, 100);

    text(moji.charAt(i), 0, 0);
    popMatrix();
  }

  rectMode(CENTER);
  noFill();
  strokeWeight(5);
  stroke(179, 53, 100);
  rect(0, 0, 100, 100);

  pushMatrix();
  rotate(radians(t));
  rect(0, 0, 100, 100);
  popMatrix();

  pushMatrix();
  for (int j = 0;j < 4;j++) {
    rotate(radians(45*j));
    ellipse(0, 0, 80, 30);
  }
  popMatrix();

  ellipse(0, 0, 130, 130);
  ellipse(0, 0, 150, 150);

  ellipse(0, 0, 260, 260);

  strokeWeight(10);
  ellipse(0, 0, 280, 280);

  t++;
  fls += 0.2;

  filter(BLUR, 1.5);
}


