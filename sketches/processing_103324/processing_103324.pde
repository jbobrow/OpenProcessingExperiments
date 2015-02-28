
ball [] ball = new ball[70];

void setup() {
  size(800, 800);
  smooth();
  noStroke();

  for (int i = 0; i<ball.length; i++) {
    ball[i] = new ball(i);
  }
}

void draw() {
  background(250);

  force();
  bigball();

  for (int i = 0 ;i <ball.length; i++) {
    ball[i].looking();
  }
}

//----------------------------------------------------------------------------------------------

void bigball() {  //大球

  if (mousePressed) {
    fill(250, 50, 50);
    ellipse(mouseX, mouseY, 50, 50);
  }
  else {
    fill(50, 50, 255);
    ellipse(mouseX, mouseY, 50, 50);
  }
  for (int i = 0; i < ball.length; i++) {         //定義斥力

    if (mousePressed && (sq(mouseX - ball[i].Bx) + sq(mouseY - ball[i].By)) < 30000) {
      ball[i].fbx = -(ball[i].kk)*(mouseX - ball[i].Bx) / (sqrt(sq(mouseX - ball[i].Bx) + sq(mouseY - ball[i].By)));
      ball[i].fby = -(ball[i].kk)*(mouseY - ball[i].By) / (sqrt(sq(mouseX - ball[i].Bx) + sq(mouseY - ball[i].By)));
    }
    else if ((sq(mouseX - ball[i].Bx) + sq(mouseY - ball[i].By)) < 30000) {
      if ((sq(mouseX - ball[i].Bx) + sq(mouseY - ball[i].By)) != 0) {      
        ball[i].fbx = (ball[i].kk)*(mouseX - ball[i].Bx) / (sqrt(sq(mouseX - ball[i].Bx) + sq(mouseY - ball[i].By)));
        ball[i].fby = (ball[i].kk)*(mouseY - ball[i].By) / (sqrt(sq(mouseX - ball[i].Bx) + sq(mouseY - ball[i].By)));
      }
    }
  }
}

//--------------------------------------------------------------------------------------------

void force() {   //小球作用力
  for (int i=0; i<ball.length; i++) {
    for (int j=0; j<ball.length; j++) {

      if (mousePressed && (mousePressed && (sq(mouseX - ball[i].Bx) + sq(mouseY - ball[i].By)) < 30000)) {
      }
      else if ((sq(ball[j].Bx-ball[i].Bx) + sq(ball[j].By-ball[i].By)) < 10000) {        
        ball[i].lx = (ball[j].Bx-ball[i].Bx);
        ball[i].ly = (ball[j].By-ball[i].By);
        ball[i].l = sqrt(sq(ball[i].lx) + sq(ball[i].ly));

        if (ball[i].l != 0) {
          ball[i].fx += ball[i].k  * ((ball[i].lx) / (ball[i].l)) / (sq(ball[i].l));
          ball[i].fy += ball[i].k  * ((ball[i].ly) / (ball[i].l)) / (sq(ball[i].l));
        }
        else {
          ball[i].fx += 0;
          ball[i].fy += 0;
        }
      }
    }
  }
}

//--------------------------------------------------------------------------------------------

class ball {

  float rx;  //隨機初始座標
  float ry;
  float vx;  //球速度
  float vy;
  float lx;  //球距離
  float ly;
  float l;
  float fx;  //球作用力
  float fy;
  float fbx;  //大球作用力
  float fby;
  float Bx;   //球座標
  float By;
  int num;  //球編號
  float k;   //小球磁力常數
  float kk;  //大球磁力常數
  float maxspeed;  //最大速度

  ball(int i) {
    rx = random(11, 789);
    ry = random(11, 789);
    vx = random(-10, 10);
    vy = random(-10, 10);
    num = i;
    k = 1000;
    kk = 5;
    Bx = rx;
    By = ry;
    maxspeed = 30;
  }

  void looking() {
    fill(70, 30, 240, 100);   
    ellipse(Bx, By, 20, 20);

    vx=(vx - fx - fbx)*0.95;
    vy=(vy - fy - fby)*0.95;

    if (Bx>=790) {          //邊緣反彈
      vx = -abs(vx);
    }
    else if (Bx<=10) {
      vx = abs(vx);
    }   

    if (By>=790) {         
      vy = -abs(vy);
    }
    else if (By<=10) {
      vy = abs(vy);
    }

    if (abs(vx) > maxspeed) {          //限制最大速度
      vx = maxspeed * (vx/abs(vx));
    }

    if (abs(vy) > maxspeed) {
      vy = maxspeed * (vy/abs(vy));
    }

    Bx += vx;
    By += vy;

    fx = 0;
    fy = 0;
    lx = 0;
    ly = 0;
    l = 0;
    fbx = 0;
    fby = 0;
  }
}


