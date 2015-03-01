
void setup() {
  size(200, 200);    //设置窗口大小为，宽200像素，高200像素
  background(255);   //设置背景颜色为白色，255=白色
  smooth();          //设置成抗锯齿
  frameRate(30);     //设置为30帧，每秒绘制30次
}

void draw() {
  //首先将背景颜色设置成白色
  //之前的内容全部被白色覆盖
  background(255);
  
  //设置绘制椭圆和四边形方式为CENTER
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //绘制身体
  //mouseX -> 当前帧鼠标的x轴坐标
  //mouseY -> 当前帧鼠标的y轴坐标
  stroke(0);
  fill(150);
  rect(mouseX, mouseY, 20, 100);
  
  //绘制头部
  fill(255);
  ellipse(mouseX, mouseY-30, 60, 60);
  
  //绘制眼睛
  fill(0);
  ellipse(mouseX-19, mouseY-30, 16, 32);
  ellipse(mouseX+19, mouseY-30, 16, 32);
  
  //绘制腿
  //pmouseX -> 前一个帧鼠标的x轴坐标
  //pmouseY -> 前一个帧鼠标的y轴坐标
  stroke(0);
  line(mouseX-10, mouseY+50, pmouseX-10, pmouseY+60);
  line(mouseX+10, mouseY+50, pmouseX+10, pmouseY+60);
}
