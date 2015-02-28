
import processing.opengl.*;
class Wa {
 public float x, y;
 public int colTrig;
 public int lc;
 public int ls;
 public float rad;
 public color c;
 public color subC;
  Wa() {
    x=random(width+width)-width/2;
    y=random(height+height)-height/2;
    rad=0;
    lc=100;
    ls=(int)random(20)+20;
    c=color(random(100), random(95, 100), random(100));//colorburn用
  }
  void genkai() {
      big();
      ls-=1; //寿命
  }
  void big() {
    pg.strokeWeight(ls);
    pg.stroke(c);
    pg.noFill();
    pg.ellipse(x, y, rad, rad);
    rad+=6;
  }
}

PGraphics pg;
int trigger;
int rectsize=10;
int fc, cf;
int zure;
int zuretrig=1;
int mode=0;
color c;
ArrayList<Wa> was;
float count=0;
void setup() {
  size(200, 200);
  colorMode(HSB, 100);
  was=new ArrayList<Wa>();
  pg=createGraphics(200, 200, JAVA2D);
  pg.smooth();
  smooth();
}
void draw() {
  background(100);
  was.add(new Wa());//自動化
  for (int w=-rectsize; w<=width+rectsize; w+=rectsize*2) {
    for (int h=-rectsize; h<=height+rectsize; h+=rectsize*2) {
      fill(fc);
      noStroke();
      pushMatrix();
      translate(zuretrig*rectsize/2, 0);
      rect(w, h, rectsize, rectsize);
      rect(w+rectsize, h+rectsize, rectsize, rectsize);
      popMatrix();
    }
  }

  //println(pg.fill());
  pg.beginDraw();
  pg.pushMatrix();
  pg.background(fc);
  for (int i=0; i<was.size(); i++) {
    Wa w=was.get(i);
    w.genkai();
    if (w.ls<0)was.remove(i);
  }
  blendfunc();
  pg.popMatrix();
  pg.endDraw();
  if (frameCount%18==0) {
    zuretrig*=-1;
  }
  //  println(was.size());
}

void mousePressed() {
  int colTrg=(int)random(1, 5);
  trigger+=1;
  if (trigger%2==0) { //ここのスイッチ部分もっとうまい方法ないのか
    fc=0;
    cf=255;
  }
  else {
    fc=255;
    cf=0;
  }
}

void blendfunc() {
  switch(key) {
  case 'b': //blend　hsbだと高め
    blend(pg, 0, 0, width, height, 0, 0, width, height, BURN);
    break;
  case 'a': //add よくわかんないけど明るい
    blend(pg, 0, 0, width, height, 0, 0, width, height, ADD);
    break;
  case 's': //substract よくわかんないけど明るいしはっきりしてる
    blend(pg, 0, 0, width, height, 0, 0, width, height, SUBTRACT);
    break;
  case 'f': //darkest.重複できないし同時押しできないから くらいけど蛍光っぽいし背景抜いても動く
    blend(pg, 0, 0, width, height, 0, 0, width, height, DARKEST);
    break;
  case 'l': //lightest  正直addとの違いがわからん
    blend(pg, 0, 0, width, height, 0, 0, width, height, LIGHTEST);
    break;
  case 'd': //defference addとlightestと似てるどもっとサイケでどぎついし背景抜いてもわかる
    blend(pg, 0, 0, width, height, 0, 0, width, height, DIFFERENCE);
    break;
  case 'e': //exclusion 上のdefferenceの劣化版らしい
    blend(pg, 0, 0, width, height, 0, 0, width, height, EXCLUSION);
    break;
  case 'm': //multiply 正直darkestとの違いがわからん　背景抜いても動く
    blend(pg, 0, 0, width, height, 0, 0, width, height, MULTIPLY);
    break;
  case 'z': //screen.上と同じ理由による  zlaってどれも同じじゃね…？
    blend(pg, 0, 0, width, height, 0, 0, width, height, SCREEN);
    break;
  case 'r': //replace　rectが消えた…
    blend(pg, 0, 0, width, height, 0, 0, width, height, REPLACE);
    break;
  default:
    blend(pg, 0, 0, width, height, 0, 0, width, height, BURN);
    break;
  }
}


