
String myText;
PFont myfont;

PImage pic;
PImage pic2;
PImage pic3;
PImage pic4;
PImage pic5;

float a=0;
int speed=3;
float b=100;
int bspeed=1;
float c=600;
int cspeed=1;
float d=200;
float dspeed=0.3;
float e=300;
float espeed=1.2;
float f=210;
float fspeed=0.3;


void setup(){
  size(600,600);
  smooth();
  myText = "Nature";
  myfont = loadFont("YDIGbsbO-KSCpc-EUC-H-48.vlw");
  pic = loadImage("1.JPG");
  pic2 = loadImage("2.JPG");
  pic3 = loadImage("3.JPG");
  pic4 = loadImage("4.JPG");
  pic5 = loadImage("5.JPG");
}

void draw(){
  background(240,240,250);
  image(pic,20,45);
  noTint();
  image(pic2,200,300);
  tint(200,200);
  image(pic3,300,500);
  tint(200,160);
  image(pic4,100,400);
  tint(200,250);
  image(pic5,400,80);
  tint(255,190);
  textSize(50);
  textFont(myfont);
  fill(200,140,255);
  a= a + speed;
  b=b+bspeed;
  text(myText,a,b);{
  if (a>410) {
    speed = -3;}
  if (a<0){
    speed = 2;}
  if (b>600) {
    bspeed = -2;}
  if (b<25){
    bspeed = 4;}
  }}

