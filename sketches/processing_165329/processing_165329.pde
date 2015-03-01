
////////////////////////////////////////////
//  random walker
////////////////////////////////////////////

/////
Walker w;            //「Walker型」の「変数」（オブジェクト） w の宣言
int t;
int r;
int v_x;
int v_y;
/////
void setup(){        //「前準備」
  size(640,360);
  w = new Walker();  // オブジェクト w の生成
  background(255);
}
/////
void draw(){         //「メイン関数」（無限ループ）
  fill(120,10);
  rect(0,0,width, height);
  
  w.step();          //オブジェクト w に歩かせる
  w.display();       //オブジェクト w に自分を表示してもらう
  drawPointer();
  drawTexts();
  t++;
}

void drawPointer (){
  stroke(255,0,0);
  noFill();
  ellipse(mouseX, mouseY, 5,5);
}

void drawTexts(){
  noStroke();
  fill(0);
  rect(0, height -40, width, 40);
  textSize(24);
  fill(0,255,0);
  text("time=" +t, width/2 + 150, height -8);
  text("(mouseX, mouseY)=("+ mouseX + ", " + mouseY + ")", 10, height -8);
}
/////
///// クラス定義
class Walker{ //クラス名の最初は大文字で
  int x;      //状態変数
  int y;      //状態変数
  Walker(){   //コンストラクタ（初期化のためのメソッド．new で呼び出される）
    x = width/2;  //窓の中心に
    y = height/2; //窓の中心に
  }
  void display(){ //表示用メソッド
    stroke(0);    //黒色に
    ellipse(x, y, 30,30);
    //point(x, y);  //座標(x, y)に点を描画
    
  }
  void step(){    //「歩く」メソッド    
    int choice = int(random(5)); // 0,1,2,3 のいずれか
    if(choice == 0){
      x++;
    }else if(choice == 1){
      x--;
    }else if(choice == 2){
      y++;
    }else if(choice == 3){
      y--;
    }else{
      v_x=(mouseX-x);
      v_y=(mouseY-y);
      // 距離
      x=x+v_x/10;
      y=y+v_y/10;
    }
  }
  
}
