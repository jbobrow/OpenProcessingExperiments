
/*
滑鼠左鍵拖曳可以噴出類似聖誕紅的顏色
鍵盤上任一鍵可以清除
參考自世鑫的作業二基本架構
及感謝符舜的解說
*/
//初始視窗
void setup() 
{
  //視窗大小
  size(600, 400);
  //背景顏色(R,G,B)或(灰階質)
  background(230);
  //不要邊框
  noStroke();
  //要邊框
  //stroke (255,0,0);
  //順邊
  smooth(); 
 //更新速率，原始為10
 //frameRate(8);
} 
//一次一次畫的東西
void draw() {
  //接下來畫什麼都要填(灰階,透明度)
  //fill(230, 5);
  //畫一個方塊從左上角畫整個螢幕的寬跟長
  //rect(0, 0, width, height);
} 
// 宣告一個函數叫做"當我拖曳滑鼠的時候"
void mouseDragged() 
//滑鼠動的時候
//void mouseMoved()
//滑鼠按下去的時候
//void mousePressed()
{
  //假如左鍵按下去的時候執行
  if (mouseButton == LEFT) {
    //star8函數裡面有三個數值
    star8(mouseX, mouseY, random(50));
  }
}
//star8函數裡面的三個數值又代表了以下 整數x 整數y 變數c
void star8(int x, int y, float c)
{
  //迴圈 宣告一個數值i 在小於八的規則下 他要+1 
  //在這裡是要畫八次的意思(因為i沒有被指定是什麼)
  for (int i=0; i<4; i++) 
  {
    //填滿顏色(R,G,B)
    fill(random(0,300), c, random(0,100), 50);
    //宣告ra的值為從0到20之間隨機的數(可以是小數) 
    float ra = random(0,20);
    //畫一個橢圓原心是x+-20,y+-20,長軸ra,短軸ra 
    ellipse(x+random(-20,20), y+random(-20,20), ra, ra);
  }
  //畫10次
  for(int j=0; j<20; j++) {
    //填滿(R,G,B,alpha)
    fill(random(0,5), random(0,100),c,  random(20, 40));
    //畫一個弧
    //curve(          random(-90,100),random(-400,600),          random(-300,600),random(-300,600),
    //      mouseX,mouseY,          mouseX+30,mouseY+50);
    //arc (mouseX,mouseY,random(0,100),random(0,100), PI/2, PI);
    float ra = random(0,20);
    float angel = random(TWO_PI);
    //ellipse(x+random(-50,50),y+random(-50,50), ra, ra);
    //讓噴出來的東西是圓形的所以要*cos(angel)
    ellipse(x+random(50)*cos(angel), y+random(50)*sin(angel), ra, ra);
  }
}
//鍵盤按下去的時候畫一個背景=清空
void keyPressed() {
  noStroke();
  background(230);
  //rect(0, 0, width, height);
}


