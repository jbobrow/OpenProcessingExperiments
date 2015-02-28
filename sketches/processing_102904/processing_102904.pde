
int _num = 5;
int count;
boolean pressR = false;
Collision[] _collArr = {};
Collision[] sub1 = {};

void setup(){
  size(700, 500);
  background(100);
  colorMode(HSB, 100);
  smooth();
  count = 0;
  textSize(10);
  strokeCap(SQUARE);
  noFill();
}

void draw(){
  background(100);
  for(int i=0; i<_collArr.length; i++){
    Collision thisColl = _collArr[i];
    thisColl.updataEffect();
  }
  fill(0);
  text(count,width-20,15);
//  if(frameCount<200)saveFrame("output/sequenceINPUCT_####.tif");
}

void mouseReleased(){
  drawEffect();
  count++;
}
void keyPressed(){
  if(key == 'r' || key == 'R')pressR = true;
}

void drawEffect(){
  for(int i=0; i<_num; i++){
    Collision thisColl = new Collision();
    _collArr = (Collision[])append(_collArr, thisColl);
    }
    if(count == 30 || pressR == true){ //なぜかr押しても止まらず、直後マウス押すと止まる
      reverse(_collArr);
      sub1 = (Collision[])subset(_collArr, 0, 1);//なぜかキャストしたら動いた
      _collArr = sub1;
      count = -1;//なぜか0だと1スタートになる
      pressR = false;
    }
}
class Collision {
  float x, y;
  float xmove, ymove;
  color c;
  float strWght;

  Collision() {
    x = random(width);
    y = random(height);
    xmove = random(10, 20);
    ymove = random(10, 20);
    c = color(random(100), random(100), random(100));
    strWght = random(3000, 10000);
  }

  void updataEffect() {
    x+=xmove;
    y+=ymove;
    if (x>width || x<0)xmove = -xmove;
    if (y>height || y<0)ymove = -ymove;
    for (int i=0; i<_collArr.length; i++) {
      stroke(c);
      Collision otherColl = _collArr[i];
      if (otherColl != this) {
        float dis = dist(x, y, otherColl.x, otherColl.y);
        strokeWeight(strWght/dis);
        if (dis<30) {
          float midX, midY;
          midX = (x+otherColl.x)/2;
          midY = (y+otherColl.y)/2;
          line(midX, midY, x, y);
          line(midX, midY, otherColl.x, otherColl.y);
//        triangle(midX, midY, otherColl.x, otherColl.y, x, y);
          break;
        }
      }
    }
  }
}



