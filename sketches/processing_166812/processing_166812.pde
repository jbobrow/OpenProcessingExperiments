
int[][] eSize = new int[5][5]; //サイズ
int[][] eColor = new int[5][5];　//色
int a = 3;
int b = 2;
int c = 1;
int[][] speed = {{c, b, a, b, c},　//速度
                {b, c, b, c, b},
                {a, b, c, b, a},
                 {b, c, b, c, b},
                {c, b, a, b, c}};
int minSize = 1;
int maxSize = 120;
 
 
void setup() {
  size(400, 400);
  background(255);
  smooth();
  noStroke();
  fill(255);
  rectMode(CENTER);

 
  for(int y = 0; y < 5; y++){
    for(int x = 0; x < 5; x++){
      eSize[y][x] = minSize;
    }
  }
}
 
void draw() {
  background(255);
  for(int y = 0; y < 5; y++){   
    for(int x = 0; x < 5; x++){
      eColor[y][x] += speed[y][x];　//色を変化させる

      if (eColor[y][x] > 255 || eColor[y][x] < 0) speed[y][x] = -speed[y][x];
 
      fill(50, eColor[y][x],  125, 70);　//色の指定
      eSize[y][x] += speed[y][x];　//サイズを変化させる
      
      if(eSize[y][x] > maxSize || eSize[y][x] < minSize) speed[y][x] = -speed[y][x];
    rect(100*x, 100*y, eSize[y][x], eSize[y][x]);　//四角を描画
    }
  }
}


