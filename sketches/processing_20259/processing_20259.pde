
AnalogClock analogClock;
XMLElement xml;
  
void setup() {
size(800,600);
  smooth();
  imageMode(CENTER);
  analogClock = new AnalogClock(width/2, height/2);
  xml = new XMLElement(this, "http://pipes.yahoo.com/pipes/pipe.run?_id=16a0be4caf36d0553f9cd7472bedfe5a&_render=rss");
  //xml = new XMLElement(this, "weather.rss");
 
}
  
void draw() {
  background(255);
  PImage photo1 = loadImage("sunny_.png");
  PImage photo2 = loadImage("snow_.png");
  PImage photo3 = loadImage("cloudy_.png");
  PImage photo4 = loadImage("ranny_.png");
  
  XMLElement[] weather = xml.getChildren("channel/item/title");
  
  for (int i = 0; i < weather.length/4; i++) {
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(i*TWO_PI/4);
    translate(50,-50);
    
    //気象情報
    
    if (match(weather[i].getContent(), "雪") != null || match(weather[i].getContent(), "みぞれ") != null) {
      image(photo2, 0, 0);
    } else if (match(weather[i].getContent(), "晴れ") != null) {
      image(photo1, 0, 0);
    } else if (match(weather[i].getContent(), "曇り") != null) {
      image(photo3, 0, 0);
    } else if (match(weather[i].getContent(), "雨") != null) {
      image(photo4, 0, 0);
    }
    
    
   
/*    
    fill(0);
    textAlign(CENTER);
    textSize(18);
    text(weather[i].getContent(), 0, -100);
    
    //println(weather[i].getContent());
   
    */
     popMatrix();
  }
  
  
  analogClock.getTime();
  analogClock.display();
}

class AnalogClock extends Clock {
  float x, y;
    
  AnalogClock(float _x, float _y) {
    x = _x;
    y = _y;
  }
    
  void getTime() {
    super.getTime();
  }
    
  void display() {
    //盤
    /*
    noStroke();
    fill(255);
    ellipse (x, y, 200, 200);
    */
    //針の色
    stroke(0);
    //時
    pushMatrix();
    translate(width/2, height/2);
    rotate((h + m/60.0) % 12 * TWO_PI/12);
    strokeWeight(4);
    line(0, 0, 0, -80);
    popMatrix();
    //分
    pushMatrix();
    translate(width/2, height/2);
    rotate((m + s/60.0) * TWO_PI/60);
    strokeWeight(2);
    line(0, 0, 0, -120);
    popMatrix();
    //秒
    pushMatrix();
    translate(width/2, height/2);
    rotate(s * TWO_PI/60);
    strokeWeight(1);
    line(0, 0, 0, -140);
    popMatrix();
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

void keyPressed() {
  save("0812006.png");
}

