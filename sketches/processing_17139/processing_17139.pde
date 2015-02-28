
XMLElement /*xml0, xml1, xml2, xml3, xml4, xml5, xml6, xml7, xml8, xml9, xml10, xml11, 
 xml12, xml13, xml14, */xml15/*, xml16, xml17, xml18, xml19, xml20, xml21, xml22, xml23*/;

Spot[] sp = new Spot[60];
int count = 0;

TextClock textClock;

void setup() {
  size(840, 630);
  smooth();
  /*xml0 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=0%E6%99%82");
  xml1 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=1%E6%99%82");
  xml2 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=2%E6%99%82");
  xml3 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=3%E6%99%82");
  xml4 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=4%E6%99%82");
  xml5 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=5%E6%99%82");
  xml6 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=6%E6%99%82");
  xml7 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=7%E6%99%82");
  xml8 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=8%E6%99%82");
  xml9 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=9%E6%99%82");
  xml10 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=10%E6%99%82");
  xml11 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=11%E6%99%82");
  xml12 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=12%E6%99%82");
  xml13 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=13%E6%99%82");
  xml14 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=14%E6%99%82");*/
  xml15 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=15%E6%99%82");/*
  xml16 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=16%E6%99%82");
  xml17 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=17%E6%99%82");
  xml18 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=18%E6%99%82");
  xml19 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=19%E6%99%82");
  xml20 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=20%E6%99%82");
  xml21 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=21%E6%99%82");
  xml22 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=22%E6%99%82");
  xml23 = new XMLElement(this, "http://search.twitter.com/search.atom?lang=ja&q=23%E6%99%82");*/
  for (int i = 0; i < sp.length; i++) {
    sp[i] = new Spot(random(0, width *3), random(30, height -50), random(15, 22), random(44, 84), random(0.8, 1.3));
  }
  textClock = new TextClock(random(width), height -30, random(15, 18), 30, random(0.8, 1));
}


void draw() {
  background(0);
  for (int i = 0; i < sp.length; i++) {
    sp[i].move();
    sp[i].getTime();
    sp[i].display();
  }
  textClock.move();
  textClock.getTime();
  textClock.display();
}


class Spot extends Clock {
  float x, y, ms, c, speed; // x座標, y座標, 文字サイズ, 文字色, 速さ

  Spot(float _x, float _y, float _ms, float _c, float _speed) {
    x = _x;
    y = _y;
    ms = _ms;
    c = _c;
    speed = _speed;
  }

  void move() {
    x -= speed;
    if (x < 0 - width *3) x = width;
  }

  void getTime() {
    super.getTime();
  }

  void display() {
    textSize(ms);
    fill(c);
    //switch(h) {
    //  case 13: 
      XMLElement[] tweets = xml15.getChildren("entry/title");
    //  break;
    //default:
    //  XMLElement[] tweets = xml0.getChildren("entry/title");
    //  break;
    //}
    text(tweets[count].getContent(), x, y);
    count++;
    if(count >= tweets.length) count = 0;
  }
}

class TextClock extends Clock {
  float xx, yy, ts, cc, sp; // x座標, y座標, 文字サイズ, 文字色, 速さ

  TextClock(float _xx, float _yy, float _ts, float _cc, float _sp) {
    xx = _xx;
    yy = _yy;
    ts = _ts;
    cc = _cc;
    sp = _sp;
  }

  void move() {
    xx -= sp;
    if (xx < 0 -width/2) xx = width;
  }

  void getTime() {
    super.getTime();
  }

  void display() {
    textSize(ts);
    fill(cc);
    text("＠you　現在時刻は、" + h + "時" + nf(m, 2) + "分" + nf(s, 2) + "秒です。", xx, yy);
  }
}

class Clock {
  int h, m, s;
  
  Clock() {
  }

  void getTime() {
    h = hour();
    m = minute();
    s = second();
  }
}

