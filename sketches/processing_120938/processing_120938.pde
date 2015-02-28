

float x;
float y;
float easing = 0.1;
//同上動作 只是宣告另一組的變數與定值
float x1;
float y1;
float easing1 = 0.05;


 void setup()
{
  size(800,800);//畫板大小
  smooth();//將線變圓滑
  frameRate(30);//設定影格
}

void draw()
{
  ellipseMode(CENTER);//將橢圓中點設在滑鼠上
  rectMode(CENTER);//將矩形中點設在滑鼠上
  background(255);//設定背景白色
  
  //頭部部分
  //頭毛
  strokeWeight(2);//　　邊框設為2像素
  line(mouseX,mouseY-50,pmouseX,pmouseY-125);
  //頭型
  strokeWeight(1);
  stroke(1);
  fill(mouseY,150,mouseX); //RBG填色由滑鼠座標決定
  ellipse(pmouseX,pmouseY-50,70,100);
  //遮住多出來的橢圓
  noStroke();
  fill(255);
  rect(pmouseX,pmouseY-10,70,30);
  
  //五官部分
  //牙中間
  strokeWeight(1);
  stroke(1);
  fill(255);
  rect(pmouseX,pmouseY-15,10,20);
  //牙右邊1
  strokeWeight(1);
  stroke(1);
  fill(255);
  rect(pmouseX+10,pmouseY-15,10,20);
  //牙右邊2
  strokeWeight(1);
  stroke(1);
  fill(255);
  rect(pmouseX+20,pmouseY-25,10,20);
  //牙　右邊3
  strokeWeight(1);
  stroke(1);
  fill(255);
  rect(pmouseX+30,pmouseY-35,10,20);
  //牙左邊1
  strokeWeight(1);
  stroke(1);
  fill(255);
  rect(pmouseX-10,pmouseY-15,10,20);
  //牙左邊2
  strokeWeight(1);
  stroke(1);
  fill(255);
  rect(pmouseX-20,pmouseY-25,10,20);
  //牙左邊3
  strokeWeight(1);
  stroke(1);
  fill(255);
  rect(pmouseX-30,pmouseY-35,10,20);
  
  
  //左眼
  fill(1);
  ellipse(pmouseX-15,pmouseY-60,25,25);
  //右眼
  fill(1);
  ellipse(pmouseX+15,pmouseY-60,25,25);
  //左鼻
  fill(1);
  ellipse(pmouseX-5,pmouseY-40,5,10);
  //右鼻
  fill(1);
  ellipse(pmouseX+5,pmouseY-40,5,10);
  
  
  //身體
  fill(255);
  triangle(mouseX-35,mouseY,mouseX+35,mouseY,pmouseX,pmouseY+70);
  //身體直線
  line(mouseX,mouseY,pmouseX,pmouseY+70);
  //身體橫線下
  line(pmouseX-15,pmouseY+40,pmouseX+15,pmouseY+40);
  //身體橫線上
  line(pmouseX-25,pmouseY+20,pmouseX+25,pmouseY+20);
  
  //手部
  //左手上
  strokeWeight(1);
  line(mouseX-35,mouseY,pmouseX-55,pmouseY+55);
  //左手下
  strokeWeight(1);
  line(pmouseX-55,pmouseY+55,pmouseX-55,pmouseY+100);
  //右手上
  strokeWeight(1);
  line(mouseX+35,mouseY,pmouseX+55,pmouseY+55);
  //右手下
  strokeWeight(1);
  line(pmouseX+55,pmouseY+55,pmouseX+55,pmouseY+100);
  
  //下半身
  //骨盆
  strokeWeight(1);
  stroke(1);
  fill(255);
  rect(pmouseX,pmouseY+80,60,10);
  //左腳上
  strokeWeight(2);
  line(mouseX-25,mouseY+90,pmouseX-35,pmouseY+135);
  //左腳下
  strokeWeight(2);
  line(pmouseX-35,pmouseY+135,pmouseX-35,pmouseY+180);
  //右腳上
  strokeWeight(2);
  line(mouseX+25,mouseY+90,pmouseX+35,pmouseY+135);
  //右腳下
  strokeWeight(2);
  line(pmouseX+35,pmouseY+135,pmouseX+35,pmouseY+180);
  
  //眼珠部分
  //眼珠左
   float targetX = mouseX-15; //宣告targetX為浮點數並給予mouseX座標-15的值
   x += (targetX - x)*easing; //x不斷累加一個變數(targetX - x)*easing　直到targetX等於x 　造成漸進的效果
  float targetY = mouseY-60; //宣告targetY為浮點數並給予mouseY座標-60的值
   y += (targetY - y)*easing; //y不斷累加一個變數(targetY - y)*easing　直到targetY等於y 　造成漸進的效果
   ellipse(x,y,12,12);
   //眼珠右     //說明同上不同的是 　1.targetX1 = mouseX+15造成眼睛對稱　　2.變數變為x1,y1,targetY1,targetX1 3.定值則變easing1
   float targetX1 = mouseX+15;
   x1 += (targetX1 - x1)*easing1;
   float targetY1 = mouseY-60;
   y1 += (targetY1 - y1)*easing1;
   ellipse(x1,y1,12,12);
}

