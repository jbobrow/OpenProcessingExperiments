
import processing.opengl.*;
int brushState;
PImage startImg;
PImage bg;
int drawState; // 0 = pre draw; 1 = in draw; 2 = restart)

int StemNum = 5;
int [] stemy = new int[StemNum];
int [] stemx = new int[StemNum];

int num = 2;

int [] x = new int [num];
int [] y = new int [num];

float a; //rotate speed

//float gx, gy;
//PImage theBrush;
PFont font;
PFont startFont;
PFont TitleFont;

//+++++++++++++++++++++   setup   ++++++++++++++++++++++++++++   setup    +++++++++++++++++++++++++++++++++++++++++++++++++++++++
void setup() {	
  size(1024, 768, OPENGL);
  noStroke();
  bg = loadImage("paper2.jpg");
  startImg = loadImage("rose.png");
  background(255);

  smooth();
  drawState = 0;
  TitleFont = loadFont("LaurenScript-52.vlw");
  font = loadFont("DiscipuliBritannica-48.vlw");
  startFont = loadFont("Gabriola-48.vlw");
  textFont(TitleFont);
  fill(255, 108, random(108, 230));
  text("Only Rose", 550, 200);

  textFont(startFont, 48);
  fill(0);
  text("B: Begin", 550, 300);
  text("1~7: Brushes", 550, 350);
  text("S: ScreenShot", 550, 400);
  text("Space: Restart", 550, 450);

  for (int i=0; i<num; i++) {
    x [i]=mouseX;
    y [i]=mouseY;
  }

  for (int i=0; i<StemNum; i++) {

    stemy [i] = mouseY;
    stemx [i] = mouseX;
  }
}
//+++++++++++++++++++++  draw   ++++++++++++++++++++++++++++   draw   ++++++++++++++++++++++++++++++
void draw() {

  if (drawState ==0) {   
    startDraw();
  }
  if (drawState ==1) {
    letsDraw();
  }
}

void startDraw() {
  image (startImg, 150, 150);
  if (keyPressed && key =='b') {
    drawState = 1;
  }
}

void letsDraw() {

  fill(0, 20);
  rect(width, height, width, height);
  image (bg, 0, 0);
  chooseBrush();
  if (brushState ==1) { //green plant
    brush1();
  }
  if (brushState ==2) { //bloom
    brush2();
  }

  if (brushState ==3) { //OnlyRose
    brush3();
  }
  if (brushState ==4) { //Stem
    brush4();
  }

  if (brushState ==5) { //butterfly
    brush5();
  }

  if (brushState ==6) { //SunFlower
    brush6();
  }

  if (brushState ==7) { //stemRose
    brush7();
  }
}

//+++++++++++++++++++++  define brush  +++++++++++++++++++++++++  define Image ++++++++++++++++++++++++++++++

void chooseBrush() {

  if (keyPressed) {
    fill(0);
    textFont(font, 37);
    if (key =='1') {
      text("1.Red Rose", 700, 700);
    }
    if (key =='2') {
      text("2.Purple bloom", 700, 700);
    }

    if (key =='3') {
      text( "3. Green Leaves", 700, 700);
    }

    if (key =='4') {
      text( "4. Brown stem ", 700, 700);
    }

    if (key =='5') {
      text( "5.Blue Butterfly", 700, 700);
    }

    if (key =='6') {
      text( "6.ink", 700, 700);
    }

    if (key =='7') {
      text( "7.Stem Roses", 700, 700);
    }

    if (key == 's') {
      screenShot();
    }
    if (key == ' ') {
      canvasNew();
    }
  }
}

  //+++++++++++++++++++++  choose Color +++++++++++++++++++++++++  ++++++++++++++++++++++++++++++

  //void chooseColor() {
  //  if (mousePressed) {
  //    if (mouseY>0&& mouseY<theBrush.height && mouseX>0 && mouseX<theBrush.width) {
  //      farbe = get(mouseX, mouseY);
  //    }
  //  }
  //  stroke(farbe);
  //}

  //+++++++++++++++++++++  KeyRealsed   ++++++++++++++++++++++++ Change Brush State  ++++++++++++++++++++++++++++++
  void keyReleased() {

    if (key =='1') {
      println("drawBrush1");
      brushState = 1;
    }

    if (key =='2') {
      println("drawBrush2");
      brushState = 2;
    }

    if (key =='3') {
      println("drawBrush3");
      brushState = 3;
    }

    if (key =='4') {
      println("drawBrush4");
      brushState = 4;
    }

    if (key =='5') {
      println("drawBrush5");
      brushState = 5;
    }
    if (key =='6') {
      println("drawBrush6");
      brushState = 6;
    }
    if (key =='7') {
      println("drawBrush7");
      brushState = 7;
    }
  }

  //+++++++++++++++++++++  Brush Functions  ++++++++++++++++++++++++ Different Brushes  +++++++++++++++++++++++++++
  // green grass
  void brush1() {
    translate(mouseX, mouseY);
    rotateX(a);
    rotateY(a*2);

    if (mousePressed) {
      noStroke();
      for (int i=1; i<num; i++) {
        x [i-1]= x[i];
        y [i-1]= y[i];
        //flowerLayer1
        fill(216, 11, random(7,80), 50);       
        rect(x[i], y[i], 60, 30); 
        rotateX(20);
        //flowerLayer2 
        fill(255, random(106, 136), 106, 60);
        rect(x[i], y[i]+20, 40, 70);
        rotateY(50);
        rotateX(50);

        a += 0.05;
      }
    }
  }


  // waterlily

  void brush2() {
    translate(mouseX, mouseY);
    rotateY(a*100);
    rotateX(0);
    rotateZ(a*0.5);

    if (mousePressed) {  
      for (int i=1; i<StemNum; i++) {
        stemx [i-1]=  stemx[i];
        stemy [i-1]= stemy[i];
        ellipseMode(CORNER);
        noStroke();
        fill(random(174, 222), 40, 247, 70);

        ellipse(stemx[i], stemy[i], random(15, 30), random(100, 150));
        rotateX(QUARTER_PI);
        rotateZ(PI);
        rotateY(10);
        a+=0.01;

        fill(random(222, 255), random(222, 255), random(222, 255), 90);
        ellipse(stemx[i], stemy[i]+100, random(30), random(20));
        rotateX(QUARTER_PI);
        rotateZ(PI);
        rotateY(PI);
      }
    }
  }



  void brush3() {

    translate(mouseX, mouseY);
    rotateY(a);
    rotateX(a*5);
    rotateZ(a);

    if (mousePressed) {
      for (int i=1; i<num; i++) {
        x [i-1]= x[i];
        y [i-1]= y[i];//the first point
        fill(random(0, 64), 113, 40, 80);
        noStroke();
        ellipseMode(CORNER);
        ellipse(x[i], y[i], random(20, 40), random(100, 150));
        rotateY(10);
        a+=0.05;
      }
    }
  }

  // stem
  void brush4() {
    noStroke();
    translate(mouseX, mouseY);
    if (mousePressed) {
      for (int i=1; i< StemNum; i++) {
        stemx[i-1] = stemx[i] ;
        stemy[i-1] =  stemy[i];  
        rotateX(10);
        fill(124, random(60, 89), 0, 95);
        ellipse(stemx[i], stemy[i], 30, random(35,40));
      }
    }
  }

  //butterfly
  void brush5() {
    translate(mouseX, mouseY);
    rotateY(a);
    rotateX(a);
    rotateZ(a*-0.5);
    noStroke();
    fill(66, random(77, 143), 214, 50);
    if (mousePressed) {  
      for (int i=1; i<num; i++) {
        x [i-1]= x[i];
        y [i-1]= y[i];//the first point
        ellipseMode(CORNER);
        ellipse(x[i], y[i], random(20, 40), random(100, 150));
        rotateY(10);
        a+=0.05;
      }
    }
  }
  //sun flower
  void brush6() {
    translate(mouseX, mouseY);
   // rotateY(a*0.1);
    rotateX(a);
    //rotateZ(a);
    noFill();
    // fill(0,80);
    stroke(3, 80);
    //strokecolor
    if (mousePressed) {  
      for (int i=1; i<num; i++) {
        x [i-1]= x[i];
        y [i-1]= y[i];
       // ellipseMode(CORNER);
        ellipse(x[i], y[i], random(20), random(70));
        //rotateZ(PI);
        a+=0.01;
        
      }
    }
  }

  //stemrose
  void brush7() {
    noStroke();
    translate(mouseX, mouseY);
    fill(252, random(146, 252), 20, 60);

    if (mousePressed) {
      for (int i=1; i<num; i++) {
        x [i-1]= x[i];
        y [i-1]= y[i];

        rotateX(random(QUARTER_PI, PI));        
        ellipse(x[i], y[i], random(50), random(50)); 
        rotateY(random(QUARTER_PI, PI));
      }
    }
  }


  //+++++++++++++++++++++  Drawing End ++++++++++++++++++++++++  ++++++++++++++++++++++++++
  void canvasNew() {
    setup();
    println("reset");
  }

  void screenShot() {
    saveFrame("screen-##.jpg");
  }


