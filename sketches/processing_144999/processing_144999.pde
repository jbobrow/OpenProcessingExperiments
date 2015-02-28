
// Konkuk University   
// Department of Dynamic Media   
// SOS iDesign   
// Name: KIM Young Ji  
// ID: 201420069  

int x = 0;  
int y = 0;  
int xspeed = 1;  
int yspeed = 2;    

void setup() {  
  size(1024, 768);  
  background(255);  
  strokeWeight(5);   
}  

void draw() {     
  background(50,50,50,100);
  fill(200,200,0,130);
  quad (y,x,width,width,height,width,height,width);   
  strokeWeight(6);
  fill(0,200,0,100);  
  quad (x,y,width-x,x,y,height+y,x,y);      
  fill(0,0,100,150);
  quad (x,y,width+x,x,y,height-y,x,y);    
  fill(200,0,0,200);
  strokeWeight(10);    
  quad (width,y,width-x,x,y,height+y,x,y);    
  fill(0,0,200,100);  
  quad (x,y,width-x,width,height,height+y,x,y);    
  fill(0,100,100,100);  
  strokeWeight(20);
  quad (x,y,width-x,x,y,height+y,x,y);
  noFill();  
  quad (y,x,width-x,width,y,height+y,x,height);
  fill(200,200,0,130);
  quad (y,x,width,width,height,width,height,width); 
  
  x = x + xspeed;  
  y = y + yspeed;  
  
  if ((x>width) || (x<0)) {  
    xspeed = xspeed*-1;  
  } 
  if ((y>height) || (y<0)) {  
    yspeed = yspeed*-1;  
  }  
  } 
