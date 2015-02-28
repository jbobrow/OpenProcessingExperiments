

Circle[] circles = new Circle[5000];

String[] files;
int timer;
int maxN = 5;
int num = 0;
PImage[] motive = new PImage[maxN];

int count = 0;
int maxDiameter = 32;
int minDiameter = 11;
int lastAdded = 0;
int lastAddedTimeout = 25; // 타임아웃 중간 break

color[] off, on;

void setup() {
  size(1280, 720);
  smooth();
  background(255);
  colorMode(RGB);
  noFill();
  for (int i=0; i<motive.length;i++) {
    motive[i]=loadImage("motive"+i+".png");
    if(i==6){
    }
  }

  color[] _off = {  //배경 
    // style 1
  //  color(#9CA594), color(#ACB4A5), color(#BBB964), color(#D7DAAA), color(#E5D57D), color(#D1D6AF), 
    // style 2
    color(#F49427), color(#C9785D), color(#E88C6A), color(#F1B081), 
    color(#F49427), color(#C9785D), color(#E88C6A), color(#F1B081), 
    color(#F49427), color(#C9785D), color(#E88C6A), color(#F1B081), color(#FFCE00)
  };

  color[] _on = {  //형상 
    //주황 분홍
 //   color(#F9BB82), color(#EBA170), color(#FCCD84), 

    // 녹색 형상
    color(#89B270), color(#7AA45E), color(#B6C674), color(#7AA45E), color(#B6C674), 
    color(#89B270), color(#7AA45E), color(#B6C674), color(#7AA45E), color(#B6C674), 
    color(#89B270), color(#7AA45E), color(#B6C674), color(#7AA45E), color(#B6C674), color(#FECB05)
  };

  on = _on;
  off = _off;
}


void draw() {
  if (count < circles.length) {
    circles[count] = new Circle();
    if (circles[count].overlapsAny()) {
      circles[count] = null;
    }

    if (circles[count] != null) {
      circles[count].draw();

      if (count > 1) {
        float nearest = 100000;
        float current = 0;
        int nearestIndex = -1;
        for (int i=0; i<count; i++) {
          current = dist(circles[i].x, circles[i].y, circles[count].x, circles[count].y);
          if (current < nearest) {
            nearest = current;
            nearestIndex = i;
          }
        }
      }

      count++;
      lastAdded = 0;
    } else {
      if (lastAdded > lastAddedTimeout && maxDiameter > minDiameter) {
        maxDiameter--;
        // minDiameter--;
        lastAdded = 0;
      }
      lastAdded++;
    }
  }
  lastX = lastY = -1;

  //캠 

  // 타이머 부분
  timer=timer+1;
  if ((timer==1500) || (timer==3000) || (timer==4500) || (timer==6000) || (timer==7500) ||(timer==9000) ||(timer==9500)) {
    background(255);
    num = num +1;
    if (num==maxN-1) {
      num = 0;
      timer = 0;
      //num = (int)random(motive.length);
      //delay(1000);
    }
  }
}

class Point
{
  float x, y;

  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

class Circle
{
  float x, y, radius;
  int[] xs, ys;
  color bg = color(255, 255, 255), fg = -1;

  Circle() {
    radius = random(minDiameter, maxDiameter) / 2.0;
    float a = random(PI*2);
    float r = random(0, width*.48-radius);
    x = lastX < 0 ? width*.5+cos(a)*r : lastX;
    y = lastY < 0 ? height*.5+ sin(a)*r : lastY;
    init();
  }

  Circle(int x, int y, float rad) {
    this.radius = rad;
    this.x = x;
    this.y = y; 
    init();
  }

  void init() {
    int x = int(this.x), y = int(this.y), r = int(radius); 
    int[] xs = {
      x, x, x, x-r, x+r, int(x-r*.93), int(x-r*.93), int(x+r*.93), int(x+r*.93)
    }; 
    int[] ys = {
      y, y-r, y+r, y, y, int(y+r*.93), int(y-r*.93), int(y+r*.93), int(y-r*.93)
    };
    this.xs = xs;
    this.ys = ys;
  }

  boolean overlapsMotive() {
    for (int i=0;i<xs.length;i++) {
      int col = motive[num].get(xs[i], ys[i]);
      if (col != bg) {
        return true;
      }
    }
    return false;
  }

  boolean overlapsAny() {    
    for (int i=0;i<xs.length;i++) {
      int col = get(xs[i], ys[i]);
      if (col != bg) {
        return true;
      }
    }
    if (radius > minDiameter) {
      radius = minDiameter;
      init();
      return overlapsAny();
    }
    return false;
  }

  boolean intersects(Circle c) {
    int dx = int(c.x)-int(x), dy  = int(c.y) - int(y);
    return dx * dx + dy * dy < (c.radius + radius)*(c.radius + radius);
  }

  boolean inside(Circle c) {
    int dx = int(c.x)-int(x), dy  = int(c.y) - int(y);
    return dx * dx + dy * dy < (c.radius - radius)*(c.radius - radius);
  } 


  void draw() {
    if (fg < 0) fg = overlapsMotive() ? on[int(random(0, on.length))] : off[int(random(0, off.length))];

    fill(fg);
    noStroke();
    ellipse(x, y, radius*2, radius*2);
  }
}

int lastX = -1, lastY = -1;

void mousePressed() {
  image(motive[num], 0, 0, 170, 170);
}



