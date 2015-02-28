
float w = 60;
float h = 28;
float w1 = 28;
float h1 = 65;
float r;
float g;
float b;
float o;
float c;
float x;
float y;
int dx=0;
int dy=250;
PImage dragon;
PImage knight;
PImage dragon1;
PImage bknight;
PImage dragon2;
PImage queen;

void setup() {
  size(800, 600);
  dragon = loadImage("dragon.png");
  knight = loadImage("knight.png");
  dragon1 = loadImage("dragon1.png");
  bknight = loadImage("bknight.png");
  dragon2 = loadImage("dragon2.png");
  queen = loadImage("queen.png");
  background(0);
}




void draw() { 
  noStroke();
  float r=random(255);
  float g=random(255);
  float b=random(255);
  float o=random(255);
  fill(255);
  rect(75, 340, 28, 60);
  if (mouseX>75 && mouseX<75+28 && mouseY>340  && mouseY<340+60 && mousePressed) {
    background(255, 0, 0);
  }
  rect(100, 355, 60, 28);
  if (mouseX>100 && mouseX<100+60 && mouseY>355  && mouseY<355+28 && mousePressed) {
    background(255, 0, 0);
  }
  rect(110, 118, 28, 60);
  if (mouseX>110 && mouseX<110+28 && mouseY>118  && mouseY<118+60 && mousePressed) {
    background(255, 0, 0);
  }
  rect(140, 35, 60, 28);
  if (mouseX>140 && mouseX<140+60 && mouseY>35  && mouseY<35+28 && mousePressed) {
    background(255, 0, 0);
  }
  rect(200, 10, 28, 60);
  if (mouseX>200 && mouseX<200+28 && mouseY>10  && mouseY<10+60 && mousePressed) {
    background(255, 0, 0);
  }
  rect(175, 185, 60, 28);
  if (mouseX>175 && mouseX<175+60 && mouseY>185  && mouseY<185+28 && mousePressed) {
    background(255, 0, 0);
  }
  rect(175, 395, 28, 60);
  if (mouseX>175 && mouseX<175+28 && mouseY>395  && mouseY<395+60 && mousePressed) {
    background(255, 0, 0);
  }
  rect(285, 24, 28, 65);
  if (mouseX>285 && mouseX<285+28 && mouseY>24  && mouseY<24+65 && mousePressed) {
    background(255, 0, 0);
  }
  rect(360, 15, 28, 55);
  if (mouseX>360 && mouseX<360+28 && mouseY>15  && mouseY<15+55 && mousePressed) {
    background(255, 0, 0);
  }
  rect(325, 287, 28, 55);
  if (mouseX>325 && mouseX<325+28 && mouseY>287  && mouseY<287+55 && mousePressed) {
    background(255, 0, 0);
  }
  rect(325, 455, 60, 28);
  if (mouseX>325 && mouseX<325+60 && mouseY>455  && mouseY<455+28 && mousePressed) {
    background(255, 0, 0);
  }
  rect(390, 175, 60, 28);
  if (mouseX>390 && mouseX<390+60 && mouseY>175  && mouseY<175+60 && mousePressed) {
    background(255, 0, 0);
  }
  rect(410, 200, 28, 60);
  if (mouseX>410 && mouseX<410+28 && mouseY>200  && mouseY<200+60 && mousePressed) {
    background(255, 0, 0);
  }
  rect(425, 232, 60, 28);
  if (mouseX>425 && mouseX<425+60 && mouseY>232  && mouseY<232+28 && mousePressed) {
    background(255, 0, 0);
  }
  rect(525, 432, 28, 58);
  if (mouseX>525 && mouseX<525+28 && mouseY>432  && mouseY<432+58 && mousePressed) {
    background(255, 0, 0);
  }
  rect(460, 400, 28, 78);
  if (mouseX>460 && mouseX<460+28 && mouseY>400  && mouseY<400+78 && mousePressed) {
    background(255, 0, 0);
  }
  rect(550, 60, 28, 60);
  if (mouseX>550 && mouseX<550+28 && mouseY>60  && mouseY<60+60 && mousePressed) {
    background(255, 0, 0);
  }
  rect(575, 70, 60, 28);
  if (mouseX>575 && mouseX<575+60 && mouseY>70  && mouseY<70+28 && mousePressed) {
    background(255, 0, 0);
  }
  rect(590, 15, 28, 60);
  if (mouseX>590 && mouseX<590+28 && mouseY>15  && mouseY<15+60 && mousePressed) {
    background(255, 0, 0);
  }
  rect(610, 170, 60, 28);
  if (mouseX>610 && mouseX<610+60 && mouseY>170  && mouseY<170+28 && mousePressed) {
    background(255, 0, 0);
  }
  rect(630, 315, 90, 28);
  if (mouseX>630 && mouseX<630+90 && mouseY>315  && mouseY<315+28 && mousePressed) {
    background(255, 0, 0);
  }
  rect(710, 240, 28, 60);
  if (mouseX>710 && mouseX<710+28 && mouseY>240  && mouseY<240+60 && mousePressed) {
    background(255, 0, 0);
  }
  rect(735, 340, 28, 50);
  if (mouseX>735 && mouseX<735+28 && mouseY>340  && mouseY<340+50 && mousePressed) {
    background(255, 0, 0);
  }
  rect(745, 425, 28, 65);
  if (mouseX>745 && mouseX<745+28 && mouseY>425  && mouseY<425+65 && mousePressed) {
    background(255, 0, 0);
  }
  Hrect();
  Vrect();
  int x1=-810;
  int y1=0;
  int w=20;
  int h=600;
  while (x1<width) {
    fill(255);
    rect(x1, y1, w, h);   
    x1=x1+800;
    if (mouseX>x1 && mouseX<x1+w && mouseY>y1  && mouseY<y1+h && mousePressed) {
      background(255, 0, 0);
    }
  }
  int x2=0;
  int y2=-610;
  int w1=800;
  int h1=20;
  while (y2<height) {
    rect(x2, y2, w1, h1);
    y2=y2+600;
    if (mouseX>x2 && mouseX<x2+w1 && mouseY>y2  && mouseY<y2+h1 && mousePressed) {
      background(255, 0, 0);
    }
  }
  float c=random(10);
  float x=random(width);
  float y=random(height);
  fill(r, g, b, o);
  ellipse(x, y, c, c);
  fill(162, 23, 23);
  rect(0, 250, 60, 65);
  image(knight, 0, 250, 60, 65);
  rect(710, 80, 60, 65);
  image(queen, 710, 80, 60, 65);
  if (mouseX>710 && mouseX<720+60 && mouseY>80  && mouseY<80+65 && mousePressed) {
    background(r, g, b);
  }
  fill(255);
  rect(625, 430, 60, 60);
  image(dragon, 625, 430, 60, 60);
  rect(325, 80, 60, 60);
  image(dragon1, 325, 80, 60, 60);
  rect(230, 230, 60, 60);
  image(bknight, 230, 230, 60, 60);
  rect(640, 250, 60, 60);
  image(dragon2, 640, 250, 60, 60);
}




void mouseDragged() {
  strokeWeight(4);
  stroke(255, 0, 0);
  line(mouseX, mouseY, pmouseX, pmouseY);
  fill(0, 255, 255);
  ellipse(mouseX, mouseY, 12, 12);
}




void mousePressed() {
  background(0);
}




void keyPressed() {
  background(0);
}




void Hrect() {
  //randomSeed(255);
  //float r=random(255);
  //float g=random(255);
  //float b=random(255);
  for (int i=50; i<=width; i+=200) {
    fill(255);
    rect(i, 50, w, h);
    if (mouseX>i && mouseX<i+w && mouseY>50  && mouseY<50+h && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=35; i<=width; i+=200) {
    rect(i, 100, w, h);
    if (mouseX>i && mouseX<i+w && mouseY>100  && mouseY<100+h && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=75; i<=width; i+=200) {
    rect(i, 150, w, h);
    if (mouseX>i && mouseX<i+w && mouseY>150  && mouseY<150+h && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=100; i<=width; i+=200) {
    rect(i, 200, w, h);
    if (mouseX>i && mouseX<i+w && mouseY>200  && mouseY<200+h && mousePressed) {
      background(255, 0, 0);
    }
  } 
  for (int i=125; i<=width; i+=200) {
    rect(i, 250, w, h);
    if (mouseX>i && mouseX<i+w && mouseY>250  && mouseY<250+h && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=150; i<=width; i+=200) {
    rect(i, 300, w, h);
    if (mouseX>i && mouseX<i+w && mouseY>300  && mouseY<300+h && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=175; i<=width; i+=200) {
    rect(i, 350, w, h);
    if (mouseX>i && mouseX<i+w && mouseY>350  && mouseY<350+h && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=75; i<=width; i+=150) {
    rect(i, 400, 60, 25);
    if (mouseX>i && mouseX<i+w && mouseY>400  && mouseY<400+h && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=100; i<=width; i+=150) {
    rect(i, 450, w, h);
    if (mouseX>i && mouseX<i+w && mouseY>450  && mouseY<450+h && mousePressed) {
      background(255, 0, 0);
    }
  } 
  for (int i=125; i<=width; i+=90) {
    rect(i, 500, w, h);
    if (mouseX>i && mouseX<i+w && mouseY>500  && mouseY<500+h && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=50; i<=width; i+=100) {
    rect(i, 550, w, h);
    if (mouseX>i && mouseX<i+w && mouseY>550  && mouseY<550+h && mousePressed) {
      background(255, 0, 0);
    }
  }
}




void Vrect() {
  for (int i=50; i<=height; i+=200) {
    rect(50, i, w1, h1);
    if (mouseX>50 && mouseX<50+w1 && mouseY>i  && mouseY<i+h1 && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=25; i<=height; i+=200) {
    rect(100, i, w1, h1);
    if (mouseX>100 && mouseX<100+w1 && mouseY>i  && mouseY<i+h1 && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=75; i<=height; i+=200) {
    rect(150, i, w1, h1);
    if (mouseX>150 && mouseX<150+w1 && mouseY>i  && mouseY<i+h1 && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=100; i<=height; i+=200) {
    rect(200, i, w1, h1);
    if (mouseX>200 && mouseX<200+w1 && mouseY>i  && mouseY<i+h1 && mousePressed) {
      background(255, 0, 0);
    }
  } 
  for (int i=125; i<=height; i+=200) {
    rect(250, i, w1, h1);
    if (mouseX>250 && mouseX<250+w1 && mouseY>i  && mouseY<i+h1 && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=150; i<=height; i+=200) {
    rect(300, i, w1, h1);
    if (mouseX>300 && mouseX<300+w1 && mouseY>i  && mouseY<i+h1 && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=175; i<=height; i+=200) {
    rect(350, i, w1, h1);
    if (mouseX>350 && mouseX<350+w1 && mouseY>i  && mouseY<i+h1 && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=75; i<=height; i+=200) {
    rect(400, i, w1, h1);
    if (mouseX>400 && mouseX<400+w1 && mouseY>i  && mouseY<i+h1 && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=100; i<=height; i+=200) {
    rect(450, i, w1, h1);
    if (mouseX>450 && mouseX<450+w1 && mouseY>i  && mouseY<i+h1 && mousePressed) {
      background(255, 0, 0);
    }
  } 
  for (int i=125; i<=height; i+=200) {
    rect(500, i, w1, h1);
    if (mouseX>500 && mouseX<500+w1 && mouseY>i  && mouseY<i+h1 && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=150; i<=height; i+=200) {
    rect(550, i, w1, h1);
    if (mouseX>550 && mouseX<550+w1 && mouseY>i  && mouseY<i+h1 && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=150; i<=height; i+=200) {
    rect(600, i, w1, h1);
    if (mouseX>600 && mouseX<600+w1 && mouseY>i  && mouseY<i+h1 && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=150; i<=height; i+=200) {
    rect(650, i, w1, h1);
    if (mouseX>650 && mouseX<650+w1 && mouseY>i  && mouseY<i+h1 && mousePressed) {
      background(255, 0, 0);
    }
  }
  for (int i=150; i<=height; i+=200) {
    rect(700, i, w1, h1);
    if (mouseX>700 && mouseX<700+w1 && mouseY>i  && mouseY<i+h1 && mousePressed) {
      background(255, 0, 0);
    }
  }
}



