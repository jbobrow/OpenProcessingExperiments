
int s=0;
int l=0;
int z=0;
float x=100;
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
//
PImage img10;
PImage img20;
PImage img30;
PImage img40;
PImage img50;
PImage img60;
PImage img70;
PImage img80;
PImage img90;
void setup(){
size (800,500);
f= createFont("Geneva",16,true);
img1= loadImage("W0.png");
img2= loadImage("WR1.png");
img3= loadImage("WR2.png");
img4= loadImage("WR3.png");
img5= loadImage("WR4.png");
img6= loadImage("WR5.png");
img7= loadImage("WR6.png");
img8= loadImage("WR7.png");
img9= loadImage("WR8.png");
//
img10= loadImage("WL0.png");
img20= loadImage("WL1.png");
img30= loadImage("WL2.png");
img40= loadImage("WL3.png");
img50= loadImage("WL4.png");
img60= loadImage("WL5.png");
img70= loadImage("WL6.png");
img80= loadImage("WL7.png");
img90= loadImage("WL8.png");
}
void draw() {
  background(255-z/100);
  strokeWeight(4);
  line(0,400,800,400);
  line(0,100,800,100);
  if (s>8) {
    s=1;
  }if (s<-9) {
    s=-1;
  }
  if(z<0) {
    z=0;
  }
  if (l>7) {
    s=s+1;
    l=0;
  } 
  if (l<-7) {
    s=s-1;
    l=0;
  }
  if (x>width/2-50) {
    x=width/2-50;
    z=z+1;
  }else if (x<100) {
    if (z>0){
    x=100;
    z=z-1;
    }
  }
  if(x<0) {
    x=0;
  }
  
  if (mouseX>width/2+100) {
    l=l+1;
    x=x+1;
  }else if (mouseX<width/2-100) {
    l=l-1;
    x=x-1;
  }else if ((mouseX>width/2-100) && (mouseX<width/2+100)){
   if (s>0){
  s=0;
  l=0;
  }if (s<0) {
    s=-1;
    l=0;
  }
  }
  if (s==0) {
    img=img1;
  }
  if (s==1) {
    img=img2;
  }
  if (s==2) {
    img=img3;
  }
  if (s==3) {
    img=img4;
  }
  if (s==4) {
    img=img5;
  }
  if (s==5) {
    img=img6;
  }
  if (s==6) {
    img=img7;
  }
  if (s==7) {
    img=img8;
  }
  if (s==8) {
    img=img9;
  }
  //
  if (s==-1) {
    img=img10;
  }
  if (s==-2) {
    img=img20;
  }
  if (s==-3) {
    img=img30;
  }
  if (s==-4) {
    img=img40;
  }
  if (s==-5) {
    img=img50;
  }
  if (s==-6) {
    img=img60;
  }
  if (s==-7) {
    img=img70;
  }
  if (s==-8) {
    img=img80;
  }
  if (s==-9) {
    img=img90;
  }
  image(img,x,275);
  for (int i = 0; i < 11900; i = i+30) {
  line(i-z, 100, i-z, 400);
}
for (int i = 0; i<11900; i = i+50) {
  fill(100-z/100,10,10);
  rect(i-z,400,50,25);
}
  for (int i = -20; i<11900; i = i+50) {
  rect(i-z,425,50,25);
}
for (int i = 0; i<11900; i = i+50) {
  rect(i-z,450,50,25);
}
for (int i = -20; i<11900; i = i+50) {
  rect(i-z,475,50,25);
}
//
for (int i = 0; i<11900; i = i+50) {
  rect(i-z,0,50,25);
}
  for (int i = -20; i<11900; i = i+50) {
  rect(i-z,25,50,25);
}
for (int i = 0; i<11900; i = i+50) {
  rect(i-z,50,50,25);
}
for (int i = -20; i<11900; i = i+50) {
  rect(i-z,75,50,25);
}
for (int i = 770; i<970; i = i+50) {
  for (int j= 100; j<400; j= j+25) {
  rect(i-z,j,50,25);
  }
}
for (int i = 770+700; i<970+700; i = i+50) {
  for (int j= 100; j<400; j= j+25) {
  rect(i-z,j,50,25);
  }
}
for (int i = 770+1400; i<970+1400; i = i+50) {
  for (int j= 100; j<400; j= j+25) {
  rect(i-z,j,50,25);
  }
}
for (int i = 770+2100; i<970+2100; i = i+50) {
  for (int j= 100; j<400; j= j+25) {
  rect(i-z,j,50,25);
  }
}
for (int i = 770+2800; i<970+2800; i = i+50) {
  for (int j= 100; j<400; j= j+25) {
  rect(i-z,j,50,25);
  }
}
for (int i = 770+3500; i<970+3500; i = i+50) {
  for (int j= 100; j<400; j= j+25) {
  rect(i-z,j,50,25);
  }
}
for (int i = 770+4200; i<970+4200; i = i+50) {
  for (int j= 100; j<400; j= j+25) {
  rect(i-z,j,50,25);
  }
}
for (int i = 770+4900; i<970+4900; i = i+50) {
  for (int j= 100; j<400; j= j+25) {
  rect(i-z,j,50,25);
  }
}
 }


