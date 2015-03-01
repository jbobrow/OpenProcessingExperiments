
PImage im1, im2, im3;
float posX,posY;
PFont font1;
PFont font2;
float time = millis()*0.003;
int i=1;
  float sinofTime = sin(millis()*0.007);
  float sinMappedX = map(sinofTime,-1.0,1.0,123,143);
  float sinMappedY = map(sinofTime,-1.0,1.0,185,205);
  

void setup(){
  size(960,646);
  rectMode(CENTER);
  im1=loadImage("flower.jpg");
  im2=loadImage("butterfly.gif");
  im3=loadImage("oneflower.gif");
  font1 = loadFont("AppleBraille-Pinpoint6Dot-48.vlw");
  font2 = loadFont("8BITWONDERNominal-48.vlw");
}
void draw(){
  image(im1,0,0,960,646);
  textFont(font2);
  textAlign(CENTER,CENTER);
  fill(random(255),random(255),random(255),230);
  text("HELLO EVEYONE",random(380,420),height/2+250);
  float time = millis()*0.001; 
  posX = cos(time)*250+width/2;
  posY = sin(time)*150+height/2;
  float time1 = sin(millis()*0.001);
  float w = map(time1,-1.0,1.0,31,101);
  float h = map(time1,-1.0,1.0,72,142);
  image(im2,posX,posY,w,h);
  
  if(i>0){
  i=i+1;}
  translate(width/2,height/2);
  rotate(time);
  int R=20+i*2;
  int B=30+i*3;
  int r=R%255;
  int b=B%255;
  int I=i%255;
  fill(r,I,b,random(200,255));
  text("HAPPY!!",0,0);
  println(millis());
}


