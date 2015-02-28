
PImage tree, bluewing, pinkwing, bird, bird2;

void setup() {
size(1024, 768);
noLoop(); //繰り返し無しを設定
colorMode(HSB, 360, 256, 256);
background(360);
noStroke(); //枠無し設定
smooth(); //なめらか設定
rectMode(CENTER);
//画像ファイル設定
tree = loadImage("ptree.png");
bluewing = loadImage("blue-wing.png");
pinkwing = loadImage("pink-wing.png");
bird = loadImage("bird.png");
bird2 = loadImage("bird2.png");
}

void draw(){
  pushMatrix();
  //背景
  for(int i = 0; i < 1200; i++) {
    drawGreen(0, 0 , random(20, 100));
  }
  filter(BLUR, 2); //ぼかし
  //雑草(下部)
  for(int i = 0; i < 2000; i++) {
    drawGrass(0, 0, random(5, 30));
  }
  //羽
  for(int i = 0; i < 20; i++){
    drawBwing(random(width), random(height)); //羽(水色)
    drawPwing(random(width), random(height)); //羽(ピンク)
  }
  filter(BLUR, 1); //ぼかし
  pushMatrix();
  scale(0.8); //羽の大きさを0.8倍
  for(int i = 0; i < 30; i++){
  drawBwing(random(width), random(height)); //羽(水色)
  drawPwing(random(width), random(height)); //羽(ピンク)
  } 
  
  //木々
  popMatrix();
  drawTree(300, 50, 500); //一番奥の木
  scale(1.2);
  drawTree(180, 80, 450);
  scale(1.2);
  drawTree(100, 110, 400);
  scale(1.2);
  drawTree(30, 140, 350); //一番手前の木

  //鳥
  popMatrix();
  for(int i = 0; i < 10; i++){
    scale(random(0.8, 1.0));
    drawBird(random(-10, 1300), random(400));
    drawBird2(random(-10, 1300), random(400));
    pushMatrix();
    rotate(PI/6);  
    drawBird(random(-10, 1300), random(400));
    drawBird2(random(-10, 1300), random(400));
    popMatrix();
  }
  save("0812302.png");
}

//詳細設定↓↓
//背景
void drawGreen(int x, int y, float d) {
  pushMatrix();
  translate(random(width), random(height));
  rotate(random(PI/2));
  fill(random(100, 190), 255, random(150,255), 40);
  rect(x, y, d, d);
  popMatrix();
}
//雑草(下部)
void drawGrass(int x, int y, float d){
  pushMatrix();
  translate(random(width), random(500, 768));
  rotate(random(PI/2));
  fill(random(80, 100), 255, random(150,200), 40);
  rect(x, y, d, d);
  popMatrix();
}
//木々
void drawTree(float x, float y, float z){
  image(tree, x, y); //左側の木々の設定
  image(tree, z, y); //右側の木々の設定
}
//羽(水色)
void drawBwing(float x, float y){
  image(bluewing, x, y);
}
//羽(ピンク)
void drawPwing(float x, float y){
  image(pinkwing, x, y);
}
//鳥(上向き)
void drawBird(float x, float y){
  image(bird, x, y);
}
//鳥(下向き)
void drawBird2(float x, float y){
  image(bird2, x, y);
}

