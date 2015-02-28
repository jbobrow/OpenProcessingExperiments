
int m=0;
int n=0;

float x=200;
float y=250;
float directionX=240;
float directionY=260;

float x2=200;
float y2=220;
float directionX2=250;
float directionY2=290;

float x3=220;
float y3=250;
float directionX3=230;
float directionY3=300;

float x4=250;
float y4=270;
float directionX4=230;
float directionY4=260;

int a=0;
int b=0;
int c=0;
int d=0;


void setup() {
  size(500,500);
  smooth();
  background(10);
}
void draw() {
  //rotation
  stroke(random(12),random(37),random(131));
  strokeWeight(1); 
  pushMatrix();
  translate(width/2,height/2);
  for(int n=0; n<300; n++) {
      rotate(radians(10));
      if(mousePressed==true){
      fill(142,80,92);
      }else{
        fill(144,85,131);
      }
      ellipse(m,n,15,25);
      if(mousePressed==true){
      fill(31,58,100);
      }else{
        fill(55,103,103);
      }
      ellipse(m,n,25,15);
    }
  popMatrix(); 
  n=n+10;
  frameRate(100);
  if(n>500) {
    n=-10;
  }
  m=m+10;
  if(m>500) {
    m=-10;
  }
  //outer rectangle
  fill(149,92,130);
  rect(75,75,350,350);
  stroke(134,74,134);
  fill(65,170,138);
  for(int y=75; y<430; y+=10) {
    for( int x=75; x<430; x+=10) {
      rect(x,y,random(10), random(10));
    }
  }
  //outer rect
  stroke(random(134),random(74),random(134));
  fill(65,170,138);
  for(int a=80; a<430; a+=10) {
    ellipse(a,425,random(25),random(25));
  }
  for(int c=80; c<430; c+=10) {
    ellipse(425,c,random(25),random(25));
  }

  for(int b=80; b<430; b+=10) {
    ellipse(b,75,random(25),random(25));
  }
  for(int d=80; d<430; d+=10) {
    ellipse(75,d,random(25),random(25));
  }

  //inner rect
  fill(162,115,147);
  rect(140,120,230,230);

  //bouncing ball1
  x +=directionX;
  y +=directionY;
  fill(random(185),random(144),random(164));
  ellipse(x,y,15,15);
  if(x >350) {
    directionX = -9;
  }
  if(y > 350) {
    directionY = -15;
  }
  if(x < 150) {
    directionX = 14;
  }
  if(y < 150) {
    directionY = 17;
  }
  //ball2
  x2 +=directionX2;
  y2 +=directionY2;
  ellipse(x2,y2,18,18);
  if(x2 > 350) {
    directionX2 = -10;
  }
  if(y2 >350) {
    directionY2 = -16;
  }
  if(x2 < 150) {
    directionX2 = 10;
  }
  if(y2 < 150) {
    directionY2 = 13;
  }
  //ball3
  x3 +=directionX3;
  y3 +=directionY3;
  ellipse(x3,y3,21,21);
  if(x3 > 350) {
    directionX3 = -7;
  }
  if(y3 >350) {
    directionY3 = -14;
  }
  if(x3 < 150) {
    directionX3 = 8;
  }
  if(y3 < 150) {
    directionY3 = 12;
  }
  //ball4
  x4 +=directionX4;
  y4 +=directionY4;
  ellipse(x4,y4,24,24);
  if(x4 > 350) {
    directionX4 = -9;
  }
  if(y4 >350) {
    directionY4 = -11;
  }
  if(x4 < 150) {
    directionX4 = 7;
  }
  if(y4 < 150) {
    directionY4 = 14;
  }
  //inner rect
  fill(84,185,166);
  stroke(random(131),random(12),random(14));
  for(int a=140; a<370; a+=10) {
    ellipse(a,350,random(25),random(25));
  }
  for(int b=135; b<370; b+=10) {
    ellipse(140,b,random(20), random(20));
  }
  for (int c=140; c<370;c+=10) {
    ellipse(370,c,random(20),random(25));
  }
  for(int d=135; d<370; d+=10) {
    ellipse(d,120,random(25),random(25));
  }
}


