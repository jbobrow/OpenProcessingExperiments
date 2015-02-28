
class ChrBall {
  float x;
  float y;
  float speed;
  float w;
  
  ChrBall(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 10;
  }
  void move() {
    y = y - speed;
  }
  boolean finished() {
    if (y+w/2 < 0) return true; else return false;
  }
  
  void display() {
    fill(0,0,255);
    noStroke();
    rect(x,y,w,w);
  }
}

class Chrc {
  float x;
  float y;
  float w;
  float speed;
  int hp;
  int mhp;
  int mode;
  int mt;
  
  void SetAll(float Tx, float Ty, float Tw, float Ts, int Thp) {
    x = Tx; y = Ty; w = Tw; speed = Ts; hp = Thp; mhp = Thp; mode = 0; mt = 300;
  }
  
  void SetSpd(float Ts) {
    speed = Ts;
  }
  
  void display() {
    stroke(0,255,0);
    fill(0,int(255*hp/mhp),0);
    rect(chr1.x,chr1.y,chr1.w,chr1.w);
  }
}

class EBall {
  float x;
  float y;
  float speed;
  float w;
  
  EBall(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 5;
  }
  void move() {
    y = y + speed;
  }
  boolean finished() {
    if (y+w/2 < 0) return true; else return false;
  }
  
  void display() {
    noStroke();
    fill(255,0,0);
    rect(x,y,w,w);
  }
  
}

class Empnt {
  float x;
  float y;
  int t;
  String p;
  
  Empnt(float Tx, float Ty, String Tp) {
    x = Tx; y = Ty; p = Tp; t = 60;
  }
  
  void display() {
    fill(random(255),random(255),random(255));
    textSize(30);
    text(p,x-30,y);
    t --;
  }
  
  boolean finished() {
    if (t < 0) return true; else return false;
  }
}

class Enm {
  float x;
  float y;
  float w;
  int hp;
  int mhp;
  float Xsp;
  float Ysp;
  Enm(float Tx, float Tw,int Thp, float TXsp, float TYsp) {
    x = Tx; y = 0; w = Tw; hp = Thp; mhp = Thp;
    Xsp = TXsp; Ysp = TYsp;
  }
  void Emove() {
    x += Xsp;
    y += Ysp;
    if (x+w/2>width) Xsp *= -1;
    if (x-w/2<0) Xsp *= -1;
  }
  
  void Edisplay() {
    stroke(255);
    fill(int(255*hp/mhp));
    rect(x,y,w,w);
  }
  
}

class Itm {
  float x;
  float y;
  float w;
  float i;
  
  Itm(float Tx, float Ty, int Ti) {
    x = Tx; y = Ty; i = Ti; w = 15;
  }
  
  void display() {
    if (i == 0) fill(#F6FF00);
    if (i == 1) fill(#FF00F3);
    rect(x,y,w,w);
  }
  
  void move() {
    y += 2;
  }
  
}

ArrayList<ChrBall> balls;
ArrayList<Enm> enmys;
ArrayList<EBall> Eballs;
ArrayList<Empnt> Epoint;
ArrayList<Itm> Item;
Chrc chr1 = new Chrc();
int EffectTm = 0;
int EffectMd = 0;
int Point = 0;
int Combo = 0;
boolean CanPress = true;
float TmRnd = 0;

void Effect(color clr) {
  if (EffectTm > 0) {
    if (EffectTm%6 == 0 || EffectTm%6 == 1 || EffectTm%6 == 2) {
      rectMode(CORNER);
      fill(clr,225);
      rect(-1,-1,width+2,height+2);
    }
  }
  EffectTm --;
}

void setup() {
  size(360, 640);
  noStroke();
  rectMode(CENTER);
  balls = new ArrayList<ChrBall>();
  Eballs = new ArrayList<EBall>();
  enmys = new ArrayList<Enm>();
  Epoint = new ArrayList<Empnt>();
  Item = new ArrayList<Itm>();
  chr1.SetAll(width/2, height/1.1, 25, 5, 10);
  Epoint.add(new Empnt(-50,-50,""));
}

void draw() {
  rectMode(CENTER);
  //背景表示
  background(0);
  //自分の表示
  chr1.display();
  //敵関連
  for (int e = enmys.size()-1; e>=0; e--) {
    //敵の表示
    Enm enm = enmys.get(e);
    enm.Emove();
    enm.Edisplay();
    //敵の弾の出現
    float rnd = random(200);
    if (rnd < 1) {
      Eballs.add(new EBall(enm.x,enm.y+enm.w/2+5,10));
    }
    //自分の弾と敵のあたり判定
    for (int i = balls.size()-1; i >= 0; i--) {
      ChrBall ball = balls.get(i);
      if (ball.x-ball.w/2<enm.x+enm.w/2 && ball.x+ball.w/2>enm.x-enm.w/2) {
        if (ball.y-ball.w/2<enm.y+enm.w/2 && ball.y+ball.w/2>enm.y-enm.w/2) {
          enm.hp -= 1;
          if (enm.hp <= 0) {
            float rand = random(7);
            if (rand < 0.2) {
              Item.add(new Itm(enm.x,enm.y,0));
            } else if (rand<1) {
              Item.add(new Itm(enm.x,enm.y,1));
            }
            Epoint.add(new Empnt(enm.x, enm.y, 50*enm.mhp+Combo*10+""));
            Point += 50*enm.mhp+Combo*10;
            enmys.remove(e);
            Combo ++;
          }
          balls.remove(i);
        }
      }
    }
    //敵の弾と自分のあたり判定
    for (int i = Eballs.size()-1; i>= 0; i--) {
      EBall Eball = Eballs.get(i);
      if (Eball.x-Eball.w/2<chr1.x+chr1.w/2 && Eball.x+Eball.w/2>chr1.x-chr1.w/2) {
        if (Eball.y-Eball.w/2<chr1.y+chr1.w/2 && Eball.y+Eball.w/2>chr1.y-chr1.w/2) {
          chr1.hp -= 1;
          EffectTm = 18; EffectMd = 0;
          if (chr1.hp <= 0) {
            exit();
          }
          Eballs.remove(i);
        }
      }
    }
    //敵の場外消去
    if (enm.y-enm.w/2>height) {
      Combo = 0;
      enmys.remove(e);
    }
    //敵と自分のあたり判定
    if (enm.x-enm.w/2<chr1.x+chr1.w/2 && enm.x+enm.w/2>chr1.x-chr1.w/2) {
      if (enm.y-enm.w/2<chr1.y+chr1.w/2 && enm.y+enm.w/2>chr1.y-chr1.w/2) {
        chr1.hp -= 1;
        EffectTm = 18; EffectMd = 0;
        Combo = 0;
        if (chr1.hp <= 0) {
          exit();
        }
        enmys.remove(e);
      }
    }
  }
  //自分の弾
  for (int i = balls.size()-1; i >= 0; i--) {
    ChrBall ball = balls.get(i);
    ball.move();
    ball.display();
    if (ball.finished()) {
      balls.remove(i);
    }
  }
  //敵の弾
  for (int i = Eballs.size()-1; i >= 0; i--) {
    EBall Eball = Eballs.get(i);
    Eball.move();
    Eball.display();
    if (Eball.finished()) {
      Eballs.remove(i);
    }
  }
  //アイテム
  for (int i = Item.size()-1; i >= 0; i--) {
    Itm item = Item.get(i);
    item.move();
    item.display();
    if (item.x-item.w/2<chr1.x+chr1.w/2 && item.x+item.w/2>chr1.x-chr1.w/2) {
      if (item.y-item.w/2<chr1.y+chr1.w/2 && item.y+item.w/2>chr1.y-chr1.w/2) {
        //chr1.mode = item.i;
        if (item.i == 0) {
          EffectTm = 18; EffectMd = 1;
          for (int j = enmys.size()-1; j >= 0; j--) {
            enmys.remove(j);
          }
          for (int j = Eballs.size()-1; j >= 0; j--) {
            Eballs.remove(j);
          }
        }
        if (item.i == 1) {
          EffectTm = 18; EffectMd = 2;
          if (chr1.hp != chr1.mhp) chr1.hp ++;
        }
        Item.remove(i);
      }
    }
  }
  //敵を倒した際のポイント表示
  for (int i = Epoint.size()-1; i >= 0; i--) {
    Empnt Epnt = Epoint.get(i);
    Epnt.display();
    if (Epnt.finished()) {
      Epoint.remove(i);
    }
  }
  //弾の発射
  if (mousePressed) {
    if (CanPress) {
       balls.add(new ChrBall(chr1.x, chr1.y-17.5, 10)); CanPress = false;
    }
    TmRnd ++; if (TmRnd>=10) {
      CanPress = true; TmRnd = 0;
    }
  } else { 
    CanPress = true;
  }
  //キャラクターの移動
  if (chr1.x > mouseX) chr1.x -= chr1.speed;
  if (chr1.x < mouseX) chr1.x += chr1.speed;
  if (chr1.x+10 > width) chr1.x = width-10;
  if (chr1.x-10 < 0) chr1.x = 10;
  //敵の出現
  float rnd = random(150);
  if (rnd < 2) {
    int mhp = int(random(1,6));
    enmys.add(new Enm(random(10,width-10),15+3.75*mhp-3.75,mhp,random(3),random(1,2)));
  }
  //テストプレー用の完全消去
  if (keyPressed && key == 'x') {
    for (int i = enmys.size()-1; i >= 0; i--) {
      enmys.remove(i);
    }
    for (int i = Eballs.size()-1; i >= 0; i--) {
      Eballs.remove(i);
    }
  }
  //以下コーナーモード{
    rectMode(CORNER);
    //ダメージエフェクト
    if(EffectMd == 0) Effect(color(255,0,0));
    if(EffectMd == 1) Effect(color(246,255,0));
    if(EffectMd == 2) Effect(color(255,0,243));
    //コンボとポイントの表示
    fill(#FAE753);
    text(Combo+" COMBO\n"+Point+" POINT",20,140);
    //キャラクターのHP表示
    stroke(255);
    fill(0);
    rect(9,19,width-19,31);
    noStroke();
    fill(0,255,0);
    rect(10,20,float((width-20)/chr1.mhp*chr1.hp),30);
  //}
}
