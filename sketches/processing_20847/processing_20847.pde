
MojiClock mojiClock;
PImage photo1,photo2, photo3;

void setup() {
  size(600, 600);
  frameRate(1);
  colorMode(RGB);
  smooth();
  mojiClock = new MojiClock(100, 360);
  photo1 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/j.png");
  photo2 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/h.png");
  photo3 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/b.png");
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
  strokeWeight(5);
  tint(255, 255, 255, 160);
  
  
   //秒
  //strokeWeight(2);
  pushMatrix();
  translate(30, 130);
  scale(0.8);
  image(photo3, 0, 0);
  popMatrix();


  
  //分
  //strokeWeight(2);
  pushMatrix();
  translate(30, 160);
  scale(1.1);
  image(photo2, 0, 0);
  popMatrix();

    //時
  //stroke(0);
   pushMatrix();
   translate(50, 100);
   scale(1.5);
   image(photo1, 0, 0);
   popMatrix();

  //時分秒の針
  strokeWeight(10);
  line(180, 270 , 50 * cos(h % 12 * TWO_PI / 12 - HALF_PI) + 190, 50 * sin(h % 12 * TWO_PI / 12 - HALF_PI) + 270); //時針の描画
  line(180, 270 , 90 * cos(m * TWO_PI / 60 - HALF_PI) + 190, 90 * sin(m * TWO_PI / 60 - HALF_PI) + 270); //分針の描画
  line(180, 270 , 110 * cos(s * TWO_PI / 60 - HALF_PI) + 190, 110 * sin(s * TWO_PI / 60 - HALF_PI) + 270); //秒針の描画  
    }
  
  }

  //void keyPressed() {
   // save("0812082.png");
  //}
      
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
                
