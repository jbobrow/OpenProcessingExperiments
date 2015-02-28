
PImage sh1;
PImage sh2;
PImage sh3;
PImage sh4;
PImage sh5;
PImage sh6;
PImage sh7;
PImage sh8;
PImage a1;
PImage a2;
PImage a3;
PImage a4;
PImage a5;
PImage d1;
PImage d2;
PImage d3;
PImage d4;
PImage d5;
PImage d6;
PImage d7;
PImage d8;
PImage d9;
PImage b1;
PImage b2;
PImage b3;
PImage b4;
PImage b5;
PImage b6;
PImage b7;
PImage c1;
PImage c2;
PImage c3;
PImage c4;
PImage c5;
PImage c6;
PImage c7;
PImage c8;



void setup()
{
  size(640,425);
  smooth();
  sh1 = loadImage("0.jpg");
  sh2 = loadImage("1.jpg");
  sh3 = loadImage("2__.jpg");
  sh4 = loadImage("2_.jpg");
  sh5 = loadImage("3.jpg");
  sh6 = loadImage("4__.jpg");
  sh7 = loadImage("4_.jpg");
  sh8 = loadImage("0.jpg");
  a1  = loadImage("a1.jpg");
  a2  = loadImage("a2.jpg");
  a3  = loadImage("a3.jpg");
  a4  = loadImage("a4.jpg");
  a5  = loadImage("a5.jpg");
  d1  = loadImage("d1.jpg");
  d2  = loadImage("d2.jpg");
  d3  = loadImage("d3.jpg");
  d4  = loadImage("d4.jpg");
  d5  = loadImage("d5.jpg");
  d6  = loadImage("d6.jpg");
  d7  = loadImage("d7.jpg");
  d8  = loadImage("d8.jpg");
  d9  = loadImage("d9.jpg");
  c1  = loadImage("c1.jpg");
  c2  = loadImage("c2.jpg");
  c3  = loadImage("c3.jpg");
  c4  = loadImage("c4.jpg");
  c5  = loadImage("c5.jpg");
  c6  = loadImage("c6.jpg");
  c7  = loadImage("c7.jpg");
  c8  = loadImage("c8.jpg");
  b1  = loadImage("b1.jpg");
  b2  = loadImage("b2.jpg");
  b3  = loadImage("b3.jpg");
  b4  = loadImage("b4.jpg");
  b5  = loadImage("b5.jpg");
  b6  = loadImage("b6.jpg");
  b7  = loadImage("b7.jpg");
 
}
 
void draw()
{
  background(0);
   
  //1st
  if((mouseX > 0) && (mouseX < 80))
  {
    
    if((mouseY > 0) && (mouseY < 85))
    {
    image(a1, 0,0);
    }
    if((mouseY >= 85) && (mouseY < 170))
    {
    image(a2, 0,0);
    }
    if((mouseY >= 170) && (mouseY < 255))
    {
    image(sh1, 0,0);
    }
     if((mouseY >= 255) && (mouseY < 325))
    {
    image(a4, 0,0);
    }
     if((mouseY >= 325) && (mouseY < 425))
    {
    image(a5, 0,0);
    }
    
  }
  //2nd
  if((mouseX >=80) && (mouseX < 160))
  {
      if((mouseY > 0) && (mouseY < 70))
    {
    image(b1, 0,0);
    }
    if((mouseY >= 70) && (mouseY < 140))
    {
    image(b2, 0,0);
    }
    if((mouseY >= 140) && (mouseY < 200))
    {
    image(b3, 0,0);
    }
     if((mouseY >= 200) && (mouseY < 300))
    {
    image(sh2, 0,0);
    }
    if((mouseY >= 300) && (mouseY < 340))
    {
    image(b4, 0,0);
    }
    if((mouseY >= 340) && (mouseY < 380))
    {
    image(b5, 0,0);
    }
     if((mouseY >= 380) && (mouseY < 425))
    {
    image(b6, 0,0);
    }
  }
  //3rd
  else if((mouseX >= 160) && (mouseX < 240))
  {
      if((mouseY > 0) && (mouseY < 70))
    {
    image(b1, 0,0);
    }
    if((mouseY >= 70) && (mouseY < 140))
    {
    image(b2, 0,0);
    }
    if((mouseY >= 140) && (mouseY < 200))
    {
    image(b3, 0,0);
    }
     if((mouseY >= 200) && (mouseY < 300))
    {
    image(sh3, 0,0);
    }
    if((mouseY >= 300) && (mouseY < 340))
    {
    image(b4, 0,0);
    }
    if((mouseY >= 340) && (mouseY < 380))
    {
    image(b5, 0,0);
    }
     if((mouseY >= 380) && (mouseY < 425))
    {
    image(b6, 0,0);
    }
  }
  //4th
  else if((mouseX >= 240) && (mouseX < 320))
  {
      if((mouseY > 0) && (mouseY < 40))
    {
    image(c1, 0,0);
    }
    if((mouseY >= 40) && (mouseY < 80))
    {
    image(c2, 0,0);
    }
    if((mouseY >= 80) && (mouseY < 120))
    {
    image(c3, 0,0);
    }
     if((mouseY >= 120) && (mouseY < 160))
    {
    image(c4, 0,0);
    }
     if((mouseY >= 160) && (mouseY < 200))
    {
    image(c5, 0,0);
    }
     if((mouseY >=200) && (mouseY < 300))
    {
    image(sh4, 0,0);
    }
    if((mouseY >= 300) && (mouseY < 340))
    {
    image(c6, 0,0);
    }
    if((mouseY >= 340) && (mouseY < 380))
    {
    image(c7, 0,0);
    }
     if((mouseY >= 380) && (mouseY < 425))
    {
    image(c8, 0,0);
    }
  }
  //5th
  else if((mouseX >= 320) && (mouseX < 400))
  {
      if((mouseY > 0) && (mouseY < 40))
    {
    image(c1, 0,0);
    }
    if((mouseY >= 40) && (mouseY < 80))
    {
    image(c2, 0,0);
    }
    if((mouseY >= 80) && (mouseY < 120))
    {
    image(c3, 0,0);
    }
     if((mouseY >= 120) && (mouseY < 160))
    {
    image(c4, 0,0);
    }
     if((mouseY >= 160) && (mouseY < 200))
    {
    image(c5, 0,0);
    }
     if((mouseY >=200) && (mouseY < 300))
    {
    image(sh5, 0,0);
    }
    if((mouseY >= 300) && (mouseY < 340))
    {
    image(c6, 0,0);
    }
    if((mouseY >= 340) && (mouseY < 380))
    {
    image(c7, 0,0);
    }
     if((mouseY >= 380) && (mouseY < 425))
    {
    image(c8, 0,0);
    }
    
  }
  //6th
  else if((mouseX >= 400) && (mouseX < 480))
  {
    if((mouseY > 0) && (mouseY < 40))
    {
    image(d1, 0,0);
    }
    if((mouseY >= 40) && (mouseY < 80))
    {
    image(d2, 0,0);
    }
    if((mouseY >= 80) && (mouseY < 120))
    {
    image(d3, 0,0);
    }
     if((mouseY >= 120) && (mouseY < 160))
    {
    image(d4, 0,0);
    }
     if((mouseY >= 160) && (mouseY < 200))
    {
    image(d5, 0,0);
    }
     if((mouseY >=200) && (mouseY < 300))
    {
    image(sh6, 0,0);
    }
    if((mouseY >= 300) && (mouseY < 340))
    {
    image(d6, 0,0);
    }
    if((mouseY >= 340) && (mouseY < 370))
    {
    image(d7, 0,0);
    }
     if((mouseY >= 370) && (mouseY < 400))
    {
    image(d8, 0,0);
    }
     if((mouseY >= 400) && (mouseY < 425))
    {
    image(d9, 0,0);
    }
  }
  //7th
  else if((mouseX >= 480) && (mouseX < 560))
  {
    
    if((mouseY > 0) && (mouseY < 40))
    {
    image(d1, 0,0);
    }
    if((mouseY >= 40) && (mouseY < 80))
    {
    image(d2, 0,0);
    }
    if((mouseY >= 80) && (mouseY < 120))
    {
    image(d3, 0,0);
    }
     if((mouseY >= 120) && (mouseY < 160))
    {
    image(d4, 0,0);
    }
     if((mouseY >= 160) && (mouseY < 200))
    {
    image(d5, 0,0);
    }
     if((mouseY >=200) && (mouseY < 300))
    {
    image(sh7, 0,0);
    }
    if((mouseY >= 300) && (mouseY < 340))
    {
    image(d6, 0,0);
    }
    if((mouseY >= 340) && (mouseY < 370))
    {
    image(d7, 0,0);
    }
     if((mouseY >= 370) && (mouseY < 400))
    {
    image(d8, 0,0);
    }
     if((mouseY >= 400) && (mouseY < 425))
    {
    image(d9, 0,0);
    }
    
  }
  //8th
  else if((mouseX > 561) && (mouseX < 640))
  {
     if((mouseY > 0) && (mouseY < 85))
    {
    image(a1, 0,0);
    }
    if((mouseY >= 85) && (mouseY < 170))
    {
    image(a2, 0,0);
    }
    if((mouseY >= 170) && (mouseY < 255))
    {
    image(sh8, 0,0);
    }
     if((mouseY >= 255) && (mouseY < 325))
    {
    image(a4, 0,0);
    }
     if((mouseY >= 325) && (mouseY < 425))
    {
    image(a5, 0,0);
  }
   
}
}



