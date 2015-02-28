
PFont txt;
float Lx=125;
float Ly=125;
float Sx=125;
float Sy=125;
float speedX=random(1,2);
float speedY=random(1,2);
float speedX1=random(1,2);
float speedY1=random(1,2);
float R=0;
 
void setup() {
  size(250,250);
  smooth();
  frameRate(24);
  textMode(CENTER);
  txt = loadFont("ZapfChanceryITCbyBT-Bold-48.vlw");
}
 
void draw() {
  background(100,125,72);
  R+=.01;
   
  pushMatrix();
  translate(Lx,Ly);
  rotate(R*-1);
  textFont(txt,60);
  text("L",0,0);
  popMatrix();
   
  if(Lx<0 || Lx>250) {
    speedX *= -1;
  }
  if(Ly<0 || Ly>250) {
    speedY*= -1;
  }
  if(Lx<0) {
    Lx=0;
  }
  else if(Ly>250) {
    Ly=250;
  }
  Lx+=speedX;
  Ly+=speedY;
   
  pushMatrix();
  translate(Sx,Sy);
  rotate(R);
  textFont(txt,60);
  text("7",0,0);
  popMatrix();
   
   
  if(Sx<0 || Sx>250) {
    speedX1 *= -1;
  }
  if(Sy<0 || Sy>250) {
    speedY1 *= -1;
  }
  if(Sx<0) {
    Sx=0;
  }
  else if(Sy>250) {
    Sy=250;
  }
  Sx+=speedX1;
  Sy+=speedY1;
}

