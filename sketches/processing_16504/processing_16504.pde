
float r=0;
float w=width;
 
void setup(){
  size(250,250);
  
  smooth();
  frameRate(45);
 }
 
void draw(){
 

  colorMode(HSB);
  background(r,r,r);
  noStroke();

  
  fill (255-r,255-r,255-r);
   {if (r<width) {
   
   r++;}}
   ellipse (r, r, 10,10);
  ellipse (width-r, height-r, 10,10);
ellipse (width-r,r,10,10);
ellipse (r,height-r,10,10);


if ((width-r)==(r))//
{fill (255);ellipse (width-r, height-r, 10,10);}

if (mousePressed==true) {r=0;}
 
}

