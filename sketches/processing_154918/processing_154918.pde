
//Nalini Ramanathan nalinir Copyright 2014
PImage pic;
float x, y, wd, ht, sz, xmove, ymove;
String goal= "GOAL!";
void setup () 
{
   size (400, 400);
   x=random(350);
   y=random(350);
   sz=random(50, 150);
   xmove=random(10);
   ymove=random(10);
   pic=loadImage("dog.jpg");
};
void draw ()
{  
   background(89, 5, 69);
   image(pic, x, y, sz, sz);
   x=x+xmove;
   y=y+ymove;
   if (x>=400-sz)
   { 
     xmove=random(-10);
   }  
   if (x<=0)
   {
     xmove=random(10);
   }
   if (y>=400-sz)
   { 
     ymove=random(-10);
   }  
   if (y<=0)
   {
     ymove=random(10);
   }
   if (y==0 && x==0)
   {
      print(goal);
   }
   if (y==400 && x==0)
   {
      print(goal);
   }
   if (y==400 && x==400)
   {
      print(goal);
   }
   if (y==0 && x==400)
   {
      print(goal);
   }
}



