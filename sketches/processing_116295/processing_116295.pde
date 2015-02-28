
/* @pjs preload= "mario1.png"; */
/* @pjs preload= "mario2.png"; */
/* @pjs preload= "mario3.png"; */
/* @pjs preload= "city.jpg"; */
/* @pjs preload= "coin.png"; */
PImage photo;
PImage img;
PImage pic;
PImage city;
PImage coin;
float x;
float y;
float sx;
float sy;
int mx;
int my;
float cx;
float cy;
boolean movecoin;
float csx;
float csy;
float dcx;
float dcy;

void setup() {
  size(800, 200);
  coin=loadImage("coin.png");
  photo=loadImage("mario1.png");
  img=loadImage("mario2.png");
  pic=loadImage("mario3.png");
  city=loadImage("city.jpg");
  sx=60;
  sy=110;
  img.resize(50, 110);
  photo.resize(60, 110);
  city.resize(800, 200);
  coin.resize(50, 70);
  x=1;
  y=90;
  mx=0;
  my=-20;
  cx=500;
  cy=90;
  movecoin=true;
  csx=30;
  csy=40;
  dcx=900;
  dcy=-100;
}

void draw() {
background(255);
  frameRate(10);
  image(city, mx, my, 800, 200); 
  image(city, mx+width, my, 800, 200);
  image(city, mx+width*2, my, 800, 200); 
  image(city, mx+width*3, my, 800, 200);  
  image(city, mx+width*4, my, 800, 200); 
  image(city, mx+width*6, my, 800, 200);
  image(city, mx+width*7, my, 800, 200); 
  if (movecoin) {
    cy+=1.4;
  }
  else if (!movecoin) {
    cy-=1.4;
  }
  if (cy>=110||cy<=85) {
    movecoin=!movecoin;
  }
  image(coin, cx, cy, csx, csy);
  if (mousePressed) {
    if (keyPressed) {
    if(key=='j') {
      y=10;
    }
    }
    /*if (!keyPressed) {
      y=90;
    }*/
    mx-=5;
    x+=11;
    if (x%2==0) {
      if (x%6==0) {
        image(pic, x, y, sx, sy);
      }
      else {
        image(img, x, y, sx-10, sy);
      }
    }
    else {
      image(photo, x, y, sx, sy);
    }
  }
  if (keyPressed) {
    y=10;
  }
 /* if (!keyPressed) {
    y=90;
  }*/

  if (!mousePressed) {
    if (x%2==0) {
      if (x%3==0) {
        image(pic, x, y, sx, sy);
      }
      else {
        image(img, x, y, sx-10, sy);
      }
    }
    else {
      image(photo, x, y, sx, sy);
    }
  }
  if (x>=800) {
    x=0;
  }
  if (dist(cx, cy, x, y)<=80) {
    sx=90;
    sy=150;
    y=50;
  }
  else {
    sx=60;
    sy=110;
    y=90;
  }
  image(coin, dcx, dcy, csx, csy);
  if (dist(dcx, dcy, x, y)<200) {
    dcx-=0.5;
    dcy++;
  }
}

