
MojiClock mojiClock;
PImage photo1,photo2, photo3;

void setup() {
  size(1100, 400);
  frameRate(1);
  colorMode(HSB);
  smooth();
  mojiClock = new MojiClock(100, 360);
  photo1 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/toki.png");
  photo2 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/bn.png");
  photo3 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/byou.png");
}

void draw() {
  background(255);
  mojiClock.getTime();
  mojiClock.display();
  //save("0812082.png");
}

class MojiClock extends Clock{
  float x, y;
  
  MojiClock(float _x, float _y) {
    x = _x;
    y = _y;
  }

void getTime() {
  super.getTime();
}
 
void display(){
  //盤
  stroke(0);
  strokeWeight(13);
  
  
  
  //時
  //stroke(0);
   line(100, 220 , 60 * cos(h % 12 * TWO_PI / 12 - HALF_PI) + 100, 60 * sin(h % 12 * TWO_PI / 12 - HALF_PI) + 200); //時針の描画
   image(photo1, 10, 100);
 
  //分
  //strokeWeight(2);
  line(550, 207 , 100 * cos(m * TWO_PI / 60 - HALF_PI) + 550, 100 * sin(m * TWO_PI / 60 - HALF_PI) + 207); //分針の描画
  image(photo2, 410, 100);

  

  //秒
  //strokeWeight(2);
  line(1000, 210 , 90 * cos(s * TWO_PI / 60 - HALF_PI) + 1000, 90 * sin(s * TWO_PI / 60 - HALF_PI) + 210); //秒針の描画
  image(photo3, 740, 110);

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
                
