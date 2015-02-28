

float a;
float b;
float c=200;
float d=0;
float x;
float y;
float e;
float r;
float f;
float g;
float h;
float i=0;
float j=0;
PImage img;
PImage img1;


void setup(){
  size(500,500);


  img=loadImage("green_grass.jpg");
  img1=loadImage("raices1.jpg");
}


void draw(){

  image(img,i,j,width,height-200);
  image(img1,i,height-200,width,height);
  noCursor();
  a=mouseX; 
  x=mouseX;

fill(255,167,33);
ellipse(a,285,30,30);
fill(0,14,255);
ellipse(c,d,10,10);
ellipse(e,f,10,10);
ellipse(g,h,10,10);

if (d>290){
  d=0;
  c=random(width);
}

if (f>290){
  f=0;
  e=random(width);
}

if (h>290){
  h=0;
  g=random(width);
}
if (dist(g,h,a,285)<20){
  noLoop();
}

if (dist(e,f,a,285)<20){
  noLoop();
}

if (dist(c,d,a,285)<20){
  noLoop();
}

  d=d+10;
  f=f+10;
  h=h+10;
}




