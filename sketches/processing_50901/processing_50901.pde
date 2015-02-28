
//Michelle Guarino, mguarino@andrew.cmu.edu
//copywrite. all rights reserved.


color c;
color d;

void setup()
{
smooth();
size (600, 600);
//float x,y,wd, ht;
//x=300;
//y=300;
//wd=300;
//ht=300;
background (249,227,130);
//ellipse (x,y,wd,ht);
strokeWeight (4);
stroke(255,255,255);
 c= color (255, 255, 255);
}

void draw() 
{
  background (249,227,130);

drawTarget (mouseX,mouseY, mouseX,mouseY);

}

//letter I
void drawTarget ( float x, float y, float wd, float ht)
{
//float x,y,wd, ht;
fill (139,210,210);

ellipse (x,y,wd,ht);
fill (c);


quad (x+wd*.045,y+ht*.20, x+wd*.055,y-ht*.20, x+wd*.105,y-ht*.20, x+wd*.105,y+ht*.20);
//point (x+wd*.045,y+ht*.20);
//point (x+wd*.055,y-ht*.20);
//point (x+wd*.105,y-ht*.20);
//point (x+wd*.105,y+ht*.20);
//letter H
quad (x-wd*.045,y-ht*.20, x-wd*.055,y+ht*.20, x-wd*.105,y+ht*.20, x-wd*.105,y-ht*.20);
//point (x-wd*.045,y-ht*.20);
//point (x-wd*.055,y+ht*.20);
//point (x-wd*.105,y+ht*.20);
//point (x-wd*.105,y-ht*.20);
quad (x-wd*.245,y-ht*.20, x-wd*.255,y+ht*.20, x-wd*.305,y+ht*.20, x-wd*.305,y-ht*.20);
//point (x-wd*.245,y-ht*.20);
//point (x-wd*.255,y+ht*.20);
//point (x-wd*.305,y+ht*.20);
//point (x-wd*.305,y-ht*.20);
quad (x-wd*.255,y+ht*.01, x-wd*.255, y-ht*.01, x-wd*.105,y-ht*.01, x-wd*.105,y+ht*.01);
//point (x-wd*.255,y+ht*.01);
//point (x-wd*.255,y-ht*.01);
//point (x-wd*.105,y+ht*.01);
//point (x-wd*.105,y-ht*.01);
}




void mousePressed ()
{
c= color (random (255), random(255), random ( 255));
fill(c);
stroke (c);

}

void keyPressed ()
{
d= color (random (255), random(255), random ( 255));
background(d);
}

