
/* @pjs preload="horn.png", "leave.png", "leave2.png", "leave3.png", "cloud.png", "petal.png"; */

size (600, 600);

PImage horn = loadImage("horn.png");
tint (255, 150);

PImage leave = loadImage("leave.png");
tint (255, 150);

PImage leave2 = loadImage("leave2.png");
tint (255, 150);

PImage petal = loadImage("petal.png");
tint (255, 150);

PImage leave3 = loadImage("leave3.png");
tint (255, 150);

PImage cloud = loadImage("cloud.png");
tint (255, 150);

PImage horn2 = loadImage("horn2.png");
tint (255, 150);

imageMode(CENTER);


float angolo = 0;
for (int y=0;  y<=height;  y+=100)
{
  for (int x=0;  x<=width;  x+=100)
  {
    angolo += 0;
    resetMatrix();
    translate( x,y );
    rotate( angolo );
  
  image (cloud, 0,0, 400,400);


  }

    resetMatrix();
    translate(290,0);
  image (horn, 0,0, 400,400);

resetMatrix();
    translate(380,0);
  rotate (PI/6);
  image (horn, 0,0, 400,400);

resetMatrix();
    translate(200,0);
  rotate(PI/-6);
  image (horn, 0,0, 400,400);

    resetMatrix();
    translate(290,20);
  image (horn, 0,0, 400,400);

resetMatrix();
    translate(390,20);
  rotate (PI/7);
  image (horn, 0,0, 400,400);

resetMatrix();
    translate(190,20);
  rotate(PI/-7);
  image (horn, 0,0, 400,400);

    resetMatrix();
    translate(290,40);
  image (horn, 0,0, 400,400);

resetMatrix();
    translate(370,40);
  rotate (PI/8);
  image (horn, 0,0, 400,400);

resetMatrix();
    translate(210,40);
  rotate(PI/-8);
  image (horn, 0,0, 400,400);

    resetMatrix();
    translate(290,60);
  image (horn, 0,0, 400,400);

resetMatrix();
    translate(380,200);
  rotate (PI/4);
  image (horn, 0,0, 300,300);

resetMatrix();
    translate(200,200);
  rotate(PI/-4);
  image (horn, 0,0, 300,300);

    resetMatrix();
    translate(290,80);
  image (horn, 0,0, 500,500);

resetMatrix();
    translate(380,250);
  rotate (PI/4);
  image (horn, 0,0, 200,200);

resetMatrix();
    translate(200,250);
  rotate(PI/-4);
  image (horn, 0,0, 200,200);

    resetMatrix();
    translate(290,250);
  image (horn, 0,0, 100,100);

    resetMatrix();
    translate(290,300);
  image (horn, 0,0, 100,100);

resetMatrix();
    translate(320,350);
  rotate (PI/1);
  image (horn, 0,0, 200,200);

resetMatrix();
    translate(270,350);
  rotate(PI/-1);
  image (horn, 0,0, 200,200);

    resetMatrix();
    translate(500,500);
    rotate (PI/6);
  image (horn, 0,0, 600,600);

    resetMatrix();
    translate(100,500);
    rotate (PI/-6);
  image (horn, 0,0, 600,600);
}



for (int y=0;  y<=300;  y+=60)
{
  for (int x=0;  x<=width;  x+=60)
  {
    angolo += 300;
    resetMatrix();
    translate( x,y);
    rotate( angolo );
  
  image (leave, 0,0, 50,50);
  }
}

{
for (int y=0;  y<=300;  y+=70)
{
  for (int x=0;  x<=width;  x+=70)
  {
    angolo += 200;
    resetMatrix();
    translate( x,y);
    rotate( angolo );
  
  image (leave2, 0,0, 50,50);
  }
}
}
{
for (int y=590;  y<=600;  y+=10)
{
  for (int x=0;  x<=width;  x+=10)
  {
    angolo += 1;
    resetMatrix();
    translate( x,y);
    rotate( angolo );
  
  image (leave3, 0,0, 200,200);
  }
}
}

{
for (int y=0;  y<=300;  y+=50)
{
  for (int x=0;  x<=width;  x+=50)
  {
    angolo += 80;
    resetMatrix();
    translate( x,y);
    rotate( angolo );
  
  image (petal, 0,0, 20,20);
  }
}
}


