
float pelotaX, pelotaY;
float ROCE = 0.051;
float difX, difY;
float elliY = 150; 
float elliX = 100;
int velX=3; 
int velY=4; 

 void setup() { 
  size(500, 500); 
 fill(255);
  background(0); 
  noStroke();
 } 
void draw() {
  
  difX = mouseX - pelotaX; 
  difY = mouseY - pelotaY; 
 pelotaX += difX * ROCE; 
  pelotaY += difY * ROCE; 
 
 stroke(255); 
  fill(mouseX,mouseY,54,15); 
noStroke();
  
int raggio = 60; 
 
  if(elliX + raggio/2 > width || elliX - raggio/2 < 0) velX*=-1; 
 
 
  if(elliY + raggio/2> height || elliY - raggio/2 < 0) velY*=-1; 
  ellipse(elliX,elliY,raggio,raggio); 
 
  elliX +=velX; 
  elliY+=velY ; 
 
  if(elliX >=width){ 
    elliX = elliX-1; 

  translate(0,0);
  ellipse(500/2, 500/2, 30, 30); 
 




  }   
}
void mouseReleased(){ 
  if (mousePressed == true) 
    background(0);
   else 
    background(0);
  
  }

