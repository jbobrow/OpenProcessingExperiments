
PImage sasa1;
PImage sasa2;
PImage sasa3;

Ha[] ha = new Ha[100];
Rain[] rain = new Rain[500];
Time[] time = new Time[15];

void setup() {
  size(400, 300);
  smooth();
  colorMode(HSB,100);
  textAlign(CENTER);
  /*  sasa1 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/sasa1.png");
   sasa2 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/sasa2.png");
   sasa3 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/sasa3.png");
   imageMode(CENTER);
   */
  int m = minute();

  for(int i = 0; i < ha.length; i++) {
    ha[i] = new Ha(random(-20,width), random(-20,height),random(5),random(-20,width), random(-20,height),random(-20,width), random(-20,height));
  }

  for(int i = 0; i < rain.length; i++) {
    rain[i] = new Rain(random(width), random(height),random(5));
  }

  for(int i = 0; i < time.length; i++) {
    time[i] = new Time(random(width), random(height),random(2));
  }
}


void draw() { 
  int s = second();
  int m = minute();
  int h = hour();

  if(m % 2 != 0) {
    background(99);
    for(int i = 0; i < ha.length; i++) {
      ha[i].move();
      ha[i].display();
    }
  }

  if(m % 2 == 0) {
    background(40);
    for(int i = 0; i < rain.length; i++) {
      rain[i].move();
      rain[i].display();
    }
  }



  if(m % 2 != 0) {
    noStroke();
    fill(23,99,99,50);
    rect(0, height - s*5, width, height);

    /*    fill(0);
     String t = h + ":" + nf(m, 2);
     text(t, width/2, height/2);
     */
  }


  if(m % 2 == 0) {
    noStroke();
    fill(99,50);
    rect(0, height - s*5, width, height);

    /*    fill(99);
     String t = h + ":" + nf(m, 2);
     text(t, width/2, height/2);
     */
  }
  for(int i = 0; i < time.length; i++) {
    time[i].move();
    time[i].display();
  }
}




class Ha {
  float x, y, s, xx, yy, xxx, yyy;
  Ha(float _x, float _y, float _s, float _xx, float _yy,float _xxx, float _yyy) {
    x = _x;
    y = _y;
    s = _s;
    xx = _xx;
    yy = _yy;
    xxx = _xxx;
    yyy = _yyy;
  }

  void move() {
    y += s;
    if (y > height) y = 0;
    yy += s;
    if (yy > height) yy = 0;
    yyy += s;
    if (yyy > height) yyy = 0;

  }

  void display() {
    noStroke();
    fill(30,90,50);
    triangle(x, y, x +30,y+ 18, x +14, y+16);
    fill(35,99,60);
    triangle(xx, yy+18, xx +30, yy, xx +14,  yy+3);
    fill(25,90,60);
    triangle(xxx,  yyy+6, xxx +15,  yyy+10, xxx +30, yyy);
  }
}







class Rain {
  float x, y, s;

  Rain(float _x, float _y, float _s) {
    x = _x;
    y = _y;
    s = _s;
  }

  void move() {
    y += s;
    if (y > height)y = 0;
  }

  void display() {
    stroke(100,random(50,100));
    line(x,y,x,y + random(70));
  }
}




class Time {
  float x, y, s;

  Time(float _x, float _y, float _s) {
    x = _x;
    y = _y;
    s = _s;
  }

  void move() {
    y += s;
    if (y > height)y = 0;
  }

  void display() {
    int s = second();
    int m = minute();
    int h = hour();
    if(m % 2 != 0) {
      fill(0);
    }
    else {
      fill(99);
    }
    String t = h + ":" + nf(m, 2);
    text(t, x,y);
  }
}

