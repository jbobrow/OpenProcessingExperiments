
float x, y; //position
float dx, dy; //change in position
Integer fr = 10;



void setup(){
  size(250,250);
  smooth();
  noStroke();
   background(#ffffff);
   frameRate(10);



  
  x = width;
  y = height;
  
  //set variable to change position
  dx =-5;
  dy =25;
}

void draw(){
  
  
 fill(#000000);
 rect(0,0,width,200);
  
  x=x+dx;
  y=y+dy;
  
  if(x>width) x=0;
  else if (x<0) x=width;
  if(y>height)y=0;
  else if (y<10) y=height;
  
  fill(x,mouseY,random(0,255),80);
ellipse(x,y,40,40);
ellipse(x,y,10,10);


  if (mousePressed){
    frameRate(fr*2);


}}

