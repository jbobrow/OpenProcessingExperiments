
/*=======================================
Day 1. shapes and canvas. 

Created 1/22/2015
Modified 1/29/2015

Sarah Hockman
hockman.25@osu.edu
hockman.25@gmail.com

Created for Art 3001 - Data Visualization
BFA in Art and Technology
The Ohio State University
http://www.openprocessing.org/classroom/4626

=======================================*/

//variables
int a = 50;
int b = 300;
int c = 180 ;

//background(a);
size(b,2 * b);

fill(162);

//antenna
rect(3 * a, 22 , 1 , 30);
ellipse(3 * a + 1,20,10,10);

//legs
rect(110,b,a - 20,c - 30);
rect(160,b,a - 20,c - 30);
rect(160,b,a - 20,a - 20);
rect(160,b + 30,a - 20,a - 20);
rect(160,360,a - 20,a - 20);
rect(160,390,a - 20,a - 20);
rect(110,300,a - 20,150);
rect(160,330,a - 20,a - 20);
rect(160,360,30,a - 20);
rect(160,390,a - 20,a - 20);
rect(110,300,a - 20,30);
rect(110,330,a - 20,a - 20);
rect(110,360,a - 20,a - 20);
rect(110,390,a - 20,a - 20);

//arms
rect(40,170,a + 20,20); 
rect(40,170,20,a + 20);
rect(190,170,a + 20,20); 
rect(240,120,20,a + 20); 

//neck
rect(140,3 * a,20,15);

//body
rect(90,160,120,150,a - 20,a - 20,a,a);

//face
rect(110,a,80,2 * a,18,18,18,18);
fill(255);
rect(100,75,2 * a,a);
// 75% opacity.
fill(255,0,0,191);
rect(110,c - 100,c - 100,40);

//top
rect(135,a,a-20,15);

//left eye
fill(0);
ellipse(c - 50,2 * a,10,15);

//right eye
fill(0);
ellipse(170,100,10,15);

//chest
// 75% opacity.
fill(255);
rect(125,c,50,50);
fill(255,0,0,191);
rect(130,c + 5,40,40);

textSize(32);
text("Mr. Roboto", 70, b + 200); 
fill(0, 102, 153);
