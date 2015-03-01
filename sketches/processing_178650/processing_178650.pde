
////////////////////////////////////////////
//  random walker
////////////////////////////////////////////

Walker w;
int flag;  //ランダムウォーカのフラグ
int style; //ランダムウォーカの形
float rx;  //円の横幅(x方向)
float ry;  //円の縦幅(y方向)
/////
void setup(){
  size(640,360);     //ウィンドウサイズ
  colorMode(HSB);    //色指定はHSBモード
  flag = 0;          //フラグを初期化
  style = 1;
  w = new Walker();  //オブジェクト w の生成
  background(255);   //背景は白
}
/////
void draw(){
  w.step();          //オブジェクト w に歩かせる
  w.display();       //オブジェクト w に自分を表示してもらう
  //次第に前のオブジェクトが薄くなるように
  fill(255, 0, 255, 5);
  rect(0, 0, 640, 360);
}
/////
///// クラス定義
class Walker{
  float x;      //状態変数
  float y;      //状態変数
  float tx, ty; //パーリンノイズ用
  
  Walker(){
    tx = 0;
    ty = 10000;
  }
  void display(){ //表示用メソッド
    fill(tx*100%256,255,255);  //色指定
    if(style == 0){
      rect(x, y, rx, ry);      //四角形を描画
    }else if(style == 1){
      ellipse(x, y, rx, ry);   //円を描画
    }
  }
  void step(){    //「歩く」メソッド
    x = map(noise(tx), 0, 1, 0, width);  //パーリンノイズ
    y = map(noise(ty), 0, 1, 0, height); //パーリンノイズ
    tx += 0.01;
    ty += 0.01;
    
    //フラグに応じて処理
    if(flag == 0){  //restart
      rx = 20;
      ry = 20;
    }else if(flag == 1){
      rx += 0.5;
    }else if(flag == 2){
      ry += 0.5;
    }else if(flag == 3){
      rx -= 0.5;
    }else if(flag == 4){
      ry -= 0.5;
    }else if(flag == 5){
      rx += 0.5;
      ry += 0.5;
    }else if(flag == 6){
      rx -= 0.5;
      ry -= 0.5;
    }else if(flag == 7){
      flag = int(random(0,7));  //flagをランダムで変化
    }
  }
}

void keyPressed(){
  if(key == 'r'){        //rが押されたら
    flag = 0;
  }else if(key == 'j'){  //jが押されたら
    flag = 1;
  }else if(key == 'f'){  //fが押されたら
    flag = 2;
  }else if(key == 'k'){  //kが押されたら
    flag = 3;
  }else if(key == 'd'){  //dが押されたら
    flag = 4;
  }else if(key == '0'){  //0が押されたら
    style = 0;
  }else if(key == '1'){  //1が押されたら
    style = 1;
  }
}

void mousePressed(){
  if(mouseButton == RIGHT){         //右クリックで
    flag = 5;
  }else if(mouseButton == LEFT){    //左クリックで
    flag = 6;
  }else if(mouseButton == CENTER){  //ホイールをクリックで
    flag = 7;
  }
}
/////
