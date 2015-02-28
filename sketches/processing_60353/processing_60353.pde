
int MARGIN = 20;

String eto = "子丑寅卯辰巳午未申酉戌亥";
String[] num = {
  "拾弐", "壱", "弐", "参", "肆", "伍", "陸", "漆", "捌", "玖", "拾", "拾壱"
};
int eto_len = eto.length();
int eto_angle = 360 / eto_len;
int num_len = 12;
int num_angle = 360 / num_len;
int radius = 50;

void setup() {
  size(550, 550);
  stroke(255);
  smooth();
  frameRate(30);

  PFont font = loadFont("font.vlw");
  textFont(font, 40);
  textAlign(CENTER);
}


void draw() {
  int num_e_size = 530;
  int eto_e_size = 400;

  background(0);

  translate(width/2, height/2);
  rotate(radians(180));

  noStroke();
  fill(255);
  ellipse(0, 0, num_e_size, num_e_size);  
  fill(0);
  ellipse(0, 0, eto_e_size, eto_e_size);

  //十二支
  for (int i = 0; i  < eto_len; i++) {
    pushMatrix();

    rotate(radians(i * eto_angle + 90));
    translate(radius*3, 0);
    rotate(radians(90));
    fill(255);

    text(eto.charAt(i), 0, 0);
    popMatrix();
  }

  //数字
  for (int j = 0; j  < num_len; j++) {
    pushMatrix();

    rotate(radians(j * num_angle + 90));
    translate(radius*4.3, 0);
    rotate(radians(90));
    fill(0);

    text(num[j], 0, 0);
    popMatrix();
  }

  clock();
}

void clock() {
  float s = second();
  float m = minute() + (s/60.0);
  float h = hour()%12 + (m/60.0);

  stroke(255, 0, 0);

  // 秒針
  pushMatrix();
  rotate(radians(s*(360/60)));
  strokeWeight(1);
  line(0, 0, 0, width/2-MARGIN);
  popMatrix();

  // 分針
  pushMatrix();
  rotate(radians(m*(360/60)));
  strokeWeight(2);
  line(0, 0, 0, width/2-MARGIN);
  popMatrix();

  // 時針
  pushMatrix();
  rotate(radians(h*(360/12)));
  strokeWeight(4);
  line(0, 0, 0, width/3-MARGIN);
  popMatrix();
}

