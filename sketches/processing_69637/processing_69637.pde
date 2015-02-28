
//Gloriana Gonzalez
//gloriang@andrew.cmu.edu
//Homework #4
//Copyright Gloriana Gonzale, Pittsburgh, August 2012

 
float x, y, a, b,n; 
int w=40;
int h=40;

float s, g;

color col;


void setup ()
{
  size (400, 400);
  smooth();  
  x=width*.5; 
  y=height*.5;
  w=40;
  h=40;
  a=10;
  b=10;
  n=1;
  col=color (255, 255, 255);
 
}

void draw()
{
background(col);
noFill();
noStroke();
colorMode(HSB);
rectMode(CENTER);
//move mouse to change background color
fill(mouseX, mouseX, mouseX, 70);
rect(x, y, w/2, h/2);
rect(x, y, w, h);
rect(x, y, w*2, h*2);
rect(x, y, w*4, h*4);
fill (col);

//moving rectangles
rect((frameCount%height), y*.25, a, b);
rect(x*.25, (frameCount%height), a, b);

rect((frameCount%height)*2, y*.5, a, b);
rect(x*.5, (frameCount%height)*2, a, b);

rect((frameCount%height)*3, y, a, b);
rect(x, (frameCount%height)*3, a, b);


rect((frameCount%height)*4, y*1.25, a, b);
rect(x*1.25, (frameCount%height)*4, a, b);

    
}
//change background square sizes
void mouseClicked() {
w= w*2;
h= h*2;

if(h>height) {
  h=40;
}
if (w>width) {
  w=40;
}
}
//change moving rectangle sizes
void keyPressed() {
  if (keyCode == SHIFT){
    a=a+20;
    b=b+20;
  if (a>width){
    a=10;
  }
   if (b>height){
    b=10;
   }
   
  }
  
  
}




