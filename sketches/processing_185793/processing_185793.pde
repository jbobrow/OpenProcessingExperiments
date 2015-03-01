
int numBalls = 0;
Ball[] balls = new Ball[20];
float spring = 100;
int counter = 0;
int counter2 = 0;
int all_time = 150;

void setup(){
  size(600, 600);
  smooth();
  frameRate(60);
}

void draw(){//メインループ
  if(frameCount <= 60*all_time){
    design();
    if(frameCount % 180 == 0){
      if(numBalls < 20){
      circle();
     }
    }
    for (int i=0; i<numBalls; i++){
      balls[i].display();
      balls[i].moves();
      balls[i].bound();
      balls[i].collide();
      balls[i].extinc();
    }
  }
  else{
    println(1-counter/60/all_time);
    String score = str(1-counter/60/all_time); 
    text(score, width/2, height/2, 600, 600);
  }
}

void design(){//ボール以外のデザイン
  colorMode(HSB, 360, 100, 100);
  background(359, 0, 99);
  fill(230, 99, 99);
  ellipse(0, 0, 80*2, 80*2);
  ellipse(width, 0, 80*2, 80*2);
  ellipse(0, height, 80*2, 80*2);
  ellipse(width, height, 80*2, 80*2);
  int time = (all_time*60-frameCount)/60;
  String times = str(time);
  text(times, width/2, height/2, 600, 600);
}

class Ball{
  float posx, posy;  //ボールのx,y座標における位置
  float radi;  //ボールの直径
  float speedx, speedy;  //ボールのx,y方向におけるスピード(pixel / framerate)
  float clr;
  int idno; //ボール番号
  float mass;  //質量となるもの
  Ball[] others;  //ボール同士の衝突を判別するための何か
  
  Ball(float x, float y, float r, float sx, float sy, int id, float c, Ball[] o){
    posx = x;
    posy = y;
    radi = r;
    speedx = sx;
    speedy = sy;
    clr = c;
    idno = id;
    mass = radi * radi;
    others = o;
  }
  
  void display(){//ボールの表示
    colorMode(HSB, 100, 100, 100);
    fill(clr, 99, 99);
    ellipse(posx, posy, radi*2, radi*2);  
  }
  
  void moves(){//ボールの挙動
    posx += speedx;
    posy += speedy;
  }
  
  void bound(){//ボールの壁面判定および反射
    if(posx + radi >= width){
      speedx = -speedx;
      posx = width -radi;
    }
    if(posy + radi >= height){
      speedy = -speedy;
      posy = height -radi;
    }
    if(posx - radi <= 0){
      speedx = -speedx;
      posx = radi;
    }
    if(posy - radi <= 0){
      speedy = -speedy;
      posy = radi;
    }
  }
  
  void collide(){//ボール同士の接触判定、及び挙動変更
    for(int i = idno + 1; i < numBalls; i++){
     float dx = others[i].posx - posx;
     float dy = others[i].posy - posy;
     float distance = sqrt(dx*dx + dy*dy);
     float critical = others[i].radi + radi;
     if(distance < critical){
       float force = spring * (critical - distance);
       float theta = atan2(dy, dx);
       float ax = -force * cos(theta) / mass;
       float ay = -force * sin(theta) / mass;
       speedx += ax;
       speedy += ay;
       ax = force * cos(theta) / others[i].mass;
       ay = force * sin(theta) / others[i].mass;
       others[i].speedx += ax;
       others[i].speedy += ay;
     }
    }
  }
  
  void extinc(){//ゴールポスト接触条件？
    if(pow(80, 2 ) > pow(posx, 2) + pow(posy, 2) && key == '2' && keyPressed ){
      posx = 0;
      posy = 0;
      radi = 0;
      speedx = 0;
      speedy = 0;
      counter++;
    }
    if(pow(80, 2 ) > pow(posx-width, 2) + pow(posy, 2) && key == '1' && keyPressed ){
      posx = 0;
      posy = 0;
      radi = 0;
      speedx = 0;
      speedy = 0;
      counter++;
    }
    if(pow(80, 2 ) > pow(posx, 2) + pow(posy-height, 2) && key == '3' && keyPressed ){
      posx = 0;
      posy = 0;
      radi = 0;
      speedx = 0;
      speedy = 0;
      counter++;
    }
    if(pow(80, 2 ) > pow(posx-width, 2) + pow(posy-height, 2) && key == '4' && keyPressed ){
      posx = 0;
      posy = 0;
      radi = 0;
      speedx = 0;
      speedy = 0;
      counter++;
    }    
  }
 
}

void circle(){//ボールの各パラメータの決定
    float x = random(0,width);
    float y = random(0,height);
    float d = 15;
    float sx = random(-10, 10);
    float sy = random(-10, 10);
    float c = float(numBalls/20*100);
    balls[numBalls] = new Ball(x, y, d, sx, sy, numBalls, c, balls);
    numBalls++;
}

