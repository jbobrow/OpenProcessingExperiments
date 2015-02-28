
/* 0531
 */

int card = 0;
PImage a,b,c,d,e,g,h,i,j,k,l,m;

void setup() {
  size(480,800);
  smooth();
  noStroke();
  a= loadImage("1.jpg");
  b= loadImage("2.jpg");
  c= loadImage("3.jpg");
  d= loadImage("4.jpg");
  e= loadImage("5.jpg");
  g= loadImage("7.jpg");
  h= loadImage("8.jpg");
  i= loadImage("9.jpg");
  j= loadImage("10.jpg");
  k= loadImage("11.jpg");
  l= loadImage("12.jpg");
  m= loadImage("13.jpg");
  //loadimage
}
void draw() {
  if (card == 0) {
    background(0);
    image(a,0,0,480,800);
  }
  else if (card ==1) {
    background(0);
    image(b,0,0,480,800);
  }
  else if (card ==2) {
    background(0);
    image(c,0,0,480,800);
  }
  else if (card ==3) {
    background(0);
    image(d,0,0,480,800);
  }
  else if (card ==4) {
    background(0);
    image(e,0,0,480,800);
  }
  else if (card ==5) {
    background(0);
    image(g,0,0,480,800);
  }
  else if (card ==6) {
    background(0);
    image(h,0,0,480,800);
  }
  else if (card ==7) {
    background(0);
    image(i,0,0,480,800);
  }
  else if (card ==8) {
    background(0);
    image(j,0,0,480,800);
  }
  else if (card ==9) {
    background(0);
    image(k,0,0,480,800);
  }
  else if (card ==10) {
    background(0);
    image(l,0,0,480,800);
  }
  else if (card ==11) {
    background(0);
    image(m,0,0,480,800);
  }
}


void mousePressed() { 
  if (card == 0) { 
    card = 1;
  }
  else if (card == 1) { 
    card = 2;
  }
  else if (card == 2) {
    card = 3;
  }
  else if (card == 3) {
    card = 4;
  } 
  else if (card == 4) {
    card = 5;
  } 
  else if (card == 5) {
    card = 6;
  }
  else if (card == 6) {
    card = 7;
  }
  else if (card == 7) {
    card = 8;
  }
  else if (card == 8) {
    card = 9;
  }
  else if (card == 9) {
    card = 10;
  }
  else if (card == 10) {
    card = 11;
  }
  else if (card == 11) {
    card = 0;
  }
}


