
/*
Jennifer Kaye
jenniferkaye7@gmail.com
Copyright 2011
Parsons MFA D+T Bootcamp
Homework 8/6/11: Parade of Elements

Image credits:
http://fitnessevolved.com/2010/07/
http://disney.wikia.com/wiki/Snow_White_%28character%29
http://www.paintinghere.com/painting/the_Beatles_@_Abbey_Road_8034.html
*/

// Files and Established Values

PImage abbey_road;
PImage snow_white;
PImage d1;
PImage d2;
PImage d3;
PImage d4;
PImage d5;
PImage d6;
PImage d7;

int image_x = -300;
int snow_image_y = 180;
int d_image_y = 400;

int lag = 200;

int speed = 3;


//Actions

void setup () {
   size (1000, 600);
   frameRate (30);
   abbey_road = loadImage ("abbey_road.jpg");
   snow_white = loadImage ("snow_white.png");
   d1 = loadImage ("d1.png");
   d2 = loadImage ("d2.png");
   d3 = loadImage ("d3.png");
   d4 = loadImage ("d4.png");
   d5 = loadImage ("d5.png");
   d6 = loadImage ("d6.png");
   d7 = loadImage ("d7.png");
}

void draw () { 
 background (174, 60, 110);
 rect (0, 525, width, 75);
 noStroke();
 fill (99, 40, 24);
 image (abbey_road, 0, -150);
 image (snow_white, image_x, snow_image_y);
 image_x += speed;
 image (d1, image_x-lag, d_image_y);
 image (d2, image_x-lag*2, d_image_y);
 image (d3, image_x-lag*3, d_image_y);
 image (d4, image_x-lag*4, d_image_y);
 image (d5, image_x-lag*5, d_image_y);
 image (d6, image_x-lag*6, d_image_y);
 image (d7, image_x-lag*7, d_image_y);

}

