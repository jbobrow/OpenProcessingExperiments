
//UCLA D|MA 28 Interactivity
//Assignment # 5
// "Mango New 'LookBook'"
//Laure Joumier

PImage Mango;
PImage Mango2;
PImage A;
PImage B;
PImage C;
PImage D;
PImage E;
PImage F;
PImage G;
PImage H;
PImage I;
PImage J;
PImage K;
int i;

int x1=200; //Mango sign position
int y1=50;

int w=300; //Pictures' size
int h=570;

int x=200; //Pictures' position
int y=390;

void setup() {
  size(400, 700);
  smooth();
  imageMode(CENTER);
  Mango = loadImage("Mango.png");
  Mango2 = loadImage("mango-logo.jpg");
  A = loadImage("A.png");
  B = loadImage("B.png");
  C = loadImage("C.png");
  D = loadImage("D.png");
  E = loadImage("E.png");
  F = loadImage("F.png");
  G = loadImage("G.png");
  H = loadImage("H.png");
  I = loadImage("I.png");
  J = loadImage("J.png");
  K = loadImage("K.png");
  frameRate(1);
}

void draw() {
  
//==To end Loop
  i++;
  if(i==25) {
   i = 0;
  }
//==End Picture
  background(0);  
  if(i==23 || i==24) {
   PFont font;
   font = loadFont("CorsivaHebrew-50.vlw");
   textFont(font);
   fill(255);
   text("New 'LookBook' by",10,270, width, height);  
   image(Mango2,210,370,300,100);
   noFill();
   
}
//==A
if (i==1 || i==2) {
  image(Mango,x1,y1,224,202);
  image(A,x,y,w,h);
}
//==B
if (i==3 || i==4) {
  image(Mango,x1,y1,224,202);
  image(B,x,y,w,h);
}
//==C
if (i==5 || i==6) {
  image(Mango,x1,y1,224,202);
  image(C,x,y,w,h);
}
//==D
if (i==7 || i==8) {
  image(Mango,x1,y1,224,202);
  image(D,x,y,w,h);
}
//==E
if (i==9 || i==10) {
  image(Mango,x1,y1,224,202);
  image(E,x,y,w,h);
}
//==F
if (i==11 || i==12) {
  image(Mango,x1,y1,224,202);
  image(F,x,y,w,h);
}
//==G
if (i==13 || i==14) {
  image(Mango,x1,y1,224,202);
  image(G,x,y,w,h);
}
//==H
if (i==15 || i==16) {
  image(Mango,x1,y1,224,202);
  image(H,x,y,w,h);
}
//==I
if (i==17 || i==18) {
  image(Mango,x1,y1,224,202);
  image(I,x,y,w,h);
}
//==J
if (i==19 || i==20) {
  image(Mango,x1,y1,224,202);
  image(J,x,y,w,h);
}
//==K
if (i==21 || i==22) {
  image(Mango,x1,y1,224,202);
  image(K,x,y,w,h);
}

//==END
}

