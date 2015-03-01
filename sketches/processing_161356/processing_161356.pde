
void setup() {
  size(200, 200);    //设置窗口大小为，宽200像素，高200像素
  background(255);   //设置背景颜色为白色，255=白色
  smooth();          //设置成抗锯齿
}

void draw() {
  //设置绘制椭圆和四边形方式为CENTER
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //绘制身体
  stroke(0);
  fill(150);
  rect(100, 100, 20, 100);
  
  //绘制头部
  fill(255);
  ellipse(100, 70, 60, 60);
  
  //绘制眼睛
  fill(0);
  ellipse(81, 70, 16, 32);
  ellipse(119, 70, 16, 32);
  
  //绘制腿
  stroke(0);
  line(90, 150, 80, 160);
  line(110, 150, 120, 160);
}
