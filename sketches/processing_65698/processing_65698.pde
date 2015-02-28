
//UCLA D|MA 28 Interactivity
//Assignment # 6
// "Mango New 'LookBook'" revised
// Laure Joumier

PImage Mango;
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

int x1=200; //Mango sign position
int y1=50;
int sz1 = 224;
int sz2 = 202;

int w=300; //Pictures' size
int h=570;
int distance = w + 30;

int startX = -300; //picture's position
int stopX = 500;

float x=startX; //Pictures' current position
int y=390;

float angle = 0.5;
float offset = 390;
float scalar = 20;
float speed = 0.05;

void setup() {
  size(400, 700);
  smooth();
  imageMode(CENTER);
  Mango = loadImage("Mango.png");
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
}

void draw() {

//CIRCLES
  float y = offset + sin(angle) * scalar;
  angle += speed;

//IMAGES
 background(0); 
//==A
  x += 1.5;
  image(Mango,x1,y1,sz1,sz2);
  image(A,x,y,w,h);    
//==B
  //image(Mango,x1,y1,224,202);
  image(B,x-distance,y,w,h);
//==C
  //image(Mango,x1,y1,224,202);
  image(C,x-(2*distance),y,w,h);
//==D
  //image(Mango,x1,y1,224,202);
  image(D,x-(3*distance),y,w,h);
//==E
  //image(Mango,x1,y1,224,202);
  image(E,x-(4*distance),y,w,h);
//==F
  //image(Mango,x1,y1,224,202);
  image(F,x-(5*distance),y,w,h);
//==G
  //image(Mango,x1,y1,224,202);
  image(G,x-(6*distance),y,w,h);
//==H
  //image(Mango,x1,y1,224,202);
  image(H,x-(7*distance),y,w,h);
//==I
  //image(Mango,x1,y1,224,202);
  image(I,x-(8*distance),y,w,h);
//==J
  //image(Mango,x1,y1,224,202);
  image(J,x-(9*distance),y,w,h);
//==K
  //image(Mango,x1,y1,224,202);
  image(K,x-(10*distance),y,w,h);
//==END

 //==CLIKABLE LOGO
if ( mousePressed && mouseX>=x1-sz1/2 && mouseX<= x1+sz1/2 && mouseY<=y1+sz2/15 && mouseY>= y1-sz2/6) {
  fill(255);
  link("http://shop.mango.com"); 
  }
 
  }

