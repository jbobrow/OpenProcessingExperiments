
//Nalini Ramanathan nalinir Copyright 2014
PImage bouncepic, wrappic;
float xwrap, ywrap, xbounce, ybounce, bouncesz, wrapsz, xwrapmove, ywrapmove, xbouncemove, ybouncemove, distance;
void setup () 
{
   size (400, 400);
   xbounce=random(350);
   ybounce=random(350);
   bouncesz=random(50, 150);
   xbouncemove=random(10);
   ybouncemove=random(10);
   xwrap=random(350);
   ywrap=random(350);
   wrapsz=random(50, 150);
   xwrapmove=random(10);
   ywrapmove=random(10);
   bouncepic=loadImage("dog.jpg");
   wrappic=loadImage("car.jpg");
};
void draw ()
{  
   background(89, 5, 69);
   image(bouncepic, xbounce, ybounce, bouncesz, bouncesz);
   image(wrappic, xwrap, ywrap, wrapsz, wrapsz);
   distance=sqrt(pow((xbounce-xwrap),2)+pow((ybounce-ywrap),2));
   xwrap=xwrap+xwrapmove;
   ywrap=ywrap+ywrapmove;
   xbounce=xbounce+xbouncemove;
   ybounce=ybounce+ybouncemove;
   if (xbounce>=400-bouncesz)
   { 
     xbouncemove=random(-10);
   }  
   if (xbounce<=0)
   {
     xbouncemove=random(10);
   }
   if (ybounce>=400-bouncesz)
   { 
     ybouncemove=random(-10);
   }  
   if (ybounce<=0)
   {
     ybouncemove=random(10);
   }
   if (xwrap>400)
   {
      xwrap=0;
   }
   if (ywrap>400)
   {
     ywrap=0;
   }
   if (distance<=.5*bouncesz || distance<=.5*wrapsz)
   {
     fill(255, 0, 0);
     rect(0, 0, width, height);
   }
}



