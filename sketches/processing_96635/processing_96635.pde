
int h;
int m;
int s ;

Hand[] hourH;
Hand[] minH;
Hand[] secH; 


class Hand {
  float x, y;
  int thick;
  int size;
  int life=240;

  Hand(int inithick, int initsize) {
    thick = inithick;
    size = initsize;
  }
  void rectangle(int R, int G, int B) {

    pushMatrix();
    translate(x, y);
    noStroke();
    fill(R,G,B,life);
    rectMode(CENTER);
    rect(0, 0, thick, 50, 3);
    popMatrix();
  }
    
  void textdisplay(int a) {
    pushMatrix();
    translate(x, y);
    textSize(size);
    fill(30);
    textAlign(CENTER);
    text(a, 0, -30);
    popMatrix();
  }
  void move(){
      x = x+ random(-1,1);
   // y = y+ random(-1, 1);
  }
}


void setup() {
  size(600, 350);
  hourH = new Hand[24];
  secH = new Hand[60];
  minH = new Hand[60];
  for (int i=0; i<24; i++) {
    hourH[i] = new Hand(8, 15);
  }

  for (int i=0; i<60; i++) {
    minH[i] = new Hand( 6, 10);
  }

  for (int i=0; i<60; i++) {
    secH[i] = new Hand(4, 10);
  }
}

void draw() {

  background(250);
  //hour boxes

  if (mousePressed==true) {
    s=mouseX/10-1;
    if ( s>=59) {
      s=0;
      m++;
    }
    if (m>=59) {
      m=0;
      h++;
    }
    if (h>=23) {
      h=0;
    }
  }
 else{
    s = second();
    m= minute();
    h = hour();
  }


  secH[s].textdisplay(s);

  for (int i=0; i<s+1; i++) {
    secH[i].x = 30 + 9*i;
    secH[i].y = 280;
    if(secH[i].life>100){
    secH[i].life--;
    }else {
      secH[i].life=250;
    }
    secH[i].rectangle(100,50,70);
  }


  minH[m].textdisplay(m);
  for (int i=0; i<m+1; i++) {
    minH[i].x = 30 + 9*i ;
    minH[i].y = 180;
    minH[i].life = i*3 +70;
    minH[i].rectangle(50,100,70+i*2);
  }

  hourH[h].textdisplay(h);
  for (int i=0; i<h+1; i++) {

    hourH[i].x = 30 + 23*i ;
    hourH[i].y = 80;
    //hourH[i].move();
    hourH[i].life = i*4 + 150;
    hourH[i].rectangle(50+i*3,50,100);

  }
}

