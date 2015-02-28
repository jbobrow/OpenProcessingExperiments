
float a1;
float a2;
float a3;

void setup(){
  size(500,500,P3D);
  smooth();
  noStroke();
}

void draw(){
  background(127);
  ellipseMode(CENTER); //矩阵中心模式
  pushMatrix(); //推矩阵，将当前旋转和坐标数据放入矩阵堆栈。
  translate(250,250);
  rotateZ(a1); //沿着 Z 轴旋转。
  fill(255,0,0);
  arc(0,0,400,400,0,PI/2);
  popMatrix(); //弹出矩阵，回到程序原始坐标系统。
  a1 -= 0.09; //增加旋转弧度
  
  pushMatrix(); //推矩阵
  translate(250,250);
  rotateZ(a2); //沿着 Z 轴旋转。
  fill(0,255,255);
  arc(0,0,300,300,0,PI/2);
  popMatrix(); //弹出矩阵
  a2 += 0.1; //增加旋转弧度
  
  pushMatrix(); //推矩阵
  translate(250,250);
  rotateZ(a3); //沿着 Z 轴旋转。
  fill(255,255,255);
  arc(0,0,250,250,0,PI/2);
  popMatrix(); //弹出矩阵
  a3 -= 0.3; //增加旋转弧度
}

