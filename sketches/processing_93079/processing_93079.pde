
float x=100;
float y=200;
int bg=0;
float s=1;
int lvl=1;
int mode=0;
float wet=480;
int p2=0;
int p3=0;
int textf =24;
//
float x0=0;
float y0=270;
float j=0;
float j2=0;
float s0=1;
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
int hs=2500;

//cloud.
  color c=255;
  float xcloud=500;
  float ycloud=140;
  float dcloud=2;
  float ds;
  float rx=random(xcloud-40,xcloud+40);
  float ry=ycloud+40;
   float rx1=random(xcloud-40,xcloud+40);
  float ry1=ycloud+40;
   float rx2=random(xcloud-40,xcloud+40);
  float ry2=ycloud+40;
   float rx3=random(xcloud-40,xcloud+40);
  float ry3=ycloud+40;
   float rx4=random(xcloud-40,xcloud+40);
  float ry4=ycloud+40;
   float rx5=random(xcloud-40,xcloud+40);
  float ry5=ycloud+40;
  
  color c1=255;
  float xcloud1=900;
  float ycloud1=50;
  float dcloud1=-2;
  float ds1;
  float rx0=random(xcloud1-40,xcloud1+40);
  float ry0=ycloud1+40;
   float rx10=random(xcloud1-40,xcloud1+40);
  float ry10=ycloud1+40;
   float rx20=random(xcloud1-40,xcloud1+40);
  float ry20=ycloud1+40;
   float rx30=random(xcloud1-40,xcloud1+40);
  float ry30=ycloud1+40;
   float rx40=random(xcloud1-40,xcloud1+40);
  float ry40=ycloud1+40;
   float rx50=random(xcloud1-40,xcloud1+40);
  float ry50=ycloud1+40;
  
  //shit.
PFont f;
PImage img;	
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;
PImage img11;
PImage img12;
PImage img13;
PImage img14;
PImage img15;
PImage img16;
//
PImage img0;
PImage img100;
PImage img20;
PImage img30;
PImage img40;
PImage img50;
PImage img60;
PImage img70;
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
  img1 = loadImage("KR1.png");
img2 = loadImage("KR2.png");
img3 = loadImage("KR3.png");
img4 = loadImage("KR5.png");
img5 = loadImage("KR4.png");
img6 = loadImage("KL1.png");
img7 = loadImage("KL2.png");
img8 = loadImage("KL3.png");
img9 = loadImage("KL5.png");
img10 = loadImage("KL4.png");
img11 = loadImage("KR6.png");
img12 = loadImage("KR7.png");
img13 = loadImage("KR8.png");
img14 = loadImage("KL6.png");
img15 = loadImage("KL7.png");
img16 = loadImage("KL8.png");
//
img100 = loadImage("KR20.png");
img20 = loadImage("KR30.png");
img30 = loadImage("KR50.png");
img40 = loadImage("KR40.png");
img50 = loadImage("KR60.png");
img60 = loadImage("KR70.png");
img70 = loadImage("KR80.png");
tony1 = loadImage("tony1.png");
tony2 = loadImage("tony2.png");
tony3 = loadImage("tony3.png");
tony4 = loadImage("tony4.png");
tony5 = loadImage("tony5.png");
tony6 = loadImage("tony6.png");
tony7 = loadImage("tony7.png");
imgd = loadImage("imgd.png");
imgj = loadImage("KJ1.png");
frameRate(30);
}

void draw() {
  if (mode==1) {
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
  if (x0==400) {
  t1=t1-yards/15;
  }if (d>0) {
    if (hs<2501) {
    image(imgd,width/2,380);
    x0=-500;
    textFont(f,24);
    fill(255);
    textAlign(CENTER);
    text("GAME OVER",width/2,450);
    textFont(f,16);
    text("click to play again",width/2,475);
    d=2;
    }else if (hs>2500) {
      image(imgd,width/2,380);
    x0=-500;
    textFont(f,24);
    fill(255);
    textAlign(CENTER);
    text("You won!",width/2,450);
    textFont(f,16);
    text("keep playing?",300,475);
    text("Dear God, no.",700,475);
    d=2;
    }
  }if (d==2) {
    noLoop();
  }
  textFont(f,36);
fill(255);
textAlign(CENTER);
text("The Jumpathon of",t1,40);
textFont(f,55);
fill(random(255),random(255),random(255));
text("K-TOWN",t1,100);
textFont(f,12);
fill(255);
text("Hold SPACE key to jump.",t1,130);
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
 if (s0>8) {
   s0=1;
 } if (x0<400) {
 x0=x0+8;
 }
 if (s0>0) {
  s0=s0+.5;
 }
 if (s0<1) {
   img0=imgj;
 }else if (s0<2) {
    img0=img100;
  } else if (s0<3) {
  img0=img20;
  }else if (s0<4) {
    img0=img30;   
  }else if (s0<5) {
    img0=img40;
  }else if (s0<6) {
    img0=img50;
  }else if (s0<7) {
    img0=img60;
  }else if (s0<8) {
    img0=img70;
  }
  image(img0,x0,y0);
  if ((x0+50>tx && x0<tx+30) && (y0+130>280)) {
  d=1;
  }
  if ((x0+50>xpos && x0<xpos+px) && (y0+130>ypos-5 && y0+130<ypos+5)) {
    j=0;
    j2=0;
    if (s0<1) {
    s0=1;
    }
  }else if ((x0+50>xpos1 && x0<xpos1+px1) && (y0+130>ypos1-5 && y0+130<ypos1+5)) {
    j=0;
    j2=0;
    if (s<1) {
    s=1;
    }
  }else if ((x0+50>xpos2 && x0<xpos2+px2) && (y0+130>ypos2-5 && y0+130<ypos2+5)) {
    j=0;
    j2=0;
    if (s0<1) {
    s0=1;
    }
  }else if ((x0+50>xpos3 && x0<xpos3+px3) && (y0+130>ypos3-5 && y0+130<ypos3+5)) {
    j=0;
    j2=0;
    if (s0<1) {
    s0=1;
    }
  }else if ((x0+50>xpos4 && x0<xpos4+px4) && (y0+130>ypos4-5 && y0+130<ypos4+5)) {
    j=0;
    j2=0;
    if (s0<1) {
    s0=1;
    }
  }else if ((x0+50>xpos5 && x0<xpos5+px5) && (y0+130>ypos5-5 && y0+130<ypos5+5)) {
    j=0;
    j2=0;
    if (s0<1) {
    s0=1;
    }
  }else if (y0<270) {
    if (j==0) {
    j2=1;
  }
  }
  if (j<0) {
    s0=0;
  }
  
  if (j==-26) {
    j2=1;
  }
  if (y0>270) {
    y0=270;
    j2=0;
    j=0;
    s0=s0+.5;
  }
  if (j2==1) {
    y0=y0+5;
  }
}
//Fuck.
 if (mode==0) {
  background(0);
if (lvl==1) {
background(0);
textFont(f,36);
fill(255);
textAlign(CENTER);
text("The Adventures of", width/2,40);
textFont(f,55);
fill(random(255),random(255),random(255));
text("K-TOWN", width/2,100);
textFont(f,12);
fill(255);
text("Use arrow keys to move.",width/2,130);
stroke(255);
line(0,400,1000,400);
}
if (lvl==2) {
  background(165,234,247);
  fill(36,162,20);
  stroke(0,400,1000,400);
  rect(0,400,400,400);
 rect(600,400,1000,400);
   noStroke();
   fill(0,0,255);
   rect(400,wet,200,400);
   fill(100,76,14);
   rect(410,wet-15,180,15);
  if (wet<415) {
    wet=415;
    p2=1;
  }
  if (p2==0) {
    if (x>350) {
      x=350;
    } if (x==350) {
     textFont(f,18);
      fill(255);
      textAlign(LEFT);
      text("Hmm, no way across...",650,430);
      text("Try clicking shit?", 670,470);
    }
  }
    fill(c);
    ellipseMode(CENTER);
    ellipse(xcloud,ycloud,20,20);
    ellipse(xcloud+10,ycloud+10,20,20);
    ellipse(xcloud+10,ycloud-10,20,20);
    ellipse(xcloud+15,ycloud+5,20,20);
    ellipse(xcloud-10,ycloud-10,20,20);
    ellipse(xcloud-10,ycloud+10,20,20);
    ellipse(xcloud-15,ycloud+5,20,20);
    ellipse(xcloud,ycloud-15,20,20);
    ellipse(xcloud,ycloud+15,20,20);
    ellipse(xcloud-20,ycloud+5,20,20);
    ellipse(xcloud+20,ycloud+5,20,20);
    //Check it.
    xcloud = xcloud+dcloud;
    if (ds>5) {
      ds=0;
    }
      rx = random(xcloud-40,xcloud+40);
rx1 = random(xcloud-40,xcloud+40);
rx2 = random(xcloud-40,xcloud+40);
rx3 = random(xcloud-40,xcloud+40);
rx4 = random(xcloud-40,xcloud+40);
rx5 = random(xcloud-40,xcloud+40);
    if (xcloud > width+40) {
      xcloud = -40;
    }else if (c<0) {
      c=0;
    }else if (xcloud<-40) {
      xcloud = width+40;
    }else if (mousePressed) {
    if((mouseX>xcloud-40 && mouseX<xcloud+40) && (mouseY>ycloud-40 && mouseY<ycloud+40)) {
      c=c-10;
    }
    }if (c<50) {
      if (ds==0) {
    stroke(0,0,255);
  line(rx,ry,rx,ry+10);
  ds=ds+1;
      }
  ry=ry+10;
  if (ry>390) {
    ry=ycloud+40;
    wet=wet-.2;
  }
  if (ds==1) {
  stroke(0,0,255);
  line(rx1,ry1,rx1,ry1+10);
  ds=ds+1;
  }
  ry1=ry1+10;
  if (ry1>390) {
    ry1=ycloud+40;
    wet=wet-.2;
  }
  if (ds==2) {
  stroke(0,0,255);
  line(rx2,ry2,rx2,ry2+10);
  ds=ds+1;
  }
  ry2=ry2+10;
  if (ry2>390) {
    ry2=ycloud+40;
    wet=wet-.2;
  }
  if (ds==3) {
  stroke(0,0,255);
  line(rx3,ry3,rx3,ry3+10);
  ds=ds+1;
  }
  ry3=ry3+10;
  if (ry3>390) {
    ry3=ycloud+40;
    wet=wet-.2;
  }
  if (ds==4) {
  stroke(0,0,255);
  line(rx4,ry4,rx4,ry4+10);
  ds=ds+1;
  }
  ry4=ry4+10;
  if (ry4>390) {
    ry4=ycloud+40;
    wet=wet-.2;
  }
  if (ds==5) {
  stroke(0,0,255);
  line(rx5,ry5,rx5,ry5+10);
  ds=ds+1;
  }
  ry5=ry+10;
  if (ry5>390) {
    ry5=ycloud+40;
    wet=wet-.2;
  }
    }
    //1
    fill(c1);
    noStroke();
    ellipseMode(CENTER);
    ellipse(xcloud1,ycloud1,20,20);
    ellipse(xcloud1+10,ycloud1+10,20,20);
    ellipse(xcloud1+10,ycloud1-10,20,20);
    ellipse(xcloud1+15,ycloud1+5,20,20);
    ellipse(xcloud1-10,ycloud1-10,20,20);
    ellipse(xcloud1-10,ycloud1+10,20,20);
    ellipse(xcloud1-15,ycloud1+5,20,20);
    ellipse(xcloud1,ycloud1-15,20,20);
    ellipse(xcloud1,ycloud1+15,20,20);
    ellipse(xcloud1-20,ycloud1+5,20,20);
    ellipse(xcloud1+20,ycloud1+5,20,20);
    //Check it.
    xcloud1 = xcloud1+dcloud1;
    if (ds1>5) {
      ds1=0;
    }
      rx0 = random(xcloud1-40,xcloud1+40);
rx10 = random(xcloud1-40,xcloud1+40);
rx20 = random(xcloud1-40,xcloud1+40);
rx30 = random(xcloud1-40,xcloud1+40);
rx40 = random(xcloud1-40,xcloud1+40);
rx50 = random(xcloud1-40,xcloud1+40);
    if (xcloud1 > width+40) {
      xcloud1 = -40;
    }else if (c1<0) {
      c1=0;
    }else if (xcloud1<-40) {
      xcloud1 = width+40;
    }else if (mousePressed) {
    if((mouseX>xcloud1-40 && mouseX<xcloud1+40) && (mouseY>ycloud1-40 && mouseY<ycloud1+40)) {
      c1=c1-10;
    }
    }if (c1<50) {
      if (ds1==0) {
    stroke(0,0,255);
  line(rx0,ry0,rx0,ry0+10);
  ds1=ds1+1;
      }
  ry0=ry0+10;
  if (ry0>390) {
    ry0=ycloud1+40;
    wet=wet-.2;
  }
  if (ds1==1) {
  stroke(0,0,255);
  line(rx10,ry10,rx10,ry10+10);
  ds1=ds1+1;
  }
  ry10=ry10+10;
  if (ry10>390) {
    ry10=ycloud1+40;
    wet=wet-.2;
  }
  if (ds1==2) {
  stroke(0,0,255);
  line(rx20,ry20,rx20,ry20+10);
  ds1=ds1+1;
  }
  ry20=ry20+10;
  if (ry20>390) {
    ry20=ycloud1+40;
    wet=wet-.2;
  }
  if (ds1==3) {
  stroke(0,0,255);
  line(rx30,ry30,rx30,ry30+10);
  ds1=ds1+1;
  }
  ry30=ry30+10;
  if (ry30>390) {
    ry30=ycloud1+40;
    wet=wet-.2;
  }
  if (ds1==4) {
  stroke(0,0,255);
  line(rx40,ry40,rx40,ry40+10);
  ds1=ds1+1;
  }
  ry40=ry40+10;
  if (ry40>390) {
    ry40=ycloud1+40;
    wet=wet-.2;
  }
  if (ds1==5) {
  stroke(0,0,255);
  line(rx50,ry50,rx50,ry50+10);
  ds1=ds1+1;
  }
  ry50=ry0+10;
  if (ry50>390) {
    ry50=ycloud1+40;
    wet=wet-.2;
  }
    }
}
//word.
if (lvl==3) {
  image(tony1,800,200,80,200);
  if (p3==0) {
    if (x>700) {
     x=700;
    }
    if (x==700) {
     fill(255);
     noStroke();
     ellipse(750,150,200,200);
     triangle(834,238,755,184,788,165);
     textFont(f,12);
fill(0);
textAlign(CENTER);
text("Not so fast man.",755,100);
text("Beat my HIGHSCORE in",755,120);
text("the K-Town Jumpathon",755,140);
text("and I might",755,160);
text("let you pass.",755,180);
textFont(f,textf);
fill(255);
text("PLAY?",800,450);
if((mouseX>756 && mouseX<845) && (mouseY>432 && mouseY<455)) {
textf=30;
if (mousePressed) {
  mode=1;
}
}else 
textf=24;
    }
  }
}

  if (x>width) {
  x=0;
  lvl=lvl+1;
  }
  if (x<0) {
    x=0;
  }
 if (s>8) {
  s=2;
  }else if (s<-7) {
    s=-1;
  }
  if (s==1) {
    img=img1;
  } else if (s==2) {
  img=img2;
  }else if (s==3) {
    img=img3;
  }else if (s==4) {
    img=img4;
  }else if (s==5) {
    img=img5;
  }else if (s==0) {
    img=img6;
  }else if (s==-1) {
    img=img7;
  }else if (s==-2) {
    img=img8;
  }else if (s==-3) {
    img=img9;
  }else if (s==-4) {
    img=img10;
  }else if (s==6) {
    img=img11;
  }else if (s==7) {
    img=img12;
  }else if (s==8) {
    img=img13;
  }else if (s==-5) {
    img=img14;
  }else if (s==-6) {
    img=img15;
  }else if (s==-7) {
    img=img16;
  }
  image(img,x,y);      
}

}
void keyReleased() {
  if (mode==1) {
    if (key==' ') {
  if (j2==0) {
  j2=1;
  }
}
  }else if (mode==0) {
 if (s>0) {
    s=1;
  }else {
    s=0;
  }
}
}
void keyPressed() {
  if (mode==1) {
    if (key==' ') {
  if (j2==0) {
  j=j-2;
  y0=y0+j;
  }
}
  }else if (mode==0) {
  if (key==CODED) {
    if (keyCode==RIGHT) {
      x=x+15;
      s=s+1;
      if (s<1) {
      s=1;
      }
    } else if (keyCode==LEFT) {
      x=x-15;
      s=s-1;
      if (s>0) {
        s=0;
      }
    } 
  }
}
}

void mousePressed() {
  if (mode==1) {
  if (d>0) {
    if (hs<2501) {
  loop();
  d=0;
 x0=0;
 y0=270;
 j=0;
 j2=0;
 s0=1;
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
  }else if (hs>2500) {
    if((mouseX>250 && mouseX<350) && (mouseY>460 && mouseY<490)) {  
      loop();
  d=0;
 x0=0;
 y0=270;
 j=0;
 j2=0;
 s0=1;
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
  }else if (hs>2500) {
    if((mouseX>650 && mouseX<750) && (mouseY>460 && mouseY<490)) { 
     loop();
      mode=0;
      p3=1;
    }
  }
  }
}else 
println(mode);
//println(mouseY);
}

