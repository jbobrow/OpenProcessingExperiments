
// Day6 Q6
/*
【目コピ問題】次の未完成プログラムは、
10 枚の 32X32 の大きさの PNG ファイルを
ランダムに表示することで、宇宙空間のような表示結果 
を得るプログラムです。読み込む画像ファイル名は 
space0.png~ space9.png となっており、
bgID の各要素にはどの画像ファイルを表示 
するかの示す 0~9 までの数字のどれかが入っている。
なお、画像ファイルは
 http://www.sato-lab.jp/imfu2013/sampledata
に入っている。
*/

PImage[] bgImages; // 画像情報
int[][] bgID; // どの画像を表示するかを決めている配列
void setupBackground(){
  bgImages = new PImage[10];
  for(int i=0;i < 10;i++){
//    bgImages[i] = loadImage("space"+i+".png"); 
    bgImages[i] = loadImage("http://www.sato-lab.jp/imfu2013/sampledata/space"+i+".png"); //web version
  }
  bgID = new int[10][15]; //(a),(b) 
  for(int i=0;i<10;i++){ // (c) 
    for(int j=0;j<15 ;j++){ // (d) 
       bgID[i][j] =int(random(10));//(e),(f)

    } 
  }
}
void setup(){
  size(320,480);
  setupBackground(); 
}

void draw(){
  background(255);
  for(int x=0;x<width/32;x++){ // (g) 10
    for(int y=0;y<height/32;y++){ // (h) 15 
      image(
        bgImages[bgID[x][y]], // (i),(j)
        32*x, 32*y);//(k),(l)
    } 
  }
}
