
//Day 9 Q7
int score;
int rx,ry,d;
PFont font;
void setup() {
  size(400,400);  smooth();
  font  = loadFont("Aharoni-Bold-48.vlw");
  textFont(font,48);
  textAlign(CENTER);
  score = 0;  d  = 100;
  rx = width/2; ry= height/2;
}

void draw() {
  boolean hit=false;
  if (mousePressed) {  //クリックされたら、あたり判定チェック！
   if ((mouseX>rx-d)&&(mouseX<rx+d)) { //横方向はあってる
     if ((mouseY>ry-d)&&(mouseY<ry+d)) { //縦方向もあってる
        hit = true;
     }
   } 
   if (hit) {
     score++;
    background(10);    //画面をきれいに
    text("Score:"+str(score),100,50);
    //ランダムな位置に丸を書くぞ
    rx = (int)random(width);
    ry = (int)random(height);
    ellipse(rx,ry,d,d);
   } 
  }
}
