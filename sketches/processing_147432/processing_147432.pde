
/* @pjs font="Osaka.ttf"; */
  
String[] kanjiString = {"一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "百", "千",  "万", "億"};
int buffer = 48;
float theta=0;
 
  
Kanji myKanji[] = new Kanji[kanjiString.length];
  
void setup() {
  size(600, 600);
  background(0);
  colorMode(HSB);
  fill(0, 0, 255);
  PFont mono;
  mono = createFont("Osaka", 48);
  textFont(mono);
  
  for (int i = 0; i < kanjiString.length; i++) {
    myKanji[i] = new Kanji(kanjiString[i]);
  }
}
  
void draw() {
  background(0, 0, 0);
  for (int j = 0; j < kanjiString.length; j++) {
    myKanji[j].run();
  }
}
  
class Kanji {
  float x = random(buffer, width-buffer);
  float y = random(buffer, height-buffer);
  color c = color(random(255), 255, 255);
  float twirl = random(.5, 2);
  float xspeed = random(4);
  float yspeed = random(4);
  String me;
  
  Kanji(String _me) {
    me = _me;
  }
  
  void run() {
    display();
    move();
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(radians(theta) * twirl);
    fill(c);
    text(me, -24, 20);
    popMatrix();
    theta+=.5;
 
  }
  
  void move() {
    x+=xspeed;
    y+=yspeed;
  
    if (x > width - buffer/2 || x < buffer/2) xspeed *= -1;
    if (y > height - buffer/2 || y < buffer/2) yspeed *=-1;
  }
}
