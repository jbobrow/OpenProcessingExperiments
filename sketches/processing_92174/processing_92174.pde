
float x=0;
float y=270;
float j=0;
float j2=0;
float s=1;
float t1=500;
float tx=width+2000;
float tp=1;
 float xpos=width+1550;
float ypos= random(200,400);
float px = random (75,300);
 float xpos1=random(width+1600,width+1800);
float ypos1= random(200,400);
float px1 = random (75,300);
 float xpos2=random(width+1800,width+1900);
float ypos2= random(200,400);
float px2 = random (75,300);
 float xpos3=random (width+1900,2000);
float ypos3= random(200,400);
float px3 = random (75,300);
 float xpos4=random(width+2000,width+2100);
float ypos4= random(200,400);
float px4 = random (75,300);
 float xpos5=random(width+2100,width+2200);
float ypos5= random(200,400);
float px5 = random (75,300);
float xspeed=-5;
int yards=0;
int d=0;
int hs=0;
PFont f;
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage imgj;
PImage tony1;
PImage tony2;
PImage tony3;
PImage tony4;
PImage tony5;
PImage tony6;
PImage tony7;
PImage tony;
PImage imgd;
void setup() {
  size(1000,500);
f= createFont("OCRAStd",16,true);
img1 = loadImage("KR2.png");
img2 = loadImage("KR3.png");
img3 = loadImage("KR5.png");
img4 = loadImage("KR4.png");
img5 = loadImage("KR6.png");
img6 = loadImage("KR7.png");
img7 = loadImage("KR8.png");
imgj = loadImage("KJ1.png");
tony1 = loadImage("tony1.png");
tony2 = loadImage("tony2.png");
tony3 = loadImage("tony3.png");
tony4 = loadImage("tony4.png");
tony5 = loadImage("tony5.png");
tony6 = loadImage("tony6.png");
tony7 = loadImage("tony7.png");
imgd = loadImage("imgd.png");
frameRate(30);
}
void draw() {
  background(0);
  String yrds="DISTANCE:" + yards;
  String high="HIGHSCORE:" + hs;
  textFont(f,24);
  fill(255);
  textAlign(LEFT);
  text(yrds,30,450);
  text(high,700,450);
  if (yards>hs) {
    hs=yards;
  }
  yards=yards+1;
  if (x==400) {
  t1=t1-yards/15;
  }if (d>0) {
    image(imgd,width/2,380);
    x=-500;
    textFont(f,24);
    fill(255);
    textAlign(CENTER);
    text("GAME OVER",width/2,450);
    textFont(f,16);
    text("click to play again",width/2,475);
    d=2;
  }if (d==2) {
    noLoop();
  }
  textFont(f,36);
fill(255);
textAlign(CENTER);
text("The Adventures of",t1,40);
textFont(f,55);
fill(random(255),random(255),random(255));
text("K-TOWN",t1,100);
textFont(f,12);
fill(255);
text("Use SPACE key to jump.",t1,130);
if (yards>300) {
  stroke(0);
    fill(random(255),random(255),random(255));
    rectMode(CORNER);
 rect(xpos,ypos,px,15);
  xpos = xpos + xspeed;
    if (xpos < random(-550,-1500)) {
      xpos = random(width+150,width+550);
      ypos = random(200,350);
      px = random (100,300);
    }
       rect(xpos1,ypos1,px1,15);
  xpos1 = xpos1 + xspeed;
    if (xpos1 < random(-550,-1500)) {
      xpos1 = random(width+450,width+750);
      ypos1 = random(200,350);
      px1 = random (100,300);
}
 rect(xpos2,ypos2,px2,15);
  xpos2 = xpos2 + xspeed;
    if (xpos2 < random(-550,-1500)) {
      xpos2 = random(width+650,width+950);
      ypos2 = random(200,350);
      px2 = random (100,300);
    }
     rect(xpos3,ypos3,px3,15);
  xpos3 = xpos3 + xspeed;
    if (xpos3 < random(-550,-1500)) {
      xpos3 = random(width+850,width+1050);
      ypos3 = random(200,350);
      px3 = random (100,300);
    }
     rect(xpos4,ypos4,px4,15);
  xpos4 = xpos4 + xspeed;
    if (xpos4 < random(-550,-1500)) {
      xpos4 = random(width+950,width+1250);
      ypos4 = random(200,350);
      px4 = random (100,300);
    }
     rect(xpos5,ypos5,px5,15);
  xpos5 = xpos5 + xspeed;
    if (xpos5 < random(-550,-1500)) {
      xpos5 = random(width+1150,width+1450);
      ypos5 = random(200,350);
      px5 = random (100,300);
    }
if (tp>8) {
  tp=1;
}
if (tp<2) {
  tony=tony1;
}else if (tp<3) {
  tony=tony2;
}else if (tp<4) {
  tony=tony3;
}else if (tp<5) {
  tony=tony4; 
  }else if (tp<6) {
    tony=tony5;
  }else if (tp<7) {
    tony=tony6;
  }else if (tp<8) {
    tony=tony7;
  }
  if (tx<random(-1500,-1000)) {
  tx=width+30;
}
image(tony,tx,280);
tp=tp+.5;
tx=tx-5;

}
 if (s>8) {
   s=1;
 } if (x<400) {
 x=x+8;
 }
 if (s>0) {
  s=s+.5;
 }
 if (s<1) {
   img=imgj;
 }else if (s<2) {
    img=img1;
  } else if (s<3) {
  img=img2;
  }else if (s<4) {
    img=img3;   
  }else if (s<5) {
    img=img4;
  }else if (s<6) {
    img=img5;
  }else if (s<7) {
    img=img6;
  }else if (s<8) {
    img=img7;
  }
  image(img,x,y);
  if ((x+50>tx && x<tx+30) && (y+130>280)) {
  d=1;
  }
  if ((x+50>xpos && x<xpos+px) && (y+130>ypos-5 && y+130<ypos+5)) {
    j=0;
    j2=0;
    if (s<1) {
    s=1;
    }
  }else if ((x+50>xpos1 && x<xpos1+px1) && (y+130>ypos1-5 && y+130<ypos1+5)) {
    j=0;
    j2=0;
    if (s<1) {
    s=1;
    }
  }else if ((x+50>xpos2 && x<xpos2+px2) && (y+130>ypos2-5 && y+130<ypos2+5)) {
    j=0;
    j2=0;
    if (s<1) {
    s=1;
    }
  }else if ((x+50>xpos3 && x<xpos3+px3) && (y+130>ypos3-5 && y+130<ypos3+5)) {
    j=0;
    j2=0;
    if (s<1) {
    s=1;
    }
  }else if ((x+50>xpos4 && x<xpos4+px4) && (y+130>ypos4-5 && y+130<ypos4+5)) {
    j=0;
    j2=0;
    if (s<1) {
    s=1;
    }
  }else if ((x+50>xpos5 && x<xpos5+px5) && (y+130>ypos5-5 && y+130<ypos5+5)) {
    j=0;
    j2=0;
    if (s<1) {
    s=1;
    }
  }else if (y<270) {
    if (j==0) {
    j2=1;
  }
  }
  if (j<0) {
    s=0;
  }
  
  if (j==-26) {
    j2=1;
  }
  if (y>270) {
    y=270;
    j2=0;
    j=0;
    s=s+.5;
  }
  if (j2==1) {
    y=y+5;
  }
}
void keyReleased() {
  if (key==' ') {
    if (j2==0) {
      j2=1;
    }
  }
}

void keyPressed() {
if (key==' ') {
  if (j2==0) {
  j=j-2;
  y=y+j;
  }
}
}
void mousePressed() {
  if (d>0) {
  loop();
  d=0;
 x=0;
 y=270;
 j=0;
 j2=0;
 s=1;
 t1=500;
 tx=width+2000;
 tp=1;
 xpos=width+1550;
 ypos= random(200,400);
 px = random (75,300);
 xspeed=-5;
 yards=0;
 xpos1=random(width+1600,width+1800);
 ypos1= random(200,400);
 px1 = random (75,300);
 xpos2=random(width+1800,width+1900);
 ypos2= random(200,400);
 px2 = random (75,300);
 xpos3=random (width+1900,2000);
 ypos3= random(200,400);
 px3 = random (75,300);
 xpos4=random(width+2000,width+2100);
 ypos4= random(200,400);
 px4 = random (75,300);
 xpos5=random(width+2100,width+2200);
 ypos5= random(200,400);
 px5 = random (75,300);
  }
}

