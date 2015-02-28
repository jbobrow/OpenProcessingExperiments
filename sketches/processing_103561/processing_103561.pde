

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;

void setup() { 
  size(800,1000);
img1 = loadImage("brain.jpg");//加载特定的图片 
img2= loadImage("1373786935_Female.png");
img3= loadImage("1373786885_help_forum-lb.png");
img4= loadImage("1373787430_heart.png");
img5= loadImage("1350962057_Magnifier2.png");

}


void draw(){
  background(0);
  smooth();
  noStroke();
 int h= 40;
int w= 40;
int x=370;
int y=300;
  imageMode(CENTER);
  image(img1, 400, 500,800 , 1000);
  image(img3, x,y,h,w);
  image(img4, x-50,y-100,h,w);
  image(img5,x+100,y-50,h,w);
   image(img2,mouseX,mouseY,h,w);
   
   //  connecnt line img3-4
   
   for(int x1=x-30;x1>x-50; x1-=10){
     fill(255);
     ellipse(x1,y,5,5);
    for(int y1=y;y1>y-80; y1-=10){
     fill(255);
     ellipse(x-50,y1,5,5);
}
}

for(int y2=y+20;y2<y+50;y2+=10){
  fill(255);
  ellipse(x,y2,5,5);
}
for(int x2=x;x2<x+100;x2+=10){
  fill(255);
  ellipse(x2,y+50,5,5);
}
for(int y3=y+50;y3>y-40;y3-=10){
    fill(255);
  ellipse(x+100,y3,5,5);
}
}


