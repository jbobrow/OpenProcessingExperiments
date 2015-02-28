
//homework 5
//copyright Kristen McConnell September 2011 Pittsburgh, PA 15221

//Background Line Group Variables
int x,y,x1,y1,deltax,deltax2,deltay1;

//Letter Variables
float a,b,wd,ht;
float elx,ely,wd2,ht2,lnx1,lny1,lnx2,lny2; //Letter a

//Triangle Variables
float xt1,yt1,xt2,yt2,yt3,deltaxt,deltayt;

void setup()
{
 size(400,400);
 smooth();
 background(120, 138, 252);
}

void draw()
{
 //Background Line Group 1
 strokeWeight(1);
 x = 0;
 y = 0;
 x1 = 400;
 y1 = 400;
 deltax = 5;
 deltay1 = 5;
 while (x < width)
 {
   if (x < width/3)
   {
     stroke(0,0,255);
   }
   else if (x > .75*width)
   {
     stroke(0,0,255);
   }
   else
   {
     stroke(2,0,137);
   }
   line(x,y,x1,y1);
   x = x + deltax;
   y1 = y1 - deltay1;
 }
 
 //Background Line Group 2
 x = 0;
 y = 400;
 x1 = 200;
 y1 = 200;
 deltax = 10;
 deltax2 = 5;
 deltay1 = 5;
 while (x < width)
 {
   line(x,y,x1,y1);
   x = x + deltax;
   x1 = x1 + deltax2;
   y1 = y1 + deltay1;
 }
 
 //Letter M
 a = 15;
 b = 0;
 wd = 400;
 ht = 400;
 noStroke();
 fill(2,34,206);
 beginShape();
   vertex(a + .6*wd, b + .05*ht);
   vertex(a + .675*wd, b + .05*ht);
   vertex(a + .775*wd, b + .125*ht);
   vertex(a + .875*wd, b + .05*ht);
   vertex(a + .95*wd, b + .05*ht);
   vertex(a + .95*wd, b + .45*ht);
   vertex(a + .85*wd, b + .45*ht);
   vertex(a + .85*wd, b + .2*ht);
   vertex(a + .775*wd, b + .25*ht);
   vertex(a + .7*wd, b + .2*ht);
   vertex(a + .7*wd, b + .45*ht);
   vertex(a + .6*wd, b + .45*ht);
   vertex(a + .6*wd, b + .05*ht);
endShape();

 //Letter M Triangle Decorations
 xt1 = 235;
 yt1 = 30;
 xt2 = 255;
 yt2 = 20;
 yt3 = 40;
 deltayt = 20;
 while (yt3 < height/2)
 {
   triangle(xt1,yt1,xt2,yt2,xt2,yt3);
   yt1 = yt1 + deltayt;
   yt2 = yt2 + deltayt;
   yt3 = yt3 + deltayt;
 }
 
 //Letter a
 elx = 190;
 ely = 230;
 lnx1 = 270;
 lny1 = 225;
 lnx2 = 280;
 lny2 = 305;
 wd2 = 160;
 ht2 = 150;
 noFill();
 stroke(1,13,77);
 strokeWeight(45);
 ellipse(elx, ely, wd2, ht2);
 line(lnx1,lny1,lnx2,lny2);

//Letter a Triangle Decorations
 noStroke();
 fill(1,13,77);
 xt1 = 300;
 yt1 = 190;
 xt2 = 280;
 yt2 = 180;
 yt3 = 200;
 deltayt = 20;
 deltaxt = 3;
 while (yt3 < .85*height)
 {
   triangle(xt1,yt1,xt2,yt2,xt2,yt3);
   xt1 = xt1 + deltaxt;
   yt1 = yt1 + deltayt;
   xt2 = xt2 + deltaxt;
   yt2 = yt2 + deltayt;
   yt3 = yt3 + deltayt;
 }

//Letter K
fill(222,227,255);
beginShape();
 vertex(a + .05*wd, b + .05*ht);
 vertex(a + .15*wd, b + .05*ht);
 vertex(a + .15*wd, b + .475*ht);
 vertex(a + .3*wd, b + .35*ht);
 vertex(a + .425*wd, b + .35*ht);
 vertex(a + .2*wd, b + .55*ht);
 vertex(a + .425*wd, b + .95*ht);
 vertex(a + .325*wd, b + .95*ht);
 vertex(a + .15*wd, b + .65*ht);
 vertex(a + .15*wd, b + .95*ht);
 vertex(a + .05*wd, b + .95*ht);
 vertex(a + .05*wd, b + .05*ht);
endShape();
 
 //Letter K Triangle Decorations
 xt1 = 15;
 yt1 = 30;
 xt2 = 35;
 yt2 = 20;
 yt3 = 40;
 deltayt = 20;
 while (yt3 < .975*height)
 {
   triangle(xt1,yt1,xt2,yt2,xt2,yt3);
   yt1 = yt1 + deltayt;
   yt2 = yt2 + deltayt;
   yt3 = yt3 + deltayt;
 }
}

