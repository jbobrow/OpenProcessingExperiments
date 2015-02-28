
float x=100;
float y=200;
float s=1;
float z=500;
int l=1;
//
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
PImage park;
PImage woods;
PImage tree;
PImage night;
PImage space;
PImage KJ;  
PImage KJ2;
PImage KJ3;
PImage KJ4;
PImage KJ5;
PImage KJ6;
PImage KJ7;
PImage KJ8;
//
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
park = loadImage("trailerpark.png");
woods = loadImage("redwoods.png");
tree = loadImage("tree.png");
night = loadImage("night.jpg");
space = loadImage("space.png");
  KJ = loadImage("KJ.png");
KJ2 = loadImage("kJ2.png");
KJ3 = loadImage("KJ3.png");
KJ4 = loadImage("KJ4.png");
KJ5 = loadImage("KJ5.png");
KJ6 = loadImage("KJ6.png");
KJ7 = loadImage("KJ7.png");
KJ8 = loadImage("KJ8.png");
}
//
void draw() {
  background(-z);
textFont(f,36);
fill(255);
textAlign(CENTER);
text("The Adventures of", z,40);
textFont(f,55);
fill(random(255),random(255),random(255));
text("K-TOWN", z,100);
textFont(f,12);
fill(255);
text("Use arrow keys to walk.",z,130);
stroke(255);
image(park,z+1500,-1400,5000,3500);
image(woods,z+6500,-1400,5000,3500);
image(night, z+11700,-100,1400,700);
image(space,z+13000,-1400,5000,3500);
fill(0);
noStroke();
rect(z+16500,0,2500,500);
fill(142,100,56);
rect(z+1500,400,10000,400);
fill(9,129,10);
rect(z+1500,400,10000,20);
fill(142,100,56);
rect(z+11700,450,1500,400);
fill(9,129,10);
rect(z+11700,450,1500,20);
if (z<-11200) {
  y=250;
}
if (z>-300) {
stroke(255);
line(z-500,400,1500,400);
}
//
if (x>width/2) {
  x=width/2;
  z=z-10;
  
  }
  if (x<0) {
    x=0;
  }
  if (l==1) {
 if (s>8) {
  s=2;
  }else if (s<-7) {
    s=-1;
  }
  }else if (l==0) {
    if (s>8) {
      s=1;
    }
  }
  if (l==1) {
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
   }
   if (l==0) {
     if (s==1) {
    img=KJ;
  } else if (s==2) {
  img=KJ2;
  }else if (s==3) {
    img=KJ3;
  }else if (s==4) {
    img=KJ4;
  }else if (s==5) {
    img=KJ5;
  }else if (s==6) {
    img=KJ6;
  }else if (s==7) {
    img=KJ7;
  }else if (s==8) {
    img=KJ8;
  }
  }
  if (l==0) {
   if (z<-17000) {
     if (s==1) {
       l=1;
       z=1500;
       y=200;
     }
   }
  }
  if (z<-12500) {
    l=0;
  }
  if(l==0) {
  image(img,x,y-50, 400, 300);
  x=x+15;
  s=s+1;
  frameRate(20);
  }
  if (l==1) {
  image(img,x,y);
  }
  image(tree,z+11200,0,1000,1000);
  image(tree,z+12700,0,1000,1000);
 fill(255,255);
rect(z+1380,0,120,height);
fill(255,245);
rect(z+1370,0,10,height);
fill(255,235);
rect(z+1360,0,10,height);
fill(255,225);
rect(z+1350,0,10,height);
fill(255,215);
rect(z+1340,0,10,height);
fill(255,205);
rect(z+1330,0,10,height);
fill(255,195);
rect(z+1320,0,10,height);
fill(255,185);
rect(z+1310,0,10,height);
fill(255,175);
rect(z+1300,0,10,height);
fill(255,165);
rect(z+1290,0,10,height);
fill(255,155);
rect(z+1280,0,10,height);
fill(255,145);
rect(z+1270,0,10,height);
fill(255,135);
rect(z+1260,0,10,height);
fill(255,125);
rect(z+1250,0,10,height);
fill(255,105);
rect(z+1240,0,10,height);
fill(255,95);
rect(z+1230,0,10,height);
fill(255,85);
rect(z+1220,0,10,height);
fill(255,75);
rect(z+1210,0,10,height);
fill(255,65);
rect(z+1200,0,10,height);
fill(255,55);
rect(z+1190,0,10,height);
fill(255,45);
rect(z+1180,0,10,height);
fill(255,35);
rect(z+1170,0,10,height);
fill(255,25);
rect(z+1160,0,10,height);
fill(255,15);
rect(z+1150,0,10,height);
fill(255,5);
rect(z+1140,0,10,height);
  //
fill(255,255);
rect(z+1500,0,10,height);
fill(255,245);
rect(z+1510,0,10,height);
fill(255,235);
rect(z+1520,0,10,height);
fill(255,225);
rect(z+1530,0,10,height);
fill(255,215);
rect(z+1540,0,10,height);
fill(255,205);
rect(z+1550,0,10,height);
fill(255,195);
rect(z+1560,0,10,height);
fill(255,185);
rect(z+1570,0,10,height);
fill(255,175);
rect(z+1580,0,10,height);
fill(255,165);
rect(z+1590,0,10,height);
fill(255,155);
rect(z+1600,0,10,height);
fill(255,145);
rect(z+1610,0,10,height);
fill(255,135);
rect(z+1620,0,10,height);
fill(255,125);
rect(z+1630,0,10,height);
fill(255,115);
rect(z+1640,0,10,height);
fill(255,105);
rect(z+1650,0,10,height);
fill(255,95);
rect(z+1660,0,10,height);
fill(255,85);
rect(z+1670,0,10,height);
fill(255,75);
rect(z+1680,0,10,height);
fill(255,65);
rect(z+1690,0,10,height);
fill(255,55);
rect(z+1700,0,10,height);
fill(255,45);
rect(z+1710,0,10,height);
fill(255,35);
rect(z+1720,0,10,height);
fill(255,25);
rect(z+1730,0,10,height);
fill(255,15);
rect(z+1740,0,10,height);
fill(255,5);
rect(z+1750,0,10,height);
}
//

//
void keyReleased() {
  if (s>0) {
    s=1;
  }else {
    s=0;
  }
}
void keyPressed() {
  if (l==1){
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


