
float[][] eSize = new float[3][5];    //円のサイズ
float[][]eColor = new float[3][5];    //ここは円の色
float[][] speed = {{0.5, 0.5, 0.5, 0.5, 0.5},    //円の拡大縮小のスピード
                   {0.5, 0.5, 0.5, 0.5, 0.5},
                   {0.5, 0.5, 0.5, 0.5, 0.5}};
float minSize = 1.0;     //円のサイズの最小値
float maxSize = 100.0;    //円のサイズの最大値
 
 
void setup() {
  size(400, 200);
  background(255);
  smooth();
  noStroke();
  fill(0);
  rectMode(CENTER);//rectモードをもう一度質問する
 
  for(int y = 0; y < 3; y++){    //円のサイズを最小値に設定    
    for(int x = 0; x < 5; x++){
      eSize[y][x] = minSize;
      eColor[y][x] = 0;
      
    }
  }
}
 
void draw() {
  background(100);
  for(int y = 0; y < 3; y++){    //列方向    
    for(int x = 0; x < 5; x++){    //行方向
      eSize[y][x] += speed[y][x];    //円のサイズを変化させる
      //もし円のサイズが最大値を超えたか最小値未満になったら、方向を変える
      if(eSize[y][x] > maxSize || eSize[y][x] < minSize) speed[y][x] = -speed[y][x];
     if(eColor[y][x] > 255 || eColor[y][x] < 0)speed[y][x] = -speed[y][x];
     
     fill(0,eColor[y][x],255,127);
     rect(x*100, y*100, 100, 100);
     
     fill(0, eColor[y][x], 0, 127);
      ellipse(x*100, y*100, 100, 100);    
 
      fill(255, eColor[y][x], 0, 127);
      ellipse(x*100+50, y*100+50, 100, 100);  
     
      ellipse(100*x, 100*y, eSize[y][x], eSize[y][x]);    
    }
  }
}


