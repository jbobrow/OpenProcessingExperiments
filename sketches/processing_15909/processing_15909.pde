
PShape img1; 
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PFont f;
PFont f2;
int a;

void setup() {
  size(600,360);
  img1 = loadShape("hill.svg");
  img2 = loadImage("pinupgirl_1.png");
  img3 = loadImage("pinupgirl_2.png");
  img4 = loadImage("pearlimage.png");
  img5 = loadImage("mal.png");
  f = loadFont("YDISmileM-48.vlw");

  textFont(f);
  smooth();
}

void draw() {
  background(255,209,245);
  shape(img1,0,10);
  image(img3,505,240);
  //image(img4,0,0,120,70);
  image(img5,360,170);
  int s = second();
  int m = minute();
  int h = hour();
  int d = day();
  int m3 = month();
  int y = year();
  float m2 = map(minute(),0,60,0,600);
  float s2 = map(second(),0,60,0,600);
  String t = nf(h,2);
  String t2 = nf(m,2);
  String t3 = nf(s,2);
  String date = nf(y,4)+"."+nf(m3,2)+"."+nf(d,2);
  image(img2,m2,15);
    for(a=-10; a<=591; a+=10) {
    ellipse(a,128,5,5);
    fill(255);
    noStroke();
  }
  fill(255);
  text(t,200,115);
  text(t2,169,170);
  text(t3,130,220);
  textSize(26);
  text("Hour",170,100);
  text("minute",140,155);
  text("second",105,205);
  fill(250,28,147);
  ellipse(s2,128,5,5);
  text(date,415,248);
  noStroke();
  ellipse(200,355,8,8);
  ellipse(207,354,5,5);
  ellipse(205,350,7,7);
  ellipse(214,349,9,9);
  ellipse(220,330,5,5);
  ellipse(210,340,14,14);
  ellipse(185,350,7,7);
  ellipse(214,350,12,12);
  ellipse(225,340,6,6);
  ellipse(205,320,9,9);
  ellipse(226,320,10,10);
  ellipse(230,345,4,4);
  ellipse(198,349,3,3);
  ellipse(240,340,8,8);
  ellipse(238,352,10,10);
  ellipse(210,310,15,15);
  ellipse(197,318,4,4);
  ellipse(250,320,16,16);
  ellipse(262,340,10,10);
  ellipse(258,351,11,11);
  ellipse(260,329,7,7);
  ellipse(278,355,8,8);
  ellipse(250,300,5,5);
  ellipse(289,320,5,5);
  ellipse(300,305,8,8);
  ellipse(310,330,10,10);
  ellipse(350,340,7,7);
  ellipse(342,268,5,5);
}



