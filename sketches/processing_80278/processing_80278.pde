
/*Code created by Anne Marie Hood, YSDN Interactivity Project 3, Fall 2012*/

PImage img0;

int x= 0;

void setup (){
  size(600,450);
  frameRate (12);
  img0 = loadImage ("seats.jpg");
}

void draw (){
  image (img0, 0, 0);
  
  tint (255,x);  
    x+=13;
      if (x>245){
      x=0;}
  image (img0, -2, 0);
  
   tint (255,x);  
    x+=13;
      if (x>245){
      x=0;}
  image (img0, 0, 1);
  
     tint (255,x);  
    x+=13;
      if (x>245){
      x=0;}
  image (img0, 2, 0);
  
     tint (255,x);  
    x+=13;
      if (x>245){
      x=0;}
  image (img0, 1, 1);
  
       tint (255,x);  
    x+=13;
      if (x>245){
      x=0;}
  image (img0, 0, -1);
 
}

