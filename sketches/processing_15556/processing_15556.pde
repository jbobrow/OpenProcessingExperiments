


PFont f;
PFont ff;
PFont fff;
PFont ffff;

void setup() {
  size(300,550);
  stroke(255);
}

void draw() {
  background(66,255,170);

  f = loadFont ("Helvetica33-ExtendedThin-50.vlw");
  textFont(f);
  int s = second();
  int m = minute();
  int h = hour();
  String t = nf(h,2) + ":" + nf(m,2) ;
  text(t, 70, 500);
  
  ff = loadFont ("Helvetica33-ExtendedThin-30.vlw");
  textFont(ff);
  String tt = ":" + nf(s,2) ;
  text(tt,200,500);  
  
 
  fff = loadFont ("Helvetica53-Extended-20.vlw");
  textFont(fff);
  int d = day();
  int mon = month();
  int y = year();
  String ttt =  nf(y,2) +"." + nf(mon,2) + "." + nf(d,2);
  text(ttt, 100, 450);
  //date and time

  float hh = map(hour(),0,24,0,300);
  float mm = map(minute(),0,60,0,300);
  float ss = map(second(),0,60,0,500);
  stroke(255);
  strokeWeight(5);
  line(hh,0,hh,410);
  
  
  PImage a = loadImage("a.png");
  image(a,mm,300);
  stroke(255,255,150);
  strokeWeight(3);
  line(mm,0,mm,410);
  

  PImage ii = loadImage("qrq.png");
  image(ii,ss,100);
  stroke(255,255,60);
  strokeWeight(1);
  line(ss,0,ss,410);

  //timeline1
  
  float hhh = map(hour(),0,24,0,200);
  float mmm = map(minute(),0,60,0,200);
  float sss = map(second(),0,60,0,200);
  stroke(199,128,235);
  strokeWeight(5);
  line(hhh,0,hhh,410);
  
  stroke(38,201,255);
  strokeWeight(3);
  line(mmm,0,mmm,410);
  
  PImage iii = loadImage("Untitled-2.png");
  image(iii,sss,250);
  stroke(196,69,190);
  strokeWeight(1);
  line(sss,0,sss,410);  
  //timeline2
  
  float hhhh = map(hour(),0,24,0,400);
  float mmmm = map(minute(),0,60,0,400);
  float ssss = map(second(),0,60,0,400);
  stroke(255);
  strokeWeight(5);
  line(hhhh,0,hhhh,410);

  strokeWeight(3);
  line(mmmm,0,mmmm,410);
  
  PImage iiii = loadImage("aa.png");
  image(iiii,ssss,200);
  strokeWeight(1);
  line(ssss,0,ssss,410);  
  //timeline3

  PImage i = loadImage("Untitled.png");
  image(i,0,0);
  image(i,0,150);
  image(i,0,300);
 
  
}

