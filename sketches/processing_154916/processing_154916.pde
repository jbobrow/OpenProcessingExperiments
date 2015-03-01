
//Nalini Ramanathan nalinir Copyright 2014
PImage wrappic;
float xwrap, ywrap, xbounce, ybounce, bouncesz, wrapsz, xwrapmove, ywrapmove, xbouncemove, ybouncemove;
void setup () 
{
   size (400, 400);
   xwrap=random(350);
   ywrap=random(350);
   wrapsz=random(50, 150);
   xwrapmove=random(10);
   ywrapmove=random(10);
   pic=loadImage("dog.jpg");
};
void draw ()
{  
   background(89, 5, 69);
   image(pic, xwrap, ywrap, wrapsz, wrapsz);
   xwrap=xwrap+xwrapmove;
   ywrap=ywrap+ywrapmove;
   if (xwrap>400)
   {
      xwrap=0;
   }
   if (ywrap>400)
   {
     ywrap=0;
   }
}



