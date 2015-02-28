



PFont chaparral;
String ask = "To ask a person to draw a five pedals and pink flower.";

PImage f01;
PImage f02;
PImage f03;
PImage f04;
PImage f05;
PImage f06;
PImage f07;
PImage f08;
PImage f09;
PImage f10;
PImage f11;
PImage f12;
PImage f13;
PImage f14;
PImage f15;
PImage f16;
PImage f17;
PImage f18;
PImage f19;
PImage f20;
PImage f21;
PImage f22;
PImage f23;
PImage f24;
PImage f25;
PImage f26;
PImage f27;

void setup()
{
  size(960, 600);
  smooth();
  imageMode(CENTER);
  chaparral = loadFont("ChaparralPro-Regular-16.vlw");
  textFont(chaparral);
  textAlign(CENTER, CENTER);
  noStroke();
  noFill();


  f01 = loadImage("flower01.gif");
  f02 = loadImage("flower02.gif");
  f03 = loadImage("flower03.gif");
  f04 = loadImage("flower04.gif");
  f05 = loadImage("flower05.gif");
  f06 = loadImage("flower06.gif");
  f07 = loadImage("flower07.gif");
  f08 = loadImage("flower08.gif");
  f09 = loadImage("flower09.gif");
  f10 = loadImage("flower10.gif");
  f11 = loadImage("flower11.gif");
  f12 = loadImage("flower12.gif");
  f13 = loadImage("flower13.gif");
  f14 = loadImage("flower14.gif");
  f15 = loadImage("flower15.gif");
  f16 = loadImage("flower16.gif");
  f17 = loadImage("flower17.gif");
  f18 = loadImage("flower18.gif");
  f19 = loadImage("flower19.gif");
  f20 = loadImage("flower20.gif");
  f21 = loadImage("flower21.gif");
  f22 = loadImage("flower22.gif");
  f23 = loadImage("flower23.gif");
  f24 = loadImage("flower24.gif");
  f25 = loadImage("flower25.gif");
  f26 = loadImage("flower26.gif");
  f27 = loadImage("flower27.gif");
}

void draw()
{ 
   text(ask, width/2, 40);

  float disOval = dist(width/2, height/2, mouseX, mouseY);

  if (disOval >= 150)
  { 

    float num = int(random(1, 27));

    if (num == 1)
    {
      image(f01, width/2, height/2);
    }
    if (num == 2)
    {
      image(f02, width/2, height/2);
    }
    if (num == 3)
    {
      image(f03, width/2, height/2);
    }
    if (num == 4)
    {
      image(f04, width/2, height/2);
    }
    if (num == 5)
    {
      image(f05, width/2, height/2);
    }
    if (num == 6)
    {
      image(f06, width/2, height/2);
    }
    if (num == 7)
    {
      image(f07, width/2, height/2);
    }
    if (num == 8)
    {
      image(f08, width/2, height/2);
    }
    if (num == 9)
    {
      image(f09, width/2, height/2);
    }
    if (num == 10)
    {
      image(f10, width/2, height/2);
    }
    if (num == 11)
    {
      image(f11, width/2, height/2);
    }
    if (num == 12)
    {
      image(f12, width/2, height/2);
    }  
    if (num == 13)
    {
      image(f13, width/2, height/2);
    }  
    if (num == 14)
    {
      image(f14, width/2, height/2);
    }  
    if (num == 15)
    {
      image(f15, width/2, height/2);
    }  
    if (num == 16)
    {
      image(f16, width/2, height/2);
    }  
    if (num == 17)
    {
      image(f17, width/2, height/2);
    }  
    if (num == 18)
    {
      image(f18, width/2, height/2);
    }  
    if (num == 19)
    {
      image(f19, width/2, height/2);
    }  
    if (num == 20)
    {
      image(f20, width/2, height/2);
    }  
    if (num == 21)
    {
      image(f21, width/2, height/2);
    }
    if (num == 22)
    {
      image(f22, width/2, height/2);
    }
     if (num == 23)
    {
      image(f23, width/2, height/2);
    }
     if (num == 24)
    {
      image(f24, width/2, height/2);
    }
     if (num == 25)
    {
      image(f25, width/2, height/2);
    }
     if (num == 26)
    {
      image(f26, width/2, height/2);
    }
     if (num == 27)
    {
      image(f27, width/2, height/2);
    }
  }
}


