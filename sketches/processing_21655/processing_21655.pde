
Rect myRect;
float x1,x2,x3,y1,y2,y3;
float rectSize1;
float rectSize2;
float rectSize3;

 
void setup(){
  size(300,300);
  myRect = new Rect();
   
  rectSize1 = random(100);
  rectSize2 = random(100);
  rectSize3 = random(100);
   

   
  rectMode(CENTER);
  noStroke();
}
 
void draw(){
 background(255);
 myRect.update();
 myRect.display();
}

class Rect {


Rect(){
}

void update(){
  
 
 if(rectSize1 > width) {
   rectSize1 = 1;
   x1 = random(20,width-20);
   y1 = random(20,width-20);
 }
  if(rectSize2 > width) {
   rectSize2 = 1;
   x2 = random(20,width-20);
   y2 = random(20,width-20);
 }
  if(rectSize3 > width) {
   rectSize3 = 1;
   x3 = random(20,width-20);
   y3 = random(20,width-20);
 }
  
 rectSize1++; 
 rectSize2++;  
 rectSize3++; 
}

void display(){
 fill(255,0,0,50);
 rect(x1,y1,rectSize1,rectSize1);
 fill(0,255,0,50);
 rect(x2,y2,rectSize2,rectSize2);
 fill(0,0,255,50);
 rect(x3,y3,rectSize3,rectSize3);
}
}
  


