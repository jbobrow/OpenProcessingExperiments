
PImage stem;
PImage center;
PImage petal1;
PImage petal2;
PImage petal3;
PImage petal4;
PImage petal5;
PImage petal6;
PImage petal7;
PImage petal8;
PImage petal9;
PImage petal10;
PImage petal11;
PImage petal12;
PImage petal13;
int y1;
int y2;
int y3;
int y4;
int y5;
int y6;
int y7;
int y8;
int y9;
int y10;
int y11;
int y12;
int y13;
int x = int(random(2));
int speed;
int clicks;

////////////////setup

void setup() {
  size(320, 500);
  background(245);
  y1 = 100;
  y2 = 115;
  y3 = 125;
  y4 = 195;
  y5 = 210;
  y6 = 230;
  y7 = 230;
  y8 = 220;
  y9 = 200;
  y10 = 200;
  y11 = 145;
  y12 = 130;
  y13 = 180;
  speed = 2;
  
  //load images
  
  stem = loadImage("stem.png");
  center = loadImage("center.png");
  petal1 = loadImage("petal1.png");
  petal2 = loadImage("petal2.png");
  petal3 = loadImage("petal3.png");
  petal4 = loadImage("petal4.png");
  petal5 = loadImage("petal5.png");
  petal6 = loadImage("petal6.png");
  petal7 = loadImage("petal7.png");
  petal8 = loadImage("petal8.png");
  petal9 = loadImage("petal9.png");
  petal10 = loadImage("petal10.png");
  petal11 = loadImage("petal11.png");
  petal12 = loadImage("petal12.png");
  petal13 = loadImage("petal13.png");
}

///////////draw

void draw() {
  background(245);
  image(stem, 70, 70);
  
  petal1();
  petal3();
  petal13();
  petal2();
  petal4();
  petal5();
  petal6();
  if(x == 1) {
    petal12();
  }
  petal11();
  petal10();
  petal9();
  petal8();
  petal7();

  image(center, 135, 205);
  
/////////////
  
  if(clicks == 1) {
    fall1();
  }
  if(clicks == 2) {
    fall9();
  }
  if(clicks == 3) {
    fall3();
  }
  if(clicks == 4) {
    fall5();
  }
  if(clicks == 5) {
    fall13();
  }
  if(clicks == 6) {
    fall6();
  }
  if(clicks == 7) {
    fall11();
  }
  if(clicks == 8) {
    fall2();
  }
  if(clicks == 9) {
    fall7();
  }
  if(clicks == 10) {
    fall10();
  }
  if(clicks == 11) {
    fall4();
  }
  if(clicks == 12) {
    fall8();
  }
  if(x == 1) {
    if(clicks == 13) {
      fall12();
    }
  }
}

/////////petals

void petal1() {
  image(petal1, 100, y1);
}
void petal2() {
  image(petal2, 130, y2);
}
void petal3() {
  image(petal3, 155, y3);
}
void petal4() {
  image(petal4, 165, y4);
}
void petal5() {
  image(petal5, 150, y5);
}
void petal6() {
  image(petal6, 145, y6);
}
void petal7() {
  image(petal7, 110, y7);
}
void petal8() {
  image(petal8, 95, y8);
}
void petal9() {
  image(petal9, 70, y9);
}
void petal10() {
  image(petal10, 50, y10);
}
void petal11() {
  image(petal11, 55, y11);
}
void petal12() {
  image(petal12, 80, y12);
}
void petal13() {
  image(petal13, 160, y13);
}

//////////////

void fall1() {
  y1 = y1 + speed;
}
void fall2() {
  y2 = y2 + speed;
}
void fall3() {
  y3 = y3 + speed;
}
void fall4() {
  y4 = y4 + speed;
}
void fall5() {
  y5 = y5 + speed;
}
void fall6() {
  y6 = y6 + speed;
}
void fall7() {
  y7 = y7 + speed;
}
void fall8() {
  y8 = y8 + speed;
}
void fall9() {
  y9 = y9 + speed;
}
void fall10() {
  y10 = y10 + speed;
}
void fall11() {
  y11 = y11 + speed;
}
void fall12() {
  y12 = y12 + speed;
}
void fall13() {
  y13 = y13 + speed;
}
/////////////

void mouseClicked() {
  if (clicks == clicks) {
    clicks = clicks + 1;
  }
}


