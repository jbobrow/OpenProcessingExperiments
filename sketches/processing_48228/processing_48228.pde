
int x = 0;
int y=0;
int a=10;
int b=10;
int rad=b/2;
 
int grandezza=5;
  
int x1 = 200;
int y1 = 200;
  
int speedX=1;
int speedY=2;
  
int speedX1 =1;
int speedY1 = 10;
 
void setup(){
  size (400,400);
  smooth();
}
void draw(){
  fill (200,95);
  rect (0,0,400,400);
   
    if (x1>=width || x1<0) {
    speedX1 = speedX1 * -1;
  }
   
   if ( y1>=height || y1<0) {
    speedY1=speedY1 *-1;
     }
         
    noStroke();
    fill(250,mouseY,0);
      ellipse (x1, y1, grandezza, grandezza);
      ellipse (x1, y1, grandezza, grandezza);
    x1=x1+speedX1;
    y1=y1+speedY1;
     
    if (mousePressed == true) {
    a=a+3;
    b=b+2;
    rect (200,200,mouseY,b);
  }
   
float d= dist (x1,y1,200,200);
if (d<a/2){
  grandezza=0;
}
}
void mouseReleased() {
  a=0;
  b=0;
}
 


