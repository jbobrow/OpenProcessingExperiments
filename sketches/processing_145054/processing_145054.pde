
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Hyeri Kim
// ID: Hyeri Kim 201420075

int x = 0; 
int y = 0; 
int i=2; 
int l=2; 
int xSpeed = 6; 
int ySpeed = 5; 
int iSpeed = 2; 
int lSpeed = 3; 
float mPos = 0; 

void setup() {
  size(600,600);
  smooth();
  frameRate(15); 
  background(255);
  
  
}

void draw() {
  x = x + xSpeed; 
  y = y + ySpeed; 

  if ((x > width/2) || (x < 0)) { 
    xSpeed = xSpeed * -1; 


  } 
  
   if ((y > height) || (y < 0)) { 
    ySpeed = ySpeed * -1; 

 

  } 


  strokeWeight(3); 
  noStroke(); 
  fill(255,0,y,0); 
  quad(x, y, width-x, 0, width-x, height-y, 0, height-y); 
  fill(x,0,y,300); 
  quad(x,y,600,width-x,x,width-x,y,y); 
  fill(y,290,x,100); 
  quad(0,y,600,width-x,x,width+x,600,y); 
  fill(x,300,y,0); 
  
  
  i = i + iSpeed; 
  l = l + lSpeed; 
  
  
    if ((i > width) || (i < 0)) { 
    iSpeed = iSpeed * -1; 


  } 

    


  if ((l > width) || (l < 0)) { 
    lSpeed = lSpeed * -1; 


  } 



 
  strokeWeight(1); 
  stroke(0); 
  fill(255,y,0,x); 
  quad(i,l,width-i,0,width-i,height-l,0,height-l); 
  fill(255,0,y,0); 
  quad(x,y,width-x,0,0,height-y,width-x,width-x); 
  fill(x,5,y,63); 
  quad(x,y,0,width-x,x,height+y,x,x); 
  fill(205,255,0,x); 
  quad(i,l,width-i,0,width-i,height-l,0,height-l);  
 


  


} 


  
  
