
PImage img0; 
float y = 740;
float x = 100;


//first balloon
float x1 = 100;
float y1 = 480;
float x1speed = 0.5;
float y1speed = 0.75;
float x1wide = 300;
float y1tall = 300;

//second balloon
float x2 = 500;
float y2 = 400;
float x2speed = -1;
float y2speed = -0.5;
float x2wide = 200;
float y2tall = 200;



float shrinkspeed = .5;



//background image
void setup(){
  size(500,790);
  img0=loadImage("girlwithballoon.jpg");
  stroke(0);
    smooth();

}

void draw(){
  background(255);
  image(img0,25,25);
  color mycolor=#F0B3B3; 
  color white=#F0E3E3;
  noStroke();
  fill(mycolor, 170);

  x1 = x1 + x1speed;
  y1 = y1 - y1speed;
  x1wide = x1wide - shrinkspeed;
  y1tall = y1tall - shrinkspeed;
    noStroke();
    ellipse(x1,y1,x1wide,y1tall);
     
  if (x1wide < 0){
    x1 = 100;
    y1 = 480;
    x1wide = 200;
    y1tall = 200;}

//second balloon
  x2 = x2 + x2speed;
  y2 = y2 + y2speed;
  x2wide = x2wide - shrinkspeed;
  y2tall = y2tall - shrinkspeed;
  fill(white, 170);
    noStroke();
    ellipse(x2,y2,x2wide,y2tall);
     
  if (x2wide < 0){
    x2 = 600;
    y2 = 280;
    x2wide = 300;
    y2tall = 300;}
  
}




