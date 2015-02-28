
int x,y,x2,y2,x3,y3;
int directionx;
int directiony;
int directionx2;
int directiony2;
int directionx3;
int directiony3;
int xspeed = 10;
int yspeed = 10;
int colorValue;

 
void setup(){
 size(600,600);
 background(340);
 smooth();
  directionx = 20;
  directiony = 10;
  directionx2 = 0;
  directiony2 = 0;
  directionx3 = 5;
  directiony3=5;
  x = 30;
  y = 40;
  x2=100;
  y2 = 56;
  x3 = 150;
  y3 = 170;
  colorValue = 0;
}
 
void draw(){
 
  x +=directionx;
  y +=directiony;
  if(x > width){
    directionx = -5;
  }
     
  if(y > height){
    directiony = -5;
   
     
  
  }
   
  if(x < 0){
    directionx = 60;
     
  }
   
  if(y < 0){
    directiony = 70;
  }
  smooth();
  fill(280,79,90);
  noStroke();
  ellipse(x,y,20,20);
 
   
}


