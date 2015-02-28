
int px;
int py;
int enemyx;
int enemyy;
int ammo;
int number=100;
int point;
int gamemode=1;

Eammo[] eammo=new Eammo[number];
Player player;

void setup() {
  size(500, 500);
  player=new Player();
  for (int i=0;i<number;i++) {
    eammo[i]=new Eammo();
  }
}
void draw() {
  if (point==1000) {
    player.c=player.c+10;
  }
  if (player.x>width) {
    point=point+10000;

    player.x=0;
    player.c=player.c+100;
  }
  background(255);


  enemyx=350;
  enemyy=90;
  fill(0);
  if (point<100) {
    text("必殺!MG3!!!", 350, 90);
    text("(一個だけスナイパーライフルがあります)", 340, 130);
    rect(enemyx, enemyy, 10, 10);
  }
  for (int i=0;i<number;i++) {
    eammo[i].display();
  }
  eammo[1].display();
  player.display();
  for (int i=0;i<number;i++) {
    if ((player.x+player.s>eammo[i].x)&&
      (player.x<eammo[i].x+eammo[i].s)&&
      (player.y+player.s>eammo[i].y)&&
      (player.y<eammo[i].y+eammo[i].s)) {

      gamemode=0;
    }
  }


  if (keyPressed&&gamemode;==0) {



    if (key=='r') {
      gamemode=1;

      point=0;
      player=new Player();
      for (int i=0;i<number;i++) {
        eammo[i]=new Eammo();
      }
    }
  }
}
class Eammo {
  int x, y;
  int s=3;
  int sp;
  int c;
  int k=5;
  Eammo() {
    x=int(random(width-50, width));
    y=int(random(0, height));
    sp=int(random(1, k));
    c=20-sp;
    fill(0);
  }
  void display() {
    text(point, 10, 10);  

    rect(x, y, s, s);
    if (gamemode==1) {
      x-=sp;


      if (x<0) {
        point+=1;
        x=width;
        y=int(random(0, height));
        sp=int(random(1, k));
      }
    }
    if (point==500) {
    }
  }
}
class Player {
  int x=1;
  int y=1;
  int s=10;
  int c=0;
  Player() {
  }
  void display() {
    if (gamemode==1) {
      if (keyPressed&(key==CODED)) {
        if (keyCode==LEFT) {
          x-=s/2;
        }
        else if (keyCode==RIGHT) {
          x+=s/2;
        }
        if (keyCode==UP) {
          y-=s/2;
        }
        else if (keyCode==DOWN) {
          y+=s/2;
        }
      }
    }
    if (y<0) {
      y=height;
    }
    if (y>height) {
      y=0;
    }
    if (x<0) {
      x=0;
    }
    fill(c);
    rect(x, y, s, s);
  }
}

