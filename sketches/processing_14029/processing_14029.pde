
PImage f1;
PImage f2;
PImage f3;
PImage f4;
PImage f5;
PImage f6;
PImage f7;
PImage f8;
PImage f9;
PImage f10;
PImage f11;
PImage f12;
PImage f13;
PShape dream;
PShape wave1;
PShape wave2;
PShape wave3;
PShape wave4;

void setup()
{
  size(640,480);
  noLoop();
  smooth();
}

void draw()
{
  background(214,233,234);
  shapeMode(CENTER);

  wave1= loadShape("wave1.svg");
  wave2= loadShape("wave2.svg");
  wave3= loadShape("wave3.svg");
  wave4= loadShape("wave4.svg");

  //wave1
  pushMatrix();
  float wx= random(200,400);
  float wy= random(100,380);
  float ws=random(1,2);
  translate(wx,wy);
  scale(ws);
  shape(wave1,0,0);
  popMatrix();

  //wave2
  pushMatrix();
  wx= random(200,400);
  wy= random(100,380);
  ws=random(1,2);
  translate(wx,wy);
  scale(ws);
  shape(wave2,0,0);
  popMatrix();

  //wave3
  pushMatrix();
  wx= random(200,400);
  wy= random(100,380);
  ws=random(1,2);
  translate(wx,wy);
  scale(ws);
  shape(wave3,0,0);
  popMatrix();

  //wave4
  pushMatrix();
  wx= random(200,400);
  wy= random(100,380);
  ws=random(1,2);
  translate(wx,wy);
  scale(ws);
  shape(wave4,0,0);
  popMatrix();

  float b=random(0,0.5);
  float r= random(radians(0),radians(125));
  float s1= random(0.2,0.6);
  float s2= random(0.5,1.5);
  float x= random(100,300);
  float y= random(170,210);

  //feather1
  pushMatrix();
  f1= loadImage("f1.png");
  translate(x,y);
  rotate(r);
  scale(s1);
  filter(BLUR,b);
  image(f1,0,0);
  popMatrix();


  //feather2
  pushMatrix();
//  x=x+ random(-200,200);
//  y=y+ random(-200,200);
x=random(10,630);
y=random(10,470);
  r= random(0,TWO_PI);
  s1= random(0.2,0.6);
  b=random(0,0.5);
  f2= loadImage("f2.png");
  translate(x,y);
  rotate(r);
  scale(s1);
  filter(BLUR,b);
  image(f2,0,0);
  popMatrix();

  //feather3
  pushMatrix();
//  x=x+ random(-200,200);
//  y=y+ random(-200,200);
x=random(10,630);
y=random(10,470);
  r= random(0,TWO_PI);
  s2= random(0.5,1.5);
  b=random(0,0.5);
  f3=loadImage("f3.png");
  translate(x,y);
  rotate(r);
  scale(s1);
  filter(BLUR,b);
  image(f3,0,0);
  popMatrix();

  //feather4
  pushMatrix();
//  x=x+ random(-300,300);
//  y=y+ random(-300,300);
x=random(10,630);
y=random(10,470);
  r= random(0,TWO_PI);
  s1= random(0.1,0.3);
  b=random(0,0.5);
  f4=loadImage("f4.png");
  translate(x,y);
  rotate(r);
  scale(s1);
  filter(BLUR,b);
  image(f4,0,0);
  popMatrix();

  //feather5
  pushMatrix();
//  x=x+ random(-300,300);
//  y=y+ random(-300,300);
x=random(10,630);
y=random(10,470);
  r= random(0,TWO_PI);
  s2= random(0.5,1.5);
  b=random(0,0.5);
  f5=loadImage("f5.png");
  translate(x,y);
  rotate(r);
  scale(s1);
  filter(BLUR,b);
  image(f5,0,0);
  popMatrix();

  //feather6
  pushMatrix();
//  x=x+ random(-200,200);
//  y=y+ random(-200,200);
x=random(10,630);
y=random(10,470);
  r= random(0,PI);
  s1= random(0.2,0.6);
  b=random(0,0.5);
  f6=loadImage("f6.png");
  translate(x,y);
  rotate(r);
  scale(s1);
  filter(BLUR,b);
  image(f6,0,0);
  popMatrix();

  //feather7
  pushMatrix();
//  x=x+ random(-200,200);
//  y=y+ random(-100,100);
x=random(10,630);
y=random(10,470);
  r= random(0,TWO_PI);
  s1= random(0.2,0.6);
  b=random(0,0.5);
  f7=loadImage("f7.png");
  translate(x,y);
  rotate(r);
  scale(s1);
  filter(BLUR,b);
  image(f7,0,0);
  popMatrix();

  //feather8
  pushMatrix();
//  x=x+ random(100,200);
//  y=y+ random(-200,200);
x=random(10,630);
y=random(10,470);
  r= random(0,PI);
  s2= random(0.5,1.5);
  b=random(0,0.5);
  f8=loadImage("f8.png");
  translate(x,y);
  rotate(r);
  scale(s1);
  filter(BLUR,b);
  image(f8,0,0);
  popMatrix();

  //feather9
  pushMatrix();
//  x=x+ random(-100,200);
//  y=y+ random(-200,250);
x=random(10,630);
y=random(10,470);
  r= random(0,TWO_PI);
  s1= random(0.2,0.6);
  b=random(0,0.5);
  f9=loadImage("f9.png");
  translate(x,y);
  rotate(r);
  scale(s1);
  filter(BLUR,b);
  image(f9,0,0);
  popMatrix();

  //feather10
  pushMatrix();
//  x=x+ random(-250,250);
//  y=y+ random(-200,200);
x=random(10,630);
y=random(10,470);
  r= random(0,PI);
  s1= random(0.2,0.6);
  b=random(0,0.5);
  f10=loadImage("f10.png");
  translate(x,y);
  rotate(r);
  scale(s1);
  filter(BLUR,b);
  image(f10,0,0);
  popMatrix();

  //feather11
  pushMatrix();
//  x=x+ random(-200,200);
//  y=y+ random(-100,100);
x=random(10,630);
y=random(10,470);
  r= random(0,TWO_PI);
  s1= random(0.2,0.6);
  b=random(0,0.5);
  f11=loadImage("f11.png");
  translate(x,y);
  rotate(r);
  scale(s1);
  filter(BLUR,b);
  image(f11,0,0);
  popMatrix();

  //feather12
  pushMatrix();
//  x=x+ random(-200,200);
//  y=y+ random(-150,150);
x=random(10,630);
y=random(10,470);
  r= random(0,PI);
  s2= random(0.5,1.5);
  b=random(0,0.5);
  f12=loadImage("f12.png");
  translate(x,y);
  rotate(r);
  scale(s1);
  filter(BLUR,b);
  image(f12,0,0);
  popMatrix();

  //feather13
  pushMatrix();
//  x=x+ random(-300,300);
//  y=y+ random(-200,200);
x=random(10,630);
y=random(10,470);
  r= random(0,PI);
  s1= random(0.2,0.6);
  b=random(0,0.5);
  f13=loadImage("f13.png");
  translate(x,y);
  rotate(r);
  scale(s1);
  filter(BLUR,b);
  image(f13,0,0);
  popMatrix();

  //blue overlay
  noStroke();
  fill(214,233,234,100);
  rect(0,0,640,480);

  //dream catcher
  pushMatrix();
  dream=loadShape("dream.svg");
  float xd=random(130,510);
  float yd=random(100,380);
  float sd=random(.65,1.2);
  float rd=random(radians(-20), radians(20));
  translate(xd,yd);
  rotate(rd);
  scale(sd);
  shape(dream,0,0);
  popMatrix();
}

void mousePressed()
{
  redraw();
}


