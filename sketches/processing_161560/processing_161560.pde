
float zoogX;  //保存Zoog的x轴坐标
float zoogY;  //保存Zoog的y轴坐标

float eyeR;  //保存Zoog的红颜色值，范围是（0-255）
float eyeG;  //保存Zoog的绿颜色值，范围是（0-255）
float eyeB;  //保存Zoog的蓝颜色值，范围是（0-255）
             //（红，绿，蓝）-> (R,G,B)
   
int moveDirection;  //保存上下移动方向
                    //moveDirection =  1时向下移动
                    //moveDirection = -1时向上移动
void setup() {
  size(200, 200);
  zoogX = width / 2;   //设置起始x轴坐标为水平中间，这里的width是屏幕的宽度
  zoogY = height;      //设置起始y轴坐标为最下面，这里的height是屏幕的高度
  moveDirection = -1;  //设置起始运动方向为向上移动
  smooth();
}

void draw() {
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //身体
  stroke(0);
  fill(150);
  rect(zoogX, zoogY, 20, 100);
  
  //头部
  stroke(0);
  fill(255);
  ellipse(zoogX, zoogY-30, 60, 60);
  
  //眼睛
  eyeR = random(255);     //获取（0-255）之间的随机值
  eyeG = random(255);     //获取（0-255）之间的随机值
  eyeB = random(255);     //获取（0-255）之间的随机值
  fill(eyeR, eyeG, eyeB); //实现眼睛填充随机颜色
  
  ellipse(zoogX-19, zoogY-30, 16, 32);
  ellipse(zoogX+19, zoogY-30, 16, 32);
  
  //legs
  stroke(150);
  line(zoogX-10, zoogY+50, zoogX-10, height);
  line(zoogX+10, zoogY+50, zoogX+10, height);
  
  if (zoogY < 0)            //当移动到上端改变方向
    moveDirection = 1;
  else if (zoogY > height)  //当移动到下端改变方向
    moveDirection = -1;
 
  zoogY = zoogY + moveDirection; //根据移动的方向进行移动
}
