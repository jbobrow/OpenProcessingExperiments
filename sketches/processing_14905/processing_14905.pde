
// code altered from  Preiscilla Boatwright
//altered remy lagrange


int xPosition = 0;
int speed = 5;
int xPositionb = 100;
int speedb =2;

 
 
void setup(){
  size(400,400);
}

 
void draw(){
  background(0);
  fill(255);
  noStroke ();
  triangle(xPosition, 200, 150, 100, xPositionb, 200);
fill(20, 100, 160);
  noStroke ();
  triangle(xPosition, 250, 150, 100, xPosition, 200);
  triangle(xPosition, 150,150,100,xPosition,150);
  triangle(xPosition, 100,100,100, xPosition, 100);
  
   xPosition= xPosition + speed;
  xPositionb= xPositionb+ speedb;
   



 
fill(177,162,135);
quad(178,480, 90,162,90, 162, 198,480);
 
fill(177,162,135);
quad(406,480, 108,154,108, 154, 424,480);
 
fill(177,162,135);
quad(640,471, 145,153,145, 153, 640,454) ;
 
fill(177,162,135);
quad(640,345, 196,157,196, 157, 640,333) ;
 
fill(177,162,135);
quad(640,269, 219,150,219, 150, 640,263) ;
 
fill(177,162,135);
quad(640,225, 240,145,240, 145, 640,220) ;    

fill(177,162,135);
quad(178,480, 90,162,90, 162, 198,480);
 
fill(177,162,135);
quad(406,480, 108,154,108, 154, 424,480);
 
fill(177,162,135);
quad(640,471, 145,153,145, 153, 640,454) ;
 
fill(177,162,135);
quad(640,345, 196,157,196, 157, 640,333) ;
 
fill(177,162,135);
quad(640,269, 219,150,219, 150, 640,263) ;
 
fill(177,162,135);
quad(640,225, 240,145,240, 145, 640,220) ;  
     


} 
 
   
                
                
