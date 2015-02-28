
//EdouardLego 1.00.1

GUI gui;
PImage[] lego;
PImage lecture;
int MAXLEGO=74;
int nr=0;
boolean go=false;

PFont font;

void setup() {
  size(640,480,P2D);
  gui = new GUI("the gui",true);
  lego = new PImage[MAXLEGO];
  for (int i=0 ; i<MAXLEGO ; i++) {
    lego[i]=loadImage("Image_000"+nf(i,2)+".jpg");
  }
  lecture=loadImage("lecture.png");
  gui.createBouton("Lecture",lecture,(width-lecture.width)/2,(height-lecture.height)/2);
  
  font = loadFont("font.vlw");
  textFont(font);
  fill(#3065BF); //bleu
}

void mousePressed() {
  gui.mPressed();
}

void mouseReleased() {
  gui.mReleased();
}

void draw() {
  background(0);
  if (gui.top()==1) {
  go=true;
  gui.hide();
  }
  if (go) {
    frameRate(2);
    image(lego[nr],0,0);
    nr++;
    if (nr==MAXLEGO) {
      nr=0;
      go=false;
      gui.show();
      frameRate(30);
    } 
  } else {
      text("Counter Strike Lego",200,400);
    }
}






