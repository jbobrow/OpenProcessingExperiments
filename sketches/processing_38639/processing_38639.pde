
//initialize variables
int leftRodTopX = 140;
int leftRodTopY = 360;
int rightRodTopX = 165;
int rightRodTopY = 360;
int rectLeftX = 150;
int rectMidX = 155;
int rectTopY = 400;
int rectWidth = 10;
int rectHeight = 100;
float slingMid = 152.5;
float ellipseCenterX = pmouseX;
float ellipseCenterY = pmouseY;
float x;
float y;
float r;
float g;
float b;

boolean hasBeenReleased = false;
boolean winner = false;

PVector press;
PVector release; 

float gravity = 0;

void setup(){
size(1200,500);
background(255);
smooth();
//create initial slingshot
rect(rectLeftX,rectTopY,rectWidth,rectHeight);           //base
line(rectMidX,rectTopY,rightRodTopX,rightRodTopY);       //right rod
line(rectMidX,rectTopY,leftRodTopX,leftRodTopY);         //left rod
line(leftRodTopX,leftRodTopY,rightRodTopX,rightRodTopY); //string
rect(800,400,200,100);
}

void draw(){
if(mousePressed){
  background(255);
  bezier(900,400,880,375,880,325,912,320);
  fill(255,0,0);
  ellipse(mouseX, mouseY, 40, 40);
  noFill();
  bezier(rightRodTopX,rightRodTopY,mouseX,mouseY,mouseX,mouseY,leftRodTopX,leftRodTopY);
  fill(0,0,255);
  rect(rectLeftX,rectTopY,rectWidth,rectHeight);
  noFill();
  line(rectMidX,rectTopY,rightRodTopX,rightRodTopY);
  line(rectMidX,rectTopY,leftRodTopX,leftRodTopY);
  line(mouseX,mouseY,slingMid,leftRodTopY);
  stroke(0);
  fill(127,255,212);
  rect(900,400,25,100);
  stroke(0);
  fill(255);
  //ellipse(912,375,50,150); 
  bezier(925,400,945,375,945,325,912,320);
}
 
if(mousePressed==false){
  background(255);
  fill(0,0,255);
  rect(rectLeftX,rectTopY,rectWidth,rectHeight);
  noFill();
  line(rectMidX,rectTopY,rightRodTopX,rightRodTopY);       //right rod
  line(rectMidX,rectTopY,leftRodTopX,leftRodTopY);         //left rod
  line(leftRodTopX,leftRodTopY,rightRodTopX,rightRodTopY); //string
  stroke(0);
  fill(127,255,212);
  rect(900,400,25,100);
  stroke(0);
  fill(255);
  //ellipse(912,375,50,150); 
  bezier(900,400,880,375,880,325,912,320);
  bezier(925,400,945,375,945,325,912,320);
 }
 
 if(hasBeenReleased)
 {
   noFill();
   bezier(900,400,880,375,880,325,912,320);
   fill(255,0,0);
   ellipse(release.x, release.y, 40, 40);
   release.add(press);
   release.y+=gravity;
   gravity+=0.6;
   //println(release.y);  
   noFill();
   bezier(925,400,945,375,945,325,912,320);
   
   if(release.y>=330&&release.y<=380&&release.x>=900&&release.x<=1000){
     winner = true;
   }
 }

 if(winner){
   x = random(0,1200);
   y = random(0,500);
   r = random(0,255);
   g = random(0,255);;
   b = random(0,255);
   fill(r,g,b);
   ellipse(x,y,50,50);
   println(winner);
 }
}

void mousePressed()
{
  press = new PVector(mouseX, mouseY);
  winner = false;
}

void mouseReleased(){
  float cSquared = sqrt(((mouseY-leftRodTopY)*(mouseY-leftRodTopY))+((slingMid-mouseX)*(slingMid-mouseX)))/5;
  release = new PVector(mouseX, mouseY);
  press.sub(release);
  press.normalize();
  press.mult(cSquared);
  hasBeenReleased = true;
  gravity = 0;
}

