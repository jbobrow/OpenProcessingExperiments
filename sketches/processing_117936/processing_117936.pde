
float x, y ;    // キャラの座標
float vx, vy ;  // キャラの速度
float ay ;      // 垂直方向の加速度

// setupはRUNした最初だけ実行される
void setup() {
  size(600, 600) ;
  //x = width/2 ;
  //y = height/2 ;
  x=0;
  y=300;
  vx = 4 ;
  vy = 3 ;
  ay = 0.5 ;
}

// drawはRUNしている間繰り返し実行される
void draw() {
  // 背景の塗りつぶし
  background(101, 214, 56) ;
  //cloud
  noStroke();
  fill(110,221,255);
  rect(0,0,600,450);
  stroke(0,0,0);
  
  //cloud
  noStroke();
  fill(255,255,255);
  ellipse(40,150,70,50);
  ellipse(55,170,70,50);
  ellipse(55,140,70,50);
  ellipse(75,150,70,50);
  ellipse(100,180,70,50);
  ellipse(120,140,70,50);
  ellipse(140,170,70,50);
  //cloud
  ellipse(560,250,70,50);
  ellipse(545,220,70,50);
  ellipse(520,270,70,50);
  ellipse(520,220,70,50);
  ellipse(500,230,70,50);
  ellipse(480,250,70,50);
  ellipse(480,220,70,50);
  stroke(0,0,0);
  

  //leaf back
  stroke(51,128,20);
  line(285,560,285,530);
  stroke(0,0,0);
  //flower
  fill(255,187,0);
  ellipse(285,530,15,15);
  ellipse(293,522,15,15);
  ellipse(285,512,15,15);
  ellipse(277,522,15,15);
  fill(255,255,0);
  ellipse(285,521,15,15);
  fill(51, 128, 20);
  stroke(0,0,0);
  triangle(250, 560, 285, 560, 265, 540);
  triangle(285, 560, 320, 560, 300, 540);
  fill(204, 255, 0);
  triangle(150, 520, 185, 520, 165, 500);
  triangle(185, 520, 220, 520, 202, 500);
  fill(51, 128, 20);
  triangle(350, 520, 385, 520, 365, 500);
  triangle(385, 520, 420, 520, 402, 500);
  pushMatrix();
  // キャラを描く
  chara(int(x), int(y)) ;

  // キャラの座標を移動する
  x = x + vx ;
  y = y + vy ;

  // ウィンドウの枠に当たったら跳ね返る
  
  // (キャラの幅や高さを考慮して、数値を調整してあります)
  if (x > 520) {     // 右の壁に衝突？
    vx = -vx ;
    x = 520 ;
  }
  if (x < 5) {      // 左の壁に衝突？
    vx = -vx ;
    x = 5 ;
  }
  if (y > 515) {     // 床に衝突？
    vy = -vy ;
    y = 515 ;
    vy = vy * 0.98 ;  // 床にぶつかったら減速
    vx = vx * 0.98 ;  // 床にぶつかったら減速
  }
  if (y < 40) {      // 天井に衝突？
    vy = -vy ;
    y = 40 ;
  }

  // 重力によって垂直方向の速度を変える
  vy = vy + ay ;

  // マウスボタンが押されているときの処理... 
  if (mousePressed) { // マウス押されてますか？
    if ((mouseX > x-50) && (mouseX < x+50) && (mouseY > y-50) && (mouseY <y+50)) { // マウスの座標がキャラのエリア内にある？
      // そうならば、キャラの座標をマウスと同じにする
      x = mouseX ;
      y = mouseY ;
      // 速度はゼロ（つまみ上げてるから）
      vx = 0 ;
      vy = 0 ;
       noStroke();
      fill(255,102,0);
      rect(0,0,600,450);
      stroke(0,0,0);
   //cloud
  noStroke();
  fill(255,205,171);
  ellipse(40,150,70,50);
  ellipse(55,170,70,50);
  ellipse(55,140,70,50);
  ellipse(75,150,70,50);
  ellipse(100,180,70,50);
  ellipse(120,140,70,50);
  ellipse(140,170,70,50);
  //cloud
  ellipse(560,250,70,50);
  ellipse(545,220,70,50);
  ellipse(520,270,70,50);
  ellipse(520,220,70,50);
  ellipse(500,230,70,50);
  ellipse(480,250,70,50);
  ellipse(480,220,70,50);
  stroke(0,0,0);
  fill(255,0,0);
  
  ellipse(285,530,15,15);
  ellipse(293,522,15,15);
  ellipse(285,512,15,15);
  ellipse(277,522,15,15);
  fill(255,255,0);
  ellipse(285,521,15,15);
  fill(0,0,0);
  text("I'm angry!!",487,243);
  text("I'm angry!!",60,160);
      chara2(int(x), int(y)) ;
      chara2(int(x-80),int(y));
      chara2(int(x+80),int(y));
     
    }
  }
  popMatrix();
  //leaf

  fill(51, 128, 20);
  triangle(5, 590, 40, 590, 20, 570);
  triangle(40, 590, 75, 590, 57, 570);
  fill(204, 255, 0);
  triangle(520, 590, 555, 590, 533, 570);
  triangle(555, 590, 590, 590, 570, 570);
  fill(51, 128, 20);
  triangle(5, 590, 40, 590, 20, 570);
  triangle(40, 590, 75, 590, 57, 570);
  
}

// マウスボタンが離された瞬間に実行される
void mouseReleased() {
  // 今のマウスの座標ー直前のマウスの座標によってマウスの速度を求める→キャラの速度とする
  vx = mouseX - pmouseX ;  
  vy = mouseY - pmouseY ;
  // とはいえ、あんまり速すぎるとなんなので制限してみる
  vx = vx * 0.3 ;
  vy = vy * 0.3 ;
}

void chara(int a, int b) {
  pushMatrix();

  translate(a, b);
  //body
  fill(255, 235, 3);
  ellipse(75, 73, 25, 25);
  fill(150, 23, 255);
  ellipse(57, 70, 30, 30);
  fill(255, 124, 15);
  ellipse(44, 55, 35, 35);
  //faceoutline
  //fill(map(mouseX,0,600,0,255),mouseY,0);
  fill(150, 23, 255);
  ellipse(35, 35, 45, 45);
  //eye
  fill(255, 185, 5);
  ellipse(25, 30, 7, 8);
  ellipse(45, 30, 7, 8);
  //mouse
  line(35, 48, 28, 45);
  line(35, 48, 42, 45);
  //ribon
  fill(255, 155, 185);
  pushMatrix();
  translate(40, 55);
  //scale(map(a, 0, 600, 0, 5));
  rotate(map(a,0,600,0,radians(3600))); //ugoku
  triangle(15, -10, 10, 8, 0, 0);
  triangle(-15, -7, -10, 10, 0, 0);
  // triangle(55, 45, 50, 63, 40, 55);
  //triangle(25, 48, 30, 65, 40, 55);
  //ellipse(40, 55, 5, 5);
  popMatrix();
  ellipse(40, 55, 5, 5);
  //mouse
  //line(35, 48, 28, 45);
  //line(35, 48, 42, 45);
  //hair
  line( 15, 15, 19, 19);
  line( 48, 15, 50, 12);
  //tail
  line(85, 65, 90, 60);
  fill(map(a, 0, 600, 0, 255), b, 0);
  ellipse(90, 60, 7, 7);

 
  popMatrix();
      
      
      
}

void chara2(int a, int b) {
  pushMatrix();

  translate(a, b);
  //body
  fill(255, 235, 3);
  ellipse(75, 73, 25, 25);
  fill(150, 23, 255);
  ellipse(57, 70, 30, 30);
  fill(255, 124, 15);
  ellipse(44, 55, 35, 35);
  //faceoutline
  //fill(map(mouseX,0,600,0,255),mouseY,0);
  fill(150, 23, 255);
  ellipse(35, 35, 45, 45);
  //eye
  fill(255, 185, 5);
  line(20, 25, 30, 30);
  line(50, 25, 40, 30);
  //mouse
  line(35, 40, 28, 45);
  line(35, 40, 42, 45);
  //ribon
  fill(255, 155, 185);
  pushMatrix();
  translate(40, 55);
  //scale(map(a, 0, 600, 0, 5));
  rotate(map(a,0,600,0,radians(3600))); //ugoku
  triangle(15, -10, 10, 8, 0, 0);
  triangle(-15, -7, -10, 10, 0, 0);
  // triangle(55, 45, 50, 63, 40, 55);
  //triangle(25, 48, 30, 65, 40, 55);
  //ellipse(40, 55, 5, 5);
  popMatrix();
  ellipse(40, 55, 5, 5);
  //mouse
  //line(35, 48, 28, 45);
  //line(35, 48, 42, 45);
  //hair
  line( 15, 15, 19, 19);
  line( 48, 15, 50, 12);
  //tail
  line(85, 65, 90, 60);
  fill(map(a, 0, 600, 0, 255), b, 0);
  ellipse(90, 60, 7, 7);

 
  popMatrix();
}


