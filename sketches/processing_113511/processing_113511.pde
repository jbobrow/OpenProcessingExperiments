
size(800, 800);
noStroke();
smooth();

//背景のを決める
color c1 = color(34, 216, 234);
color c2 = color(5, 74, 151);
color gradation;

//1と2の色の差をとってスケールを変える計算
float gr = (red(c2) - red(c1)) / height;
float gg = (green(c2) - green(c1)) / height;
float gb = (blue(c2) - blue(c1)) / height;
float r, g, b;

//グラデーションを描く
for(int y = 0; y < height; y++){
  r = y * gr + red(c1);
  g = y * gg + green(c1);
  b = y * gb + blue(c1);
  
  gradation = color(r, g, b);
  
  for(int x = 0; x < width; x++){
    fill(gradation);
    rect(x, y, 1, 1);
  }
}

for(int y = 100; y >= 0; y--){
  for(int x = 0; x < width; x++){
    fill(255, 100-y);
    rect(x, y, 1, 1);
  }
}

//気泡を描く
for(int i = 0; i < 20; i++){
  float eSize = random(50, 150);
  ellipse(random(width), random(height), eSize, eSize);
}

//差し込む光
for(int i = 0; i < 6; i++){
  float pos = random(width);
  float lightWidth = random(50, 150);
  for(int y = 500; y >= 0; y--){
    for(float x = pos; x < pos + lightWidth; x++){
      fill(255, 255 - y * 255 / 500);
      rect(x, y, 1, 1);
    }
  }
}


