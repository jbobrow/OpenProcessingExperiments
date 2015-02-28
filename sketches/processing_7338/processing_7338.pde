
PImage s1;
PImage s2;
PImage s3;
PImage s4;
PImage s5;
PImage s6;
PImage s7;
PImage s8;
PImage s9;
PImage s10;
PImage s11;
PImage s12;
PImage s13;
PImage s14;
PImage s15;
PImage s16;
PImage s17;
PImage s18;
PShape s19;
PShape s20;


float x, y, r, s;

void setup() {
  size (640,480);
  smooth();
  background(255);
  noLoop();
  s1 = loadImage("1.png");
  s2 = loadImage("2.png");
  s3 = loadImage("3.png");
  s4 = loadImage("4.png");
  s5 = loadImage("5.png");
  s6 = loadImage("6.png");
  s7 = loadImage("7.png");
  s8 = loadImage("8.png");
  s9 = loadImage("9.png");
  s10 = loadImage("10.png");
  s11 = loadImage("11.png");
  s12 = loadImage("12.png");
  s13 = loadImage("13.png");
 s14 = loadImage("14.png");
 s15 = loadImage("15.png");
 s16 = loadImage("16.png");
 s17 = loadImage("17.png");
 s18 = loadImage("18.png");
 s19 = loadShape("19.svg");
 s20 = loadShape("20.svg");
  } 



void draw() {
 x = (315);
  y = (240);
  pushMatrix();
  translate(x, y);
  image(s3, -s3.width/2, -s3.height/2);
  popMatrix();

x = (620);
  y =(435);
  pushMatrix();
  translate(x, y);
  image(s18, -s18.width/2, -s18.height/2);
  popMatrix();
 
  x = (320);
  y =(235);
  pushMatrix();
  translate(x, y);
  image(s2, -s2.width/2, -s2.height/2);
  popMatrix();

 x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  shape(s19, -s19.width/2, -s19.height/2);
  popMatrix();

x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  shape(s20, -s20.width/2, -s20.height/2);
  popMatrix();

  x = (320);
  y = (300);
  pushMatrix();
  translate(x, y);
  image(s4, -s4.width/2, -s4.height/2);
  popMatrix();

  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(s5, -s5.width/2, -s5.height/2);
  popMatrix();

  x = (350);
  y = (220);
  pushMatrix();
  translate(x, y);
  image(s6, -s6.width/2, -s6.height/2);
  popMatrix();

  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(s7, -s7.width/2, -s7.height/2);
  popMatrix();

  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(s8, -s8.width/2, -s8.height/2);
  popMatrix();


  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(s10, -s10.width/2, -s10.height/2);
  popMatrix();



x = (315);
  y = (240);
  pushMatrix();
  translate(x, y);
  image(s9, -s9.width/2, -s9.height/2);
  popMatrix();


  x = (320);
  y = (240);
  pushMatrix();
  translate(x, y);
  image(s11, -s11.width/2, -s11.height/2);
  popMatrix();



  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(s12, -s12.width/2, -s12.height/2);
  popMatrix();

  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(s13, -s13.width/2, -s13.height/2);
  popMatrix();

  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
 image(s14, -s14.width/2, -s14.height/2);
  popMatrix();

  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(s15, -s15.width/2, -s15.height/2);
  popMatrix();

imageMode(CORNERS);

  x = (320);
  y =(240);
  s = random(0.1,1);
  pushMatrix();
 // translate(x, y);
  image(s1,x*s,y*s,640,480);
  //image(s1, -s1.width/2, -s1.height/2);
  popMatrix();

 x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(s16, -s16.width/2, -s16.height/2);
  popMatrix();
  

  
   x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(s17, -s17.width/2, -s17.height/2);
  popMatrix();
}

