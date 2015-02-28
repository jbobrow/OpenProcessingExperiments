
float x;
float y;
float ySpeed;

PImage balloon;
float bx;
float bxSpeed;

PImage cloud;
float cy1;
float cy2;
float cys1;
float cys2;

float rx1;
float rx2;
float rx3;
float rx4;
float rx5;
float rxSpeed1;
float rxSpeed2;
float rxSpeed3;
float rxSpeed4;



void setup(){
  size(500,700);
  smooth();
  noStroke();
  rectMode(CORNER);
  
  balloon = loadImage( "balloon.png");
  cloud = loadImage ("cloud2.png");
  
  y = height/2;
  ySpeed = 5;
  
  bx = width/2;
  bxSpeed = 5;
  
  cy1 = 0;
  cy2 = -500;
  cys1 = 0.5;
  cys2 = 1;
  
  rx1 = -100;
  rx2 = -200;
  rx3 = -3000;
  rx4 = -4000;
  rxSpeed1 = 2;
  rxSpeed2 = 3;
  rxSpeed3 = 5;
  rxSpeed4 = 7;
  
  
  
  

}

void draw(){
  background(255);
  fill(255,0,0);
  
  //balloon----------------------
  image(balloon, bx, mouseY, 100,140);
  if ( mouseX < width/2 && mousePressed){
   bx = bx - bxSpeed;
  }
  
  if ( mouseX > width/2 && mousePressed){
   bx = bx + bxSpeed;
  }
  
  //cloud------------------- 
  image(cloud, 50, cy1, 150, 88);
   cy1 += cys1;
  image(cloud, 400, cy2, 150, 88);
   cy2 += cys2;

 //obstacle------------------------
  
  fill(#666000);
  rx1 += rxSpeed1;
 // rx1 += rxSpeed2;
 // rx2 += rxSp3ed1;
  rx2 += rxSpeed2;
 // rx3 += rxSpeed1;
 // rx3 += rxSpeed2;
  rx3 += rxSpeed3;
  rx4 += rxSpeed4;
  
  rect(width/2, rx1, 20,20);
  rect(400, rx3, 20,20);
  rect(70, rx2, 20,20);
  rect(200, rx4, 10,10);
  rect(350, rx4, 20,20);



}

 


