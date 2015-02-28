
size(500, 500);
colorMode(RGB, 255);
smooth();
background(255, 0, 0, 50);//背景赤
noStroke();
rectMode(CENTER);

for (int i = 0; i < 200; i++) {//200個の円
  pushMatrix();
  translate(random(width), random(height));
  fill(255, 15);//白半透明
  float d = random(10, 90);
  ellipse(0, 0, d, d);
  popMatrix();
}

//tane
int kaiten = 24;//回転角度
int x = 7;//座標移動量
translate(width / 2, height / 2);
for(int i = 0; i < 40; i++){
 fill(0);
 pushMatrix();
 rotate(radians(i * kaiten));
 translate(i * x, 0);
 ellipse(0, 0, 25, 25);
 popMatrix();
}

//green
int kaiten2 = 29;
int a = 7;
translate(0, 0);
for(int i = 0; i < 40; i++){
 fill(0, 255, 0, 100);
 pushMatrix();
 rotate(radians(i * kaiten2));
 translate(i * a, 0);
 ellipse(0, 0, 15, 15);
 popMatrix();
}
 save("sukika.png");



