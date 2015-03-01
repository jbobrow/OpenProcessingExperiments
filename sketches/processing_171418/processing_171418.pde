


int eSize = 7;

size(600, 300);
colorMode(RGB, 400);  //カラーモードの指定
background(0);  //背景色指定
noStroke();




for(int y = 0; y <=300; y += 40) { //300まで40ピクセルごとに繰り返す
  for (int x = 0; x <= 300; x += 40) {  //300まで40ピクセルごとに繰り返す
    
    stroke(400, 400, 400, 100);  //線の色を指定
    strokeWeight(2);  //線の太さを指定
    noFill();
    ellipse(150, 150, x, y);  //150の位置に横幅x立幅yの円を描画
  }
    
}

 
for( int i = 0; i < 9; i+=1 ) {  //iの値が9未満まで１づつ増える
  for( int j = 0; j < 20; j+=1 ) {  //jの値が9未満まで１づつ増える
 
    float X = 50 + j * 5;  //Xの値を50＋j＊5に指定
    float Y = 50 + i * 30;  //Yの値を50＋j＊30に指定
    
    
    stroke(400, 400, 400, 150);
    strokeWeight(2);
    ellipse( random( 100 ) + 400, random(100 )+ 100,
          X + random( 100 ),Y - random( 5 ));  //円の中心を0~100に指定し、横幅縦幅もそれぞれ指定
        
  }
}


