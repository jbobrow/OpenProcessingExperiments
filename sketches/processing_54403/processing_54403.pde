
/* Done by Keya Vadgama
YSDN
Winter 2012
*/

float x;
 float y;
  
 float xVel = 2;
 float yVel = 3;
  
void setup() {
   size(250,250);
   smooth();
   
}
 
void draw() {
  background (0);
  
  x += xVel;
  y += yVel;
   
  if (y > height || y < 0 ){
      yVel = yVel * -1;}
       
   if (x > width || x < 0 ){
      xVel = xVel * -1;}
 
 
  
   fill(255, 242, 0);
  noStroke(); 
  ellipse(125,125,x,y);
   
   fill(255, 0, 116);
  noStroke(); 
  ellipse(125,125,x/2,y/2);
  
  fill(0, 122, 255);
  noStroke(); 
  ellipse(125,125,x/4,y/4);  
   
}
                
