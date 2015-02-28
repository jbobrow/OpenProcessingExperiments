
/*
Aneta Genova
genovaa@newschool.edu
Copyright 2011
Parsons MFA D+T Bootcamp
Homework 8/6/11: Parade of Elements
 
Image credits:
Bike and black cat images Aneta Genova
cat w helmit: http://zef.me/2117/funny-cat-pictures-suck
freaky cat: http://unboundstate.blogspot.com/2011/03/funny-cat-pictures.html 
*/
 
// Files and Established Values
 
PImage bg;
PImage cat_helmit;
PImage cat2;
PImage cat3;


int image_x = 0;
int cat_helmit_image_y = 350;
int cat_image_y = 0;

int lag = 200;
 
int speed = 3;
 
 
//Actions
 
void setup () {
   size (640, 478);
   frameRate (30);
   bg = loadImage ("bike.jpg");
   cat_helmit = loadImage ("cat_helmit.jpg");
   cat2 = loadImage ("cat2.jpg");
   cat3 = loadImage ("cat3.jpg");
}
 
void draw () { 
 image (bg, 0, 0);
 
 image_x +=1;
 image (cat_helmit, image_x, cat_image_y);
 image_x += speed;
 if (image_x >= 440)
 image_x=0;
 if (image_x <= 0)
 image_x = speed*-1;
 
 image (cat2, image_x-lag, cat_image_y);    
 image (cat3, image_x-lag*2, cat_image_y);
};


