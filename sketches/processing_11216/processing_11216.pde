
void setup() {
  size(500, 500);
  colorMode(HSB, 100);
  noStroke();
  noLoop();
  smooth();
}

void draw() {
  
  //すいか1
  for(int i = 0; i < 500; i++) {
    fill(5, 20, 100);
    float d = random(600);
    ellipse(random(width), random(height), d, d);
 }
  
  //すいか2
  for(int i = 0; i < 500; i++) {
    fill(4, 30, 100);
    float d = random(500);
    ellipse(random(width), random(height), d, d);
 }
  
  //すいか3
  for(int i = 0; i < 500; i++) {
    fill(3, 40, 100);
    float d = random(400);
    ellipse(random(width), random(height), d, d);
 }
  
  //すいか4
  for(int i = 0; i < 500; i++) {
    fill(2, 50, 100);
    float d = random(300);
    ellipse(random(width), random(height), d, d);
 }
  
  //すいか5
  for(int i = 0; i < 500; i++) {
    fill(1, 60, 100);
    float d = random(200);
    ellipse(random(width), random(height), d, d);
 }
  
  //すいかの種（黒）をランダムで配置
  for(int i = 0; i < 25; i++) {
    drawRandomblackseed(random(60, 420), random(0, 420), random(10, 20), random(20, 30));
 }
  
  //すいかの種（白）をランダムで配置
  for(int i = 0; i < 20; i++) {
    drawRandomwhiteseed(random(60,420), random(0, 420), random(10, 20), random(20, 30));
 }

  //すいかの種（大）＝目
  for(int i = 0; i < 2; i++) {
    drawRandomseed(random(125, 375), random(150, 160), 50, 60);
 }

  //すいかの皮＝口
  noFill();
  strokeWeight(25);
  stroke(50, 50, 50);
  arc(250, 255, 470, 470, 0, PI);

  save("0812034.png");//作品の画像ファイルを作成
}

//すいかの種（黒）
void drawRandomblackseed(float a, float b, float c, float d) {
  fill(1, 100);
  ellipse(a, b, c, d);
}

//すいかの種（白）
void drawRandomwhiteseed(float e, float f, float g, float h) {
  fill(99, 100);
  ellipse(e, f, g, h);
}

//スイカの種
void drawRandomseed(float i, float j, float k, float l) {
  fill(1, 100);
  ellipse(i, j, k, l);
}

