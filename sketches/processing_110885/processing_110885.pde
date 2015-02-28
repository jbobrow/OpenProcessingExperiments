
float m = 50;      //三角形重心至頂點距離
float wm ;         //水平中心
float hm ;         //垂直中心
int released = 0;     //滑鼠點擊判斷    

ob [] o = new ob[5];

void setup() {
  size(600, 600, P3D);
  smooth();
  wm = m*cos(PI/6);
  hm = 2.5*m;
  noStroke();  

  for (int i = 0; i<o.length; i++) {
    o[i] = new ob();
  }
}

void draw() {
  first();
  firstcoby();
  arr();
  all();

  if (released == 1) {
    for (int i = 0; i<o.length; i++) {
      o[i].change();
      released = 0;
    }
  }
}

void triang() {    //最小單位三角形 
  fill(0);
  triangle(0, -m, m*cos(PI/6), m*sin(PI/6), -m*cos(PI/6), m*sin(PI/6));

  for (int i = 0; i<o.length; i++) {  //至少出現一個圖形
    if (i == (o.length - 1) && (o[0].w <=2) && (o[1].w <= 2) && (o[2].w <=2) && (o[3].w <=2)) {
      o[4].w = 5;
    }    

    if (o[i].w > 2) {
      o[i].looking();
    }
  }
}
void first() {    //原始六角形
  pushMatrix();            //0
  translate(wm, hm);
  triang();  
  popMatrix(); 

  pushMatrix();                //2
  translate(wm - m*cos(PI/6), hm - m*cos(PI/3));
  rotateY(PI);
  rotate(-PI/3);
  triang(); 
  popMatrix();

  pushMatrix();                //3
  translate(wm + m*cos(PI/6), hm - m*cos(PI/3));
  rotateY(PI);
  rotate(PI/3);
  triang(); 
  popMatrix();
}

void firstcoby() {
  pushMatrix();            //A
  rotateX(PI);
  translate(0, -2*hm + 2*m);
  first();  
  popMatrix();
}


void arr() {             //垂直排列
  for (int i = 1; i<=4; i++) {
    pushMatrix();
    translate(0, i*3*m);
    first();
    firstcoby();
    popMatrix();
  }
}


void all() {        //橫向排列
  for (int i = 1; i<=5; i++) {
    if (i%2 != 0) {
      pushMatrix();
      translate(i*3*m*cos(PI/6), -3*m/2);
      first();
      firstcoby();
      arr();  
      popMatrix();
    }
    else {
      pushMatrix();
      translate(i*3*m*cos(PI/6), 0);
      first();
      firstcoby();
      arr();  
      popMatrix();
    }
  }
}



class ob {  //圓圈
  float w;    //出場決定性參數
  float r;   //半徑
  float x1;   //位置
  float y1;
  float s1;    //速度
  float s2;
  float mx;    //滑鼠移動判斷
  float my;
  color c;
  float ang = 0;    //旋轉角度
  float n;           //旋轉角度增量
  float ran;         //圓、方塊判斷
  float side;        //縮減邊長
  float a;           //椭圓判斷
  float b;           //矩形判斷  
  float t;            //變色時間判斷
  int place = 0;         //是否置中判斷

  ob() {
    w = random(8);   //同時影響旋轉方向
    r = random(5, 30);
    x1 = 0;              
    y1 = 0;
    s1 = random(-0.5, 0.5);  
    s2 = random(-0.5, 0.5);
    mx = mouseX;          
    my = mouseY;
    c = color(random(50, 255), random(50, 255), random(50, 255), 200);
    ran = random(-1, 1);    
    side = random(2, r/2);
    a = random(-1, 1);
    b = random(-1, 1);
    t = random(100);
    n = random(0.1);
  }

  void looking() {

    fill(c);

    if (mouseX != mx || mouseY != my) {
      x1 += s1;
      y1 += s2;            
      t++;
      if (w > 4) {
        ang += n;
      }
      else {
        ang -= n;
      }
    }

    mx = mouseX;
    my = mouseY;

    if (t >= 100) {
      c = color(random(50, 255), random(50, 255), random(50, 255), 200);
      t = random(50);
    }

    if (sqrt(12*(sq((3*x1+sqrt(3)*y1+sqrt(3)*m)/-12))) <= r/2) {
      s1 = random(0.1, 0.5);
      s2 = random(0.1, 0.5);
      place = 1;
      n = random(0.1);
    }    
    else if (sqrt(12*(sq((-3*x1+sqrt(3)*y1+sqrt(3)*m)/12))) <= r/2) {
      s1 = -random(0.1, 0.5);
      s2 = random(0.1, 0.5);
      place = 1;
      n = random(0.1);
    }
    else if (((m/2)-y1) <= r/2 ) {
      s1 = random(0.1, 0.5);
      s2 = -random(0.1, 0.5);
      place = 1;
      n = random(0.1);
    }
    else {
      place = 0;
    }

    pushMatrix();
    translate(x1, y1);
    rotate(ang);
    rectMode(CENTER);

    if (ran > 0) {
      if (a > 0) {
        ellipse(0, 0, r, side);
      }
      else {
        ellipse(0, 0, r, r);
      }
    }
    else {
      if (b > 0) {
        rect(0, 0, r, side);
      }
      else {
        rect(0, 0, r, r);
      }
    }
    popMatrix();
  }

  void change () {   //重置圖形
    w = random(8);  
    ran = random(-1, 1);
    a = random(-1, 1);
    b = random(-1, 1);
    t = random(100);
    n = random(0.1);
    r = random(5, 30);
    if (place == 1) {
      x1 = 0;
      y1 = 0;
      s1 = random(-0.5, 0.5);
      s2 = random(-0.5, 0.5);
    }
  }
}

void mouseReleased() {
  released = 1;
}


