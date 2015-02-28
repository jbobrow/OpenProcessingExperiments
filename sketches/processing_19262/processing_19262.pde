
PFont font;
int a1 = -100;
int a2 = -100;
int a3 = 350;
int a4 = -100;
int a5 = 350;
int a6 = 350;
void setup() {
  size(250, 250);
  background (0);
  font = loadFont("CenturyGothic-Bold-70.vlw");
}
  
  void draw() {
        for(int x = 200; x < 300; x += 40) {
      fill(#2CE3DE, 40);
      smooth();
      noStroke();
   ellipse (random (x), random (x), 10, 10);
  } 
    for(int x = 200; x < 300; x += 40) {
      fill(#BFF227, 40);
      smooth();
      noStroke();
   ellipse (random (x), random (x), 10, 10);
  } 
    fill(0,12);
    rect(0,0,width,height);
    textFont(font);
    fill(250);
    text ("L", a1, 125);
    text ("9", 50, a2);
    text ("C", 75, a3);
    text ("6", 120, a4);
    text ("W", 135, a5);
    text ("9", a6, 160);
    if (a1 < 25) {
      a1 = a1 + 2;
    }
    if (a2 < 100) {
      a2 = a2 + 2;
    }
    if (a3 > 175) {
      a3 = a3 - 2;
    }
    if (a4 < 125) {
      a4 = a4 + 2;
    }
    if (a5 > 215) {
      a5 = a5 - 2;
    }
    if (a6 > 190) {
      a6 = a6 - 2;
    }
    if (a4 == 120) {
      a1 = -100;
      a2 = -100;
      a3 = 350;
      a4 = -100;
      a5 = 350;
      a6 = 350;
    }
  }

