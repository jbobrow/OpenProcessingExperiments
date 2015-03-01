
 int v, w, x, y, z; //四角形の高さと幅
 
void setup() {
  size(400, 400);
  noStroke();
  smooth();
  fill(0);
  background(0);  
}
 
void draw() {
  fill(0);
  rect(400, 0, -v, v);  //右上の黒い四角形
  fill(0,0,random(100,255),80);
  rect(0, 0, w, w);  //左上の青い四角形
  fill(0,random(100,255),0,80);
  rect(400, 400, x, x);  //右下の緑の四角形
  fill(random(100,255),0,0,80);
  rectMode(CENTER);  //真ん中の赤い四角形
  rect(200, 200, y, y);
  fill(255,255,random(0,255),80);
  rect(0, 400, z, -z);  //左下の黄色い四角形
}

void keyPressed(){
  switch(key){
    case 'z':  //黒い四角形を大きくする
      v += 5;
      println("z");
      break;
    case 'a':  //確定
      w = 0;
      x = 0;
      y = 0;
      z = 0;
      println("a");
      break;
    case 'b':  //青の四角形を大きくする
      w += 5;
      println("b");
      break;
    case 'g':  //緑の四角形を大きくする
      x -= 5;
      println("g");
      break;
    case 'r':  //赤の四角形を大きくする
      y += 5;
      println("r");
      break;
    case 'y':  //黄の四角形を大きくする
      z += 5;
      println("y");
      break;
    case '1':  //青の四角形を小さくする
      w -= 5;
      println("1");
      break;
    case '2':  //緑の四角形を小さくする
      x += 5;
      println("2");
      break;
    case '3':  //赤の四角形を小さくする
      y -= 5;
      println("3");
      break;
    case '4':  //黄の四角形を小さくする
      z -= 5;
      println("4");
      break;
    }
}


 




