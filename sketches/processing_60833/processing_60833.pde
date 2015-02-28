
//HW 2 - Sarah Lesnikoski
/*     If you focus on the center of the bouncing ball long enough (30 sec) it 
       will start to faintly tint yellow when it is overlapping the blue
       ellipse. And as it overlaps the black space it appears to flash
       back to undiluted white. */

int x;
int y;
 
int directionx;
int directiony;


void setup(){
  size(600,600);
  smooth();
  
  x= 300;
  y= 375;
  directionx = 1;
  directiony = 1;
 
}

void draw(){
  background(0);
  x += directionx;
  y += directiony;
  
 if(y >= 475){
   directiony = -1;
 }
 
 if(x >= 475){
   directionx = -1;
 }
 
 if(y <= 125){
   directiony = +1;
 }
 
 if(x <= 125){
   directionx = +1;
 }
 
 fill(127,0,255);
 ellipse(300,300,300,300);
 noStroke();

 
 fill(255);
 ellipse(x,y,50,50);
 noStroke();

}
 
 // code from class "bouncing ball" project. 

