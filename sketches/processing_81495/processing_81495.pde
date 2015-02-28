
/*Code created by Anne Marie Hood, YSDN Interactivity Project 3, Fall 2012*/

PImage img0;
PImage img1;
PImage img2;

int x= 0;

void setup (){
  size(300,400);
  frameRate (6);
  img0 = loadImage ("1.jpg");
  img1 = loadImage ("2.jpg");
  img2 = loadImage ("4.jpg");
}

void draw (){
  image (img0, -30, 0);
  
  tint (255,x);  
    x+=13;
      if (x>245){
      x=0;}
  image (img1, -30, 0);
  
   tint (255,x);  
    x+=13;
      if (x>245){
      x=0;}
  image (img2, -30, 0);
 
}

