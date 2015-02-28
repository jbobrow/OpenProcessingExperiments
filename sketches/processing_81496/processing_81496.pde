
/* Original code created by Kari McMahon found at http://www.openprocessing.org/sketch/48829*/
/*Code Adapted by Anne Marie Hood, YSDN Interactivity 2, Project 3*/

PImage img;

void setup()
{
  size(450,600);
  img = loadImage("far.jpg");
   
}
void draw()
{
 image (img, 0, 0);
 strokeWeight (random(30,40));

stroke(255,255,100, random(20));

line(370,100,random(80,280),random(150,190));

stroke(255,200,100, random(30));

line(370,100,random(80,280),random(130,190));

stroke(255,55,150, random(20));

line(370,100,random(80,280),random(130,220));

stroke(255,255,255, random(30));

line(370,100,random(80,280),random(130,220));

stroke(255,255,255, random(20));

line(370,100,random(100,250),random(180,220));
line(370,100,random(100,250),random(180,220));
line(370,100,random(100,250),random(180,220));
line(370,100,random(100,250),random(180,220));



stroke(255,255,100, random(30));

line(370,100,random(80,200),random(150,190));

stroke(255,200,100, random(20));

line(370,100,random(80,250),random(130,190));

stroke(255,55,150, random(30));

line(370,100,random(80,200),random(130,220));

stroke(255,255,255, random(20));

line(370,100,random(80,250),random(130,220));

stroke(255,255,255, random(20));

line(370,100,random(200,220),random(280,280));
line(370,100,random(100,220),random(280,280));
line(370,100,random(200,250),random(280,280));
line(370,100,random(200,220),random(280,280));
line(370,100,random(100,220),random(280,280));












frameRate(20);
}


