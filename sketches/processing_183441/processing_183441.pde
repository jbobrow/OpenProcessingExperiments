
int eSize = 5;

void setup(){
  background(255);
  size(500,500);
  PImage img;           //画像を格納するための変数（PImage型）
  img = loadImage("g3.png");    //ファイルから画像を読んで、imgに格納
  image(img, 0, 0);     //画像を表示（画像の変数名, 左上のx座標, 左上のy座標)
  noStroke();                         //ふちを消す。
  fill(64,64,64);
}

void draw(){
  //background(255);
}

void mouseDragged(){
  rect(mouseX,mouseY,8,8);
}

//何らかのキーが押された時に実行される
void keyPressed() {
  switch(key) {
    case 'q':
      fill(208,192,176);
            break;
    case 'w':
      fill(192,160,128);
            break;
    case 'e':
      fill(128,96,96);
            break;
    case 'r':
      fill(112,96,96);
            break;
    case 't':
      fill(96,80,64);
            break;
    case 'a':
          fill(255,64,64);
            break;
    case 's':
          fill(64,224,64);
            break;
    case 'd':
          fill(64,96,255);
            break;
    case 'f':
           fill(255,224,64);
            break;
    case 'g':
           fill(160,96,96);
            break;
    case 'z':
               fill(64,64,64);
            break;
    case 'x':
               fill(255,255,255);
            break;
    case 'c':
               fill(144,128,128);
            break;
    case 'v':
               fill(255,0,255);
            break;
    case 'b':
      PImage img;           //画像を格納するための変数（PImage型）
        img = loadImage("g3.png");    //ファイルから画像を読んで、imgに格納
      image(img, 0, 0);     //画像を表示（画像の変数名, 左上のx座標, 左上のy座標)
            break;

  }
}


