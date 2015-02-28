
int t;
float fls;

float ms;
float ce;

float hb;

String moji = "玉の緒よ絶えなば絶えねながらへば忍ぶることの弱りもぞする　　　";
int len = moji.length();
int angle = 360 / len;
int radius = 50;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(0);

  PFont font = loadFont("font.vlw");
  textFont(font, 30);
  textAlign(CENTER);

  smooth();
  noStroke();
  //noLoop();
  rectMode(CENTER);
}

void draw() {
  //背景
  noStroke();
  translate(width / 2, height / 2);
  fill(0, 100*abs(sin(fls)));
  rect(0, 0, width, height);

  //文字
  for (int i = 0; i  < 31; i++) { //*********************ここの数字を変える
    pushMatrix();
    rotate(radians(i * angle));
    translate(radius*2.57, 0);
    rotate(radians(90));
    fill(323, 78, 100);
    text(moji.charAt(i), 0, 0);
    popMatrix();
  }

  //初期設定
  noFill();
  strokeWeight(5);
  stroke(323, 78, 100);

  //外枠
  ellipse(0, 0, 320, 320);
  strokeWeight(10);
  ellipse(0, 0, 340, 340);

  //右上枠
  strokeWeight(8);
  ellipse(100, -60, 105, 105);

  //右上四角
  strokeWeight(5);
  pushMatrix();
  translate(100, -60);
  rotate(radians(-t));
  rect(0, 0, 65, 65);
  popMatrix();

  pushMatrix();
  translate(100, -60);
  rotate(radians(t));
  rect(0, 0, 65, 65);
  popMatrix();

  //右上四角内円×２
  ellipse(100, -60, 50, 50);
  //fill(323, 78, 100);
  ellipse(100, -60, 20, 20);  



  //左上二重枠
  noFill();
  ellipse(-30, -30, 130, 130);
  ellipse(-30, -30, 150, 150);

  //ハートビート
  heart(-30, -20, 100-5*sin(hb/2), 90-5*sin(hb/2));
  heart(-30, -20, 80-5*sin(hb/2), 70-5*sin(hb/2));

  //右下枠
  ellipse(73, 33, 75, 75);
  ellipse(73,33,70,40);
  fill(323, 78, 100);
  ellipse(73,33,20,20);
  noFill();

  //中央枠
  ellipse(9, 82, 70, 70);
  fill(323, 78, 100);
  ellipse(9+20*sin(ce),82+20*cos(ce),10,10);
  ellipse(9+20*cos(ce),82+20*sin(ce),10,10);
  ellipse(9+20*cos(ce+15),82+20*sin(ce+15),10,10);
  ellipse(9+20*cos(ce+96),82+20*sin(ce+96),10,10);
  noFill();
  ellipse(9,82,13,13);
  ce += 0.1;

  //左下枠
  ellipse(-58, 73, 50, 50);
  line(-83,73,-33,73);
  line(-68,83,-48,63);
  line(-68,63,-48,83);

  //最小枠
  ellipse(-97, 45, 33, 33);
  ellipse(-97, 45, ms, ms);
  ellipse(-97, 45, 3, 3);
  ms += 2;
  if (ms > 33) {
    ms = 0;
  }

  t += 2;
  hb++;
  fls += 0.2;

  filter(BLUR, 1.5);
}


//http://blog.p5info.com/?p=28
//Thanks!
void heart(float centerX, float centerY, float width, float height) {
  final float WIDTH = width / 2 * 0.85;
  final float HEIGHT = height / 2;
  final float OFFSET = centerY - (HEIGHT / 6 * 5);
  beginShape();
  for (int i = 0; i < 30; i++) {
    float tx = abs(sin(radians(i * 12))) * (1 + cos(radians(i * 12))) * sin(radians(i * 12)) * WIDTH + centerX;
    float ty = (0.8 + cos(radians(i * 12))) * cos(radians(i * 12)) * HEIGHT + OFFSET;
    vertex(tx, ty);
  }
  endShape(CLOSE);
}

