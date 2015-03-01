
//forの繰り返しの表現が気に入ったので、安定と変動どちらにも使用しました。


int eSize = 8; //四角のサイズ
size(600, 300); //画面のサイズ
background(255); //背景色
//noStroke(); 

//10ピクセルごとに繰り返す
for (int y = 0; y <=300; y += 10) {
  for (int x = 0; x <=300; x += 10) {    

    stroke(x, y, 300, 100);
    fill(x, y, 180, 200);
    ellipse(x, y, eSize, eSize);
    fill(0);

    rect(0, y, eSize, eSize);
    rect(100, y, eSize, eSize);
    rect(200, y, eSize, eSize);
    rect(300, y, eSize, eSize);

    rect(x, 0, eSize, eSize);
    rect(x, 100, eSize, eSize);
    rect(x, 200, eSize, eSize);
    rect(x, 290, eSize, eSize);
  }
}

//10ピクセルごとに繰り返す
for (int y = 0; y <=600; y += 10) {
  for (int x = 350; x <=600; x += 10) {

    fill(10, 10, 50, 100);

    rect(10^x, 10^y, eSize, eSize);
    rect(20^x, 20^y, eSize, eSize);
    rect(30^x, 30^y, eSize, eSize);
  }
}


